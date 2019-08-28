import 'dart:convert';

import 'package:forca_so/master/master_presenter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/list_line.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/uom_conversion.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/product.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateIMLine extends StatefulWidget {
  final ValueChanged<ListLine> line;
  final List<Locator> listLocator;
  final ListLine lineItem;

  CreateIMLine(this.listLocator, this.line,[this.lineItem]);
  @override
  _CreateIMLineState createState() => _CreateIMLineState(listLocator,line,lineItem);
}

class _CreateIMLineState extends State<CreateIMLine> {
  Product selectedProduct = Product();
  Locator selectedLocatorFrom = Locator();
  Locator selectedLocatorTo = Locator();
  UomConversion selectedUomFrom = UomConversion();
  UomConversion selectedUomTo = UomConversion();
  Uom selectedUOM = Uom();
  List<Uom> listUom = List();
  ListLine lineItem;
 final ValueChanged<ListLine> line;
 bool _onChangeProduct = false;
 bool _onChangeUom = false;
 bool _inputQtyEmptyWarning = false;
  final List<Locator> listLocator;
  ListLine myLine = ListLine();
  var productController, QtyController, uomController, QtyConversionController;

  _CreateIMLineState(this.listLocator, this.line,this.lineItem);

  setLine() {
    myLine.line_number = null ?? "";
    _onChangeProduct ? myLine.m_product_id = int.parse(selectedProduct.productID) :"";
    _onChangeProduct ? myLine.productName = selectedProduct.name : "";
    _onChangeUom ? myLine.UomName = selectedUOM.name : "";
    _onChangeUom ?  myLine.forca_c_uom_id = int.parse(selectedUOM.uomID) : "";
    myLine.locatorFrom = selectedLocatorFrom.locator_name;
    myLine.m_locator_id = int.parse(selectedLocatorFrom.m_locator_id);
    myLine.m_locatorto_id = int.parse(selectedLocatorTo.m_locator_id);
    myLine.locatorTo = selectedLocatorTo.locator_name;
    QtyController.text.isNotEmpty ? myLine.forca_qtyentered = QtyController.text.toString() :"";

    QtyConversionController.text.isNotEmpty ? myLine.qtyConversion = QtyConversionController.text.toString() : "";
  }

  _initEditLine() async{
   myLine.idLine = lineItem.idLine;
   myLine.m_locator_id = lineItem.m_locator_id;
   myLine.m_locatorto_id = lineItem.m_locatorto_id;
   listLocator.forEach((g)=>int.parse(g.m_locator_id) == lineItem.m_locator_id ? selectedLocatorFrom = g : "");
   listLocator.forEach((t)=>int.parse(t.m_locator_id)== lineItem.m_locatorto_id ? selectedLocatorTo = t : "");
   myLine.locatorFrom = lineItem.locatorFrom;
   myLine.locatorTo = lineItem.locatorTo;
   myLine.productName = lineItem.productName;
   myLine.m_product_id = lineItem.m_product_id;
   myLine.forca_qtyentered = lineItem.forca_qtyentered;
//   myLine.movementqty = lineItem.movementqty;
   myLine.UomName = lineItem.UomName;
//   QtyController.text = lineItem.movementqty.toString();
   myLine.forca_c_uom_id = lineItem.forca_c_uom_id;
   print("isine line item uom id ${lineItem.forca_c_uom_id}");
   selectedUomTo.uomId = lineItem.forca_c_uom_id.toString();
  await _getProduct();
  }

  calculateUomConversion()async{
//    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CALCULATED_UOM_CONVERSION";
    print("iki url calucalte $url");
    var mybody = {
      "m_product_id" : selectedProduct.productID.toString(),
      "c_uom_from_id" : selectedUomFrom.uomId.toString(),
      "c_uom_to_id" : selectedUomTo.uomId.toString(),
      "qty" : QtyController.text == "" ? "0" : QtyController.text,
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
        if(res["resultdata"][0] != null){
          var  message = res["resultdata"][0]["qty"];
          setState(() {
            QtyConversionController.text = message.toString();
          });
        }
      }
//      Navigator.pop(context);
    } else {
      print(response.statusCode);
      Navigator.pop(context);
      Navigator.pop(context);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    QtyConversionController = TextEditingController();
    productController = TextEditingController();
    QtyController = TextEditingController();
    uomController = TextEditingController();
    if(lineItem != null){
      _initEditLine();
    } else{
      selectedLocatorFrom = listLocator[0];
      selectedLocatorTo = listLocator[0];
    }
    super.initState();
  }

