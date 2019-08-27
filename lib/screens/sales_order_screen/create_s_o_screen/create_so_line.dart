import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/master/select_product.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/uom_conversion.dart';
import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';
import 'package:forca_so/models/tax/tax.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateSOLine extends StatefulWidget {
  final List<Tax> listTax;
  final ValueChanged<SoLine> line;
  final PriceList priceList;
  final SoLine lineItem;

  CreateSOLine(this.listTax, this.line, this.priceList, [this.lineItem]);

  @override
  _SOLineState createState() => _SOLineState(listTax, line, priceList, lineItem);
}

class _SOLineState extends State<CreateSOLine> {
  Product selectedProduct = Product();
  Uom selectedUom = Uom();
  UomConversion selectedUomTo = UomConversion();
  UomConversion selectedUomFrom = UomConversion();
  Tax selectedTax = Tax();
  List<Uom> listUom = List();
  List<UomConversion> listUomConversion = List();
  final List<Tax> listTax;
  final PriceList priceList;
  final ValueChanged<SoLine> line;
  SoLine myline = SoLine();
  SoLine lineItem;
  bool _onChangedTax = false;
  bool _inputQtyEmptyWarning = false;
  bool _onChangedProduct = false;
  bool _onChangedUom = false;

  var priceController,
      QtyController, qtyConvertController,
      discountController,
      productController,
      uomController;

  _SOLineState(this.listTax, this.line, this.priceList, this.lineItem);

  setLine() {
    myline.taxName = selectedTax.taxName;
    myline.taxID = int.parse(selectedTax.taxID);
    _onChangedProduct ? myline.productID = int.parse(selectedProduct.productID) : "";
    _onChangedProduct ? myline.productName = selectedProduct.name : "";
    _onChangedUom ? myline.uomID = int.parse(selectedUom.uomID) : "";
    _onChangedUom ? myline.uomName = selectedUom.realName : "";
    priceController.text.isNotEmpty ? myline.price = double.parse(priceController.text.toString()) : "";
    QtyController.text.isNotEmpty ? myline.qty = QtyController.text.toString() : "";
    discountController.text.isNotEmpty ? myline.discount = int.parse(discountController.text.toString()) : "";

    qtyConvertController.text.isNotEmpty ? myline.qtyConversion = qtyConvertController.text.toString() : "";
    QtyController.text.isNotEmpty ? myline.qty = QtyController.text.toString() : "";
  }

  _initEditLine() {
    myline.idLine = lineItem.idLine;
    myline.lineNo = lineItem.lineNo;
    myline.taxName = lineItem.taxName;
    myline.taxID = lineItem.taxID;
    myline.productID = lineItem.productID;
    myline.productName = lineItem.productName;
    myline.uomID = lineItem.uomID;
    myline.uomName = lineItem.uomName;
    myline.price = lineItem.price;
    myline.qty = lineItem.qty;
    myline.priceDisplay = lineItem.priceDisplay;
    QtyController.text = lineItem.qty.toString();
    myline.discount = lineItem.discount;
    listTax.forEach((t) => int.parse(t.taxID) == lineItem.taxID ? selectedTax = t : ""); //lupa gunanya buat apa????
    selectedUomTo.uomId = lineItem.uomID.toString();
    _getProduct();
  }

  @override
  void initState() {
    selectedTax = listTax[0];
    priceController = TextEditingController();
    QtyController = TextEditingController();
    qtyConvertController = TextEditingController();
    discountController = TextEditingController();
    productController = TextEditingController();
    uomController = TextEditingController();
    selectedProduct.priceList = List();
    if(lineItem != null){
      _initEditLine();
    }
    super.initState();
  }

