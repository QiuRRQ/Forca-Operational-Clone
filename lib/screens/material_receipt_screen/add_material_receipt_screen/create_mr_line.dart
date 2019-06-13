import 'package:flutter/material.dart';
import 'package:forca_so/master/select_order.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/utils/forca_assets.dart';

class CreateMRLine extends StatefulWidget {
  final List<Locator> listLocator;
  final ValueChanged<MrLine> line;
  final BPartner bPartner;
  final Warehouse warehouse;

  CreateMRLine(this.listLocator, this.line, this.bPartner, this.warehouse);

  @override
  _MRLineState createState() => _MRLineState(listLocator, line, bPartner, warehouse);
}

class _MRLineState extends State<CreateMRLine> {
  SalesOrder selectedOrder = SalesOrder();
  final List<Locator> listLocator;
  Locator selectedLocator = Locator();
  final BPartner bPartner;
  final Warehouse warehouse;
  final ValueChanged<MrLine> line;
  MrLine myline = MrLine();
  var qtyController,
      orderController;

  _MRLineState(this.listLocator, this.line, this.bPartner, this.warehouse);

  setLine() {
    myline.locatorName = selectedLocator.locator_name;
    myline.locatorId = int.parse(selectedLocator.m_locator_id);
    myline.orderId = int.parse(selectedOrder.orderID);
    myline.orderName = selectedOrder.name;
    myline.qty = int.parse(qtyController.text.toString());
  }

  @override
  void initState() {
    selectedLocator = listLocator[0];
    qtyController = TextEditingController();
    orderController = TextEditingController();
    super.initState();
  }

  _showOrder() {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
          content: SelectOrder(bPartner.bPartnerID, warehouse.warehouseID, (order) {
            setState(() {
              selectedOrder = order;
              orderController.text = selectedOrder.name;
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
                                    "Order",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: orderController,
                                    decoration: InputDecoration(
                                        hintText: "Select Order",
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _showOrder())),
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
                          width: MediaQuery.of(context).size.width - 32,
                          child: Column(
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
