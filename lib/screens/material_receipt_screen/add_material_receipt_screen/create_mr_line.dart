import 'dart:convert';
import 'dart:async';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/master/select_product.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/get_order_line.dart';
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


  CreateMRLine(this.listLocator, this.orderID, this.line,  this.warehouse);

  @override
  _MRLineState createState() => _MRLineState(listLocator, orderID, line, warehouse);
}

class _MRLineState extends State<CreateMRLine> {
  getOderLine selectedOrderLine = getOderLine();
  Product selectedProduct = Product();
  Uom selectedUom = Uom();
  final List<Locator> listLocator;
  final String orderID;
  List<Uom> listUom = List();
  Locator selectedLocator = Locator();
  final Warehouse warehouse;
  final ValueChanged<MrLine> line;
  MrLine myline = MrLine();
  var qtyController,
      productController,
      uomController;
  bool _onChangedUom = false;


  _MRLineState(this.listLocator, this.orderID, this.line, this.warehouse);



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    selectedLocator = listLocator[0];
    qtyController = TextEditingController();
    productController = TextEditingController();
    uomController = TextEditingController();
    super.initState();
  }


  _getOrderLineItem() async {
    selectProductOrdered(context, orderID, (orderline) {
      setState(() {
        this.selectedOrderLine = orderline;
        _getProduct();
      });
      Navigator.pop(context);
    });
  }

  setLine() {
    myline.m_locator_id = int.parse(selectedLocator.m_locator_id);
    myline.m_product_id = int.parse(selectedOrderLine.m_product_id);
    myline.productName = selectedOrderLine.m_product_name;
    myline.c_uom_id = int.parse(selectedOrderLine.c_uom_id);
    myline.c_orderline_id = int.parse(selectedOrderLine.c_orderline_id);
    myline.qty = int.parse(qtyController.text.toString());
  }


  _getProduct() async {
    Loading(context).show();
    await reqProduct(productID: selectedOrderLine.m_product_id)
        .then((listProduct) {
      setState(() {
        selectedProduct = listProduct[0];
        productController.text = selectedProduct.name;
        listUom.addAll(selectedProduct.uom);
        listUom.addAll(selectedProduct.uomConversion);
        uomController.text =
        listUom.isEmpty ? '' : listUom[0].realName;
        selectedUom = listUom.isEmpty ? Uom() : listUom[0];
        _onChangedUom = true;
      });
    });
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
                      child: forcaText("Create MR Line", color: Colors.white),
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
                                        hintText: "Select Product",
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
                                    decoration: InputDecoration(
                                        hintText: "Select UOM",
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _selectUOM())),
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
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        color: Colors.black,
                                        fontSize: 14.0),
                                    decoration: InputDecoration(
                                        hintText: 'Enter QTY of product'),
                                  ))
                            ],
                          ),
                        )
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
