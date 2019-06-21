import 'dart:convert';
import 'dart:async';
import 'package:forca_so/utils/my_dialog.dart';
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
  final ValueChanged<MrLine> line;
  final BPartner bPartner;
  final Warehouse warehouse;
  int inoutID;
  bool lineInserted;

  CreateMRLine(this.listLocator, this.line, this.bPartner, this.warehouse, this.inoutID, this.lineInserted);

  @override
  _MRLineState createState() => _MRLineState(listLocator, line, bPartner, warehouse, inoutID, lineInserted);
}

class _MRLineState extends State<CreateMRLine> {
  SalesOrder selectedOrder = SalesOrder();
  final List<Locator> listLocator;
  Locator selectedLocator = Locator();
  final BPartner bPartner;
  final Warehouse warehouse;
  int inoutID;
  bool lineInserted;
  final ValueChanged<MrLine> line;
  MrLine myline = MrLine();
  var qtyController,
      orderController;

  _MRLineState(this.listLocator, this.line, this.bPartner, this.warehouse, this.inoutID, this.lineInserted);

  setLine() {
    myline.inOutId = inoutID;
    myline.locatorName = selectedLocator.locator_name;
    myline.locatorId = int.parse(selectedLocator.m_locator_id);
    myline.orderId = int.parse(selectedOrder.orderID);
    myline.orderName = selectedOrder.name;
  }

  submitterMR(MrLine item)async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CREATE_INOUTLINE";
    var response = await http.post(url, body: {
      "m_inout_id": item.inOutId.toString(),
      "c_order_id": item.orderId.toString(),
      "m_locator_id": item.locatorId.toString()
    }, headers: {
      "Forca-Token": user.token,
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    //Navigator.pop(context);
    if (response != null) {
      print("hasil Line ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
          //Navigator.pop(context);
          //Navigator.pop(context);
          print("result id : ${res['resultdata']}");
        });
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                      onPressed: () {
                        try {
                          setLine();
                          submitterMR(myline);
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
