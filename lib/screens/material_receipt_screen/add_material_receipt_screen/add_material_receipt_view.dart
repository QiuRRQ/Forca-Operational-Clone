import 'package:flutter/material.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_view_model.dart';
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
                                  'Select Wwarehouse',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {}),
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
                                  'Select BPartner',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {}),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Order Ref",
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
                                  'Select Order Ref',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {}),
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
                                    MediaQuery.of(context).size.width / 2 - 70,
                                child: Text(
                                  'Select Date',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {}),
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
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Input description of Material Receipt'
                  ),
                  style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            "Receipt Line",
            style: TextStyle(
                fontFamily: "Title",
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          lines.isEmpty
              ? Container(
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "Receipt Line is empty\nPress + to add Receipt Line",
                      style: TextStyle(fontFamily: "Title"),
                      textAlign: TextAlign.center,
                    ),
                  ))
              : Expanded(
                  child: Container()
                  // ListView.builder(
                  //     itemCount: lines.length,
                  //     itemBuilder: (context, index) =>
                  //         WidgetSO.lineItem(context, lines[index], (detailLine) {
                  //           WidgetSO.detailLine(context, detailLine);
                  //         }, (editLine) {
                  //           WidgetSO.editLine(context, (editedLine){
                  //             Navigator.pop(context);
                  //           });
                  //         }, (deleteLine) {
                  //           setState(() {
                  //             lines.remove(deleteLine);
                  //           });
                  //         })),
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
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(fontFamily: "Title", color: Colors.white),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // WidgetSO.addLine(context, (line) {
          //   setState(() {
          //     Navigator.pop(context);
          //     lines.add(line);
          //   });
          // });
        },
        tooltip: "Add Receipt Line",
        child: Icon(Icons.add),
      ),
      body: _body(),
    );
  }
}
