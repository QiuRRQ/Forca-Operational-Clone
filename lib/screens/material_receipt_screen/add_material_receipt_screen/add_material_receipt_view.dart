import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';

class AddMaterialReceiptView extends AddMaterialReceiptViewModel {
   _body() {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
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
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  width: MediaQuery.of(context).size.width,
                  child: forcaText("MR Line",
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center),
                ),
                mrParam.lines.isEmpty
                    ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        forcaText("MR Line is Empty", fontSize: 17.0),
                        forcaText("Press 'Add Line' to add line", fontSize: 12.0),
                      ],
                    ))
                    : Container(
                  height: 1000,
                  child: ListView.builder(
                    itemBuilder: (c, i) => _lineItem(mrParam.lines[i]),
                    itemCount: mrParam.lines.length,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),

              ],
            ),
          ),
        ],
      ),
    );
  }

   _lineItem(MrLine line) {
     return Container(
       height: 135,
       child: Card(
         child: Container(
           padding: EdgeInsets.all(8.0),
           child: Column(
             children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     child: Text(
                       "Order",
                       style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold),
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     child: Text(
                       line.orderName,
                       style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold),
                       textAlign: TextAlign.end,
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                 ],
               ),
               Padding(padding: EdgeInsets.only(top: 10.0)),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     child: Text(
                       "Locator",
                       style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold),
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     child: Text(
                       line.locatorName,
                       style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold),
                       textAlign: TextAlign.end,
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                 ],
               ),
               Padding(padding: EdgeInsets.only(top: 10.0)),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     child: Text(
                       "QTY",
                       style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold),
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     child: Text(
                       line.qty.toString(),
                       style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold),
                       textAlign: TextAlign.end,
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                 ],
               ),
               Padding(padding: EdgeInsets.only(top: 10.0)),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Container(
                     height: 30.0,
                     child: OutlineButton(
                       onPressed: () {
//                        detail(line);
                       },
                       child: Text(
                         "Detail",
                         style: TextStyle(fontFamily: "Title"),
                       ),
                     ),
                   ),
                   Row(
                     children: <Widget>[
                       Container(
                         width: 75.0,
                         height: 30.0,
                         child: OutlineButton(
                           onPressed: () {
                            edit(line);
                           },
                           child: Text(
                             "Edit",
                             style: TextStyle(fontFamily: "Title"),
                           ),
                         ),
                       ),
                       Padding(padding: EdgeInsets.only(right: 10.0)),
                       Container(
                         width: 75.0,
                         height: 30.0,
                         child: RaisedButton(
                           color: Colors.red,
                           onPressed: () {
                             setState(() {
                               mrParam.lines.remove(line);
                             });
                           },
                           child: Text(
                             "Delete",
                             style: TextStyle(
                                 fontFamily: "Title", color: Colors.white),
                           ),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ],
           ),
         ),
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
      body: Container(
        child: isSavedTwice ?
        MyDialog(context, "SUCCESS", "Material Recceipt Line Saved", Status.SUCCESS)
            .build(() {
          Navigator.pop(context);
        }) :
        Column(
          children: <Widget>[
            Expanded(
                flex: 9,
                child: _body()
            ),
            Expanded(
              flex: 1,
              child:
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      if(isSave) {
                        if(mrParam.lines.isEmpty){
                          MyDialog(context, "Error", "Please Insert material receipt line", Status.ERROR)
                              .build(() {
                            //Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        }else{
                          createLine();
                        }
                      }else{
                        createMR();
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
                      if(isSave){
                        getMasterLine();
                      }else{
                        MyDialog(context, "FAILED", "Please save Material Recceipt First", Status.ERROR)
                            .build(() {
                          Navigator.pop(context);
                        });
                      }

                    },
                    child: Text(
                      "Add Line",
                      style: TextStyle(fontFamily: "Title", color: Colors.blue),
                    )
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