  _getProduct() async {
    if(myline.productID != null){
      await reqProduct(productID: myline.productID.toString())
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
              _onChangedProduct = true;
              productController.text = selectedProduct.name;
              selectedProduct.priceList[0].standartPrice != "0.0" ? priceController.text = selectedProduct.priceList[0].standartPrice : "";
              listUom.clear();
              listUom.addAll(selectedProduct.uom);//ini uom default product
              listUom.addAll(selectedProduct.uomConversion);//ini berisi uom conversi nya
              uomController.text =
              listUom.isEmpty ? '' : listUom[0].realName;
              selectedUom = listUom.isEmpty ? Uom() : listUom[0]; // index 0 karena uom di product diselect pertama
              selectedUomFrom.uomId = selectedUom.uomID;
              _onChangedUom = true;
              Navigator.pop(context);
            });
          },priceList.priceListID, ),
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
                        _onChangedUom = true;
                        uomController.text = listUom[i].realName;
                        selectedUom = listUom[i];
                        selectedUomTo.uomId = selectedUom.uomID;
                        selectedUomFrom.uomId == selectedUomTo.uomId ? qtyConvertController.text = QtyController.text : "";
                        //ToDO: check on API can i submit the same uom from and uom to ?
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
            qtyConvertController.text = message.toString();
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
                      child: forcaText("Create SO Line", color: Colors.white),
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
                                        hintText: lineItem == null ? "Select Product" : lineItem.productName,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _showProducts())),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                            Column(
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
                                      controller: QtyController,
                                      onChanged: (qty){
                                        print("qty changed $qty");
                                        print(QtyController.text);
                                        selectedUomFrom.uomId != null && selectedUomTo.uomId != null
                                            ? selectedUomFrom.uomId != selectedUomTo.uomId
                                            ? calculateUomConversion()
                                            : qtyConvertController.text = QtyController.text
                                            : "";
                                      },
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          fontFamily: "Title",
                                          color: Colors.black,
                                          fontSize: 14.0),
                                      decoration: InputDecoration(
                                          hintText: lineItem == null ? 'Enter QTY of product' : lineItem.qty.toString(),
                                          errorText:_inputQtyEmptyWarning ?"isi qty dulu" : null
                                      ),
                                    ))
                              ],
                            ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Price",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            Container(
                                width:
                                MediaQuery.of(context).size.width / 2 - 30,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: priceController,
                                  enabled: selectedProduct.priceList.isNotEmpty
                                      ? selectedProduct
                                      .priceList[0].standartPrice ==
                                      "0.0" || selectedProduct.priceList[0].standartPrice ==
                                      "0"
                                      ? true
                                      : false
                                      : true,
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      color: Colors.black,
                                      fontSize: 14.0),
                                  decoration: InputDecoration(
                                      hintText: lineItem == null ? 'Enter price of product' : lineItem.price.toString()),
                                ))
                          ],
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
                                controller: uomController,
                                enabled: lineItem == null ? true : false,
                                decoration: InputDecoration(
                                    hintText: lineItem == null ? "Select UOM" : lineItem.uomName,
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        onPressed: () => _selectUOM(),
                                    )
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
                                "TAX",
                                style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              DropdownButton<Tax>(
                                value: selectedTax,
                                hint: Text("Select product"),
                                items: listTax.map((tax) {
                                  return DropdownMenuItem(
                                    child: Text(tax.taxName),
                                    value: tax,
                                  );
                                }).toList(),
                                onChanged: (newTax) {
                                  setState(() {
                                    selectedTax = newTax;
                                    _onChangedTax = true;
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Discount",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            Container(
                                width:
                                MediaQuery.of(context).size.width / 2 - 30,
                                child: TextField(
                                  controller: discountController,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      color: Colors.black,
                                      fontSize: 14.0),
                                  decoration: InputDecoration(
                                      hintText: lineItem == null ? 'Enter Discount Product' : lineItem.discount.toString()),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    margin: EdgeInsets.only(right: 16.0, left: 16.0),
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
                                    "Convertion QTY",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.width / 2 - 30,
                                      child: TextField(
                                        controller: qtyConvertController,
                                        readOnly: true,
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
