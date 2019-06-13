import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_view_model.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';

class AddMaterialReceiptView extends AddMaterialReceiptViewModel {
   _body() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            LOGO,
            width: 110,
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Warehouse",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 70,
                                child: Text(
                                  warehouse == null
                                      ? 'Select Warehouse'
                                      : warehouse.name,
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {
                                    getWarehouse();
                                  }),
                            ],
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "BPartner",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 70,
                                child: Text(
                                  bPartner == null
                                      ? 'Select BPartner'
                                      : bPartner.name,
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {
                                    getBPartner();
                                  }),
                            ],
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
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Movement Date",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width:
                            MediaQuery.of(context).size.width/2-70,
                            child: Text(
                              mrParam.movementDate,
                              style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 14.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.expand_more),
                              onPressed: () {
                                selectDate(context, (date) {
                                  setState(() {
                                    mrParam.movementDate = date;
                                  });
                                });
                              }),
                        ],
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

          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                if (mrParam.lines.isNotEmpty) {
                                  createMR();
                                } else {
                                  MyDialog(context, "FAILED", "Please add line", Status.ERROR)
                                      .build(() {
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(fontFamily: "Title", color: Colors.blue),
                              )
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontFamily: "Title", color: Colors.blue),
                              )
                          ),
                          FlatButton(
                              onPressed: () {
                                getMasterLine();
                                //Navigator.pop(context);
                              },
                              child: Text(
                                "Add Line",
                                style: TextStyle(fontFamily: "Title", color: Colors.blue),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create M Receipt",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }
}
