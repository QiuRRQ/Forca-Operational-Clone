import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/list_line.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/product.dart';
import 'package:forca_so/utils/forca_assets.dart';

class CreateIMLine extends StatefulWidget {
  final ValueChanged<ListLine> line;
  final List<Locator> listLocator;

  CreateIMLine(this.listLocator, this.line);
  @override
  _CreateIMLineState createState() => _CreateIMLineState(listLocator, line);
}

class _CreateIMLineState extends State<CreateIMLine> {
  Product selectedProduct = Product();
  Locator selectedLocatorFrom = Locator();
  Locator selectedLocatorTo = Locator();
  final ValueChanged<ListLine> line;
  final List<Locator> listLocator;
  ListLine myLine = ListLine();
  var productController,movementQtyController;

  _CreateIMLineState(this.listLocator, this.line);

  setLine() {
    myLine.productName = selectedProduct.name;
    myLine.locatorFrom = selectedLocatorFrom.locator_name;
    myLine.m_locator_id = int.parse(selectedLocatorFrom.m_locator_id);
    myLine.m_locatorto_id = int.parse(selectedLocatorTo.m_locator_id);
    myLine.locatorTo = selectedLocatorTo.locator_name;
    myLine.movementqty = int.parse(movementQtyController.text.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedLocatorFrom = listLocator[0];
    selectedLocatorTo = listLocator[0];
    productController = TextEditingController();
    movementQtyController = TextEditingController();
    super.initState();
  }

  _showProducts() {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              content: SelectProduct((product) {
                setState(() {
                  selectedProduct = product;
                  productController.text = selectedProduct.name;
                  Navigator.pop(context);
                });
              }),
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
                      child: forcaText("Create IM Line", color: Colors.white),
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
                                        hintText: "Select Product",
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
                                      keyboardType: TextInputType.number,
                                      controller: movementQtyController,
                                      style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: "Title"),
                                      decoration: InputDecoration(
                                          hintText: "Enter movement qty",
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
                  Padding(padding: EdgeInsets.only(top: 20.0)),
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