  _getProduct() async {
    if(myLine.m_product_id != null){
      await reqProduct(productID: myLine.m_product_id.toString())
          .then((listProduct) {
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

  _showProducts() {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              content: SelectProduct((product) {
                setState(() {
                  selectedProduct = product;
                  _onChangeProduct = true;
                  productController.text = selectedProduct.name;
                  print(selectedProduct.productID);
                  listUom.clear();
                  listUom.addAll(selectedProduct.uom);
                  listUom.addAll(selectedProduct.uomConversion);
                  uomController.text =
                      listUom.isEmpty ? '' : listUom[0].realName;
                  selectedUOM = listUom.isEmpty ? Uom() : listUom[0];
                  selectedUomFrom.uomId = selectedUOM.uomID;
                  _onChangeUom = true;
                  Navigator.pop(context);
                });
              }),
            ));
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
                                _onChangeUom = true;
                                uomController.text = listUom[i].realName;
                                selectedUOM = listUom[i];
                                selectedUomTo.uomId = selectedUOM.uomID;
                                print("iki isine selecteduomto ${selectedUomTo.uomId}");
                                selectedUomFrom.uomId == selectedUomTo.uomId ? QtyConversionController.text = QtyController.text : "";
                                QtyController.text =="" ? _inputQtyEmptyWarning = true : "";
                                QtyController.text.isNotEmpty && selectedUomFrom.uomId != selectedUomTo.uomId ? calculateUomConversion() : "";
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              height: 35.0,
                              color:
                                  i % 2 == 0 ? Colors.white : Colors.grey[300],
                              child: Center(
                                child: forcaText(listUom[i].realName),
                              ),
                            ),
                          ),
                      itemCount: listUom.length,
                    ),
                  )
                ],
              ),
            ));
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
                      child: forcaText(widget.lineItem == null ?"Create IM Line" : "Edit IM Line", color: Colors.white),
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
                                  TextField(
                                    controller: productController,
                                    decoration: InputDecoration(
                                        hintText:lineItem == null ? "Select Product" : lineItem.productName,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _showProducts())),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Locator From",
                                    style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<Locator>(
                                    value: selectedLocatorFrom,
                                    hint: Text("Selected Locator From"),
                                    items: listLocator.map((locator) {
                                      return DropdownMenuItem(
                                        child: Text(locator.locator_name),
                                        value: locator,
                                      );
                                    }).toList(),
                                    onChanged: (newLocator) {
                                      setState(() {
                                        selectedLocatorFrom = newLocator;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
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
                                    "Locator To",
                                    style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<Locator>(
                                    value: selectedLocatorTo,
                                    hint: Text("Selected Locator To"),
                                    items: listLocator.map((locator) {
                                      return DropdownMenuItem(
                                        child: Text(locator.locator_name),
                                        value: locator,
                                      );
                                    }).toList(),
                                    onChanged: (newLocator) {
                                      setState(() {
                                        selectedLocatorTo = newLocator;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Qty",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 - 30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (qty){
                                       selectedUomFrom.uomId != null && selectedUomTo.uomId != null ?
                                       selectedUomFrom.uomId != selectedUomTo.uomId ?
                                       calculateUomConversion()
                                       : QtyConversionController.text = QtyController.text : "";
                                      },
                                      controller: QtyController,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: "Title"),
                                      decoration: InputDecoration(
                                        hintText: lineItem ==  null ?"Enter qty" : lineItem.forca_qtyentered.toString(),
                                        errorText: _inputQtyEmptyWarning ? " isi qty dulu" : null
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
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
                                    "UOM",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    controller: uomController,
                                    enabled: lineItem == null ? true : false,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: "Title"),
                                    decoration: InputDecoration(
                                        hintText: lineItem == null ? "Select UOM" : lineItem.UomName,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _selectUOM())),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    MediaQuery.of(context).size.width / 2 -
                                        30,
                                    child: TextField(
                                      readOnly: true,
                                      controller: QtyConversionController,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: "Title"),
                                    ),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: 20.0,
                  )),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                      onPressed: () {
                        try {
                          setLine();
                          line(myLine);
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
