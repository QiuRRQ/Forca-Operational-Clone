import 'package:flutter/material.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';
import 'package:forca_so/models/tax/tax.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/utils/forca_assets.dart';

class CreateSOLine extends StatefulWidget {
  final List<Product> listProduct;
  final List<Uom> listUom;
  final List<Tax> listTax;
  final ValueChanged<SoLine> line;

  CreateSOLine(this.listProduct, this.listUom, this.listTax, this.line);

  @override
  _SOLineState createState() =>
      _SOLineState(listProduct, listUom, listTax, line);
}

class _SOLineState extends State<CreateSOLine> {
  Product selectedProduct = Product();
  Uom selectedUom = Uom();
  Tax selectedTax = Tax();
  final List<Product> listProduct;
  final List<Uom> listUom;
  final List<Tax> listTax;
  final ValueChanged<SoLine> line;
  SoLine myline = SoLine();
  var priceController, qtyController, discountController;

  _SOLineState(this.listProduct, this.listUom, this.listTax, this.line);

  setLine() {
    myline.taxName = selectedTax.taxName;
    myline.taxID = int.parse(selectedTax.taxID);
    myline.productID = int.parse(selectedProduct.productID);
    myline.productName = selectedProduct.name;
    myline.uomID = int.parse(selectedUom.uomID);
    myline.uomName = selectedUom.name;
    myline.price = int.parse(priceController.text.toString());
    myline.qty = int.parse(qtyController.text.toString());
    myline.discount = int.parse(discountController.text.toString());
  }

  @override
  void initState() {
    selectedProduct = listProduct[0];
    selectedUom = listUom[0];
    selectedTax = listTax[0];
    priceController = TextEditingController();
    qtyController = TextEditingController();
    discountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
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
                            DropdownButton<Product>(
                              value: selectedProduct,
                              hint: Text("Select product"),
                              items: listProduct.map((product) {
                                return DropdownMenuItem(
                                  child: Text(product.name),
                                  value: product,
                                );
                              }).toList(),
                              onChanged: (newProduct) {
                                setState(() {
                                  selectedProduct = newProduct;
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
                            DropdownButton<Uom>(
                              value: selectedUom,
                              hint: Text("Select product"),
                              items: listUom.map((uom) {
                                return DropdownMenuItem(
                                  child: Text(uom.name),
                                  value: uom,
                                );
                              }).toList(),
                              onChanged: (newUom) {
                                setState(() {
                                  selectedUom = newUom;
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
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: priceController,
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontSize: 14.0),
                            decoration: InputDecoration(
                                hintText: 'Enter price of product'),
                          ))
                    ],
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
                          width: MediaQuery.of(context).size.width / 2 - 30,
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
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: TextField(
                            controller: discountController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontSize: 14.0),
                            decoration: InputDecoration(
                                hintText: 'Enter discount of product'),
                          ))
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
                    setLine();
                    line(myline);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontFamily: "Title",
                        color: Colors.white,
                        fontSize: 17.0),
                  ),
                  color: Colors.green,
                )),
          ],
        ));
  }
}
