import 'dart:convert';
import 'dart:async';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/master/select_product.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/get_order_line.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/uom_conversion.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/master/select_order.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateMRLine extends StatefulWidget {
  final List<Locator> listLocator;
  final String orderID;
  final ValueChanged<MrLine> line;
  final Warehouse warehouse;
  final MrLine mrLine;


  CreateMRLine(this.listLocator, this.orderID, this.line,  this.warehouse,[this.mrLine]);

  @override
  _MRLineState createState() => _MRLineState(listLocator, orderID, line, warehouse,mrLine);
}

class _MRLineState extends State<CreateMRLine> {
  getOderLine selectedOrderLine = getOderLine();
  Product selectedProduct = Product();
  Uom selectedUom = Uom();
  UomConversion selectedUomTo,selectedUomFrom = UomConversion();
  final List<Locator> listLocator;
  final String orderID;
  List<Uom> listUom = List();
  List<UomConversion> listUomConversion = List();
  Locator selectedLocator = Locator();
  final Warehouse warehouse;
  final ValueChanged<MrLine> line;
  MrLine myline = MrLine();
  MrLine mrLine;
  var qtyController,
      productController,
      uomController,qtyConversionController;
  bool _onChangedUom = false;
  bool _onChangeProduct = false;
  bool _inputQtyEmptyWarning = false;



  _MRLineState(this.listLocator, this.orderID, this.line, this.warehouse,this.mrLine);

  setLine() {
    myline.line_number = null ?? "";
    _onChangeProduct ? myline.m_product_id = int.parse(selectedOrderLine.m_product_id) :"";
      _onChangeProduct ? myline.productName = selectedOrderLine.m_product_name : "";
    _onChangedUom ? myline.uom_name = selectedUomTo.uomName : "";
    _onChangedUom ? myline.c_uom_id = int.parse(selectedUomTo.uomId) : myline.c_uom_id = int.parse(selectedOrderLine.c_uom_id);;
    myline.m_locator_id = int.parse(selectedLocator.m_locator_id);
    myline.m_product_id = int.parse(selectedOrderLine.m_product_id);
    myline.productName = selectedOrderLine.m_product_name;

    myline.c_orderline_id = int.parse(selectedOrderLine.c_orderline_id);
    myline.qty = qtyController.text.toString();
    qtyConversionController.text.isNotEmpty ? myline.qtyConversion = qtyConversionController.text.toString() : "";
    myline.locator_name = selectedLocator.locator_name;
    qtyController.text.isNotEmpty ? myline.qty = qtyController.text.toString() : "";
    print("iki myline qty ${myline.qty}");

  }
  _initEditLine()async{
    myline.m_inoutline_id = mrLine.m_inoutline_id;
    myline.m_product_id = mrLine.m_product_id;
    myline.m_locator_id = mrLine.m_locator_id;
    listLocator.forEach((g)=>int.parse(g.m_locator_id) == mrLine.m_locator_id ? selectedLocator = g :"");
    myline.locator_name = mrLine.locator_name;
    myline.productName = mrLine.productName;
    myline.productName = selectedOrderLine.m_product_name;
    myline.qty = mrLine.qty.toString();
    qtyController.text = myline.qty;
    myline.c_uom_id = mrLine.c_uom_id;
    mrLine.uom_name = mrLine.uom_name;
    selectedUomFrom.uomId = mrLine.c_uom_id.toString();

    await _getProductOrdered();
    await _getProduct();
  }

  @override
  void initState() {
    qtyConversionController = TextEditingController();
    qtyController = TextEditingController();
    productController = TextEditingController();
    uomController = TextEditingController();
    if(mrLine != null){
      _initEditLine();
    }else{
      selectedLocator = listLocator[0];
    }
    super.initState();
  }


  _getOrderLineItem() async {
   await selectProductOrdered(context, orderID, (orderline) {
      setState((){
        this.selectedOrderLine = orderline;
        productController.text = orderline.m_product_name;
        uomController.text = orderline.c_uom_name;
        selectedUomFrom.uomId = orderline.c_uom_id;
        listUomConversion.addAll(selectedOrderLine.uomConversion);
      });
    });
  }
  _getProductOrdered() async {
    await reqOrderLine(orderID)
        .then((listProduct) {
      setState(() {
        this.selectedOrderLine = listProduct[0];
        listUomConversion.addAll(selectedOrderLine.uomConversion);
      });
    });
  }

  _getProduct() async{
    if(myline.m_product_id != null){
      await reqProduct(productID: myline.m_product_id.toString()).then((listProduct){
        setState(() {
          selectedProduct = listProduct[0];
          selectedUomFrom.uomId = selectedProduct.uom[0].uomID;
          selectedUomFrom.uomName = selectedProduct.uom[0].realName;
          listUom.clear();
          listUom.addAll(selectedProduct.uom);
          listUom.addAll(selectedProduct.uomConversion);
        });
      });
    }
  }

  _selectUOM() {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 50.0,
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: forcaText("Select UOM",
                      color: Colors.white, fontSize: 20.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) => InkWell(
                    onTap: () {
                      setState(() {
                        _onChangedUom = true;
                        uomController.text = listUomConversion[i].uomName;
                        selectedUomFrom.uomId != listUomConversion[i].uomId ? selectedUomTo = listUomConversion[i] : "";
                        selectedUomTo.uomId != null?selectedUomFrom = selectedUomTo :"";
                        qtyController.text =="" ? _inputQtyEmptyWarning = true : "";
                        qtyController.text.isNotEmpty ? calculateUomConversion() : "";
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      height: 35.0,
                      color:
                      i % 2 == 0 ? Colors.white : Colors.grey[300],
                      child: Center(
                        child: forcaText(listUomConversion[i].uomName),
                      ),
                    ),
                  ),
                  itemCount: listUomConversion.length,
                ),
              )
            ],
          ),
        ));
  }

  calculateUomConversion()async{
//    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CALCULATED_UOM_CONVERSION";
    print("iki url calucalte $url");
    var mybody = {
        "m_product_id" : selectedOrderLine.m_product_id.toString(),
        "c_uom_from_id" : mrLine != null ? selectedUomFrom.uomId.toString() : selectedOrderLine.c_uom_id.toString(),
        "c_uom_to_id" : selectedUomTo.uomId.toString(),
        "qty" : qtyController.text,
      };
    print("iki mybody calculated $mybody");
    var response = await http.post(url,body: mybody, headers:{"Forca-Token": user.token}).catchError((
        err) {
      print("error ${err.toString()}");
      Navigator.pop(context);
    });
    print("iki response calculated ${response.body}");
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      if(res["codestatus"] == "S"){
        var  message = res["resultdata"][0]["qty"];
      qtyConversionController.text =message.toString();
      }

    } else {
      print(response.statusCode);
      Navigator.pop(context);
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    color: Colors.blue[600],
                    child: Center(
                      child: forcaText(widget.mrLine == null ? "Create MR Line" : "Edit MR Line", color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Product",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: productController,
                                    decoration: InputDecoration(
                                        hintText: mrLine == null ? "Select Product" :mrLine.productName ,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _getOrderLineItem())),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "QTY",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.width / 2 - 30,
                                      child: TextField(
                                        controller: qtyController,
                                        keyboardType: TextInputType.number,
                                        onChanged: (qty){
                                          selectedUomFrom != null && selectedUomTo != null ?
                                              selectedUomFrom != selectedUomTo ?
                                              calculateUomConversion() :
                                             qtyConversionController.text = qtyController.text :
                                          qtyConversionController.text = qtyController.text ;
                                        },
                                        style: TextStyle(
                                            fontFamily: "Title",
                                            color: Colors.black,
                                            fontSize: 14.0),
                                        decoration: InputDecoration(
                                            hintText: selectedOrderLine.c_orderline_id == null? "Input Qty" : selectedUomTo == null ? myline.qty: selectedUomTo.qtyreserved.toString() ,
                                            errorText:_inputQtyEmptyWarning ?"isi qty dulu" : null
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    margin: EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Locator",
                                style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              DropdownButton<Locator>(
                                value: selectedLocator,
                                hint: Text("Select locator"),
                                items: listLocator.map((locator) {
                                  return DropdownMenuItem(
                                    child: Text(locator.locator_name),
                                    value: locator,
                                  );
                                }).toList(),
                                onChanged: (newLocator) {
                                  setState(() {
                                    selectedLocator = newLocator;
                                  });
                                },
                                isExpanded: true,
                              ),
                              Container(
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "UOM",
                                style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: uomController,
                                decoration: InputDecoration(
                                    hintText: mrLine == null ? "Select UOM" : mrLine.uom_name,
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        onPressed: () => mrLine == null ?_selectUOM(): "")
                                ),
                              ),
                              Container(
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    margin: EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Movement Qty",
                                style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2 - 30,
                                  child: TextField(
                                    readOnly: true,
                                    controller: qtyConversionController,
                                  )),
                              Container(
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                      onPressed: () {
                          try {
                            setLine();
                          line(myline);
                          } catch (exception) {
                            print("eception ${exception.toString()}");
                          }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.white,
                            fontSize: 17.0),
                      ),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
