import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/list_line.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_view_model.dart';


class CreateIMView extends CreateIMViewModel {
   bool isCheckedTransit = false;

  _body() {
    return Container(
      child: ListView(
        children: <Widget>[
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
                            "Sales Rep ",
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
                                  saleRep == null
                                      ? 'Select Sales Rep'
                                      : saleRep.name,
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
                                    getSaleResp();
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
                            "BPartner *",
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
                                  bpartner == null
                                      ? 'Select BPartner'
                                      : bpartner.name,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                margin: EdgeInsets.only(top: 16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Movement Date *",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 70,
                            child: Text(
                              imParam.movementdate,
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
                                    imParam.movementdate = date;
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
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                margin: EdgeInsets.only(top: 35.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "In Transit",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Checkbox(
                              value: imParam.isintransit == ""? isCheckedTransit :  checkTransit,
                              onChanged: (te) {
                                setState(() {
                                  isCheckedTransit = te;
                                  print(isCheckedTransit);
                                  isTransit(isCheckedTransit);
                                });
                              })
                        ],
                      ),
                      Container(
                        height: 1.0,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Description ",
                  style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width /1 -37,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          controller: descriptionController,
                          style: TextStyle(
                            fontSize:  14.0,
                            color: Colors.black,
                            fontFamily: "Title"
                          ),decoration: InputDecoration(
                          hintText: imParam.description == null ? "description" : imParam.description,
                        ),

                        )
                    ),
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
            margin: EdgeInsets.only(top: 30.0, bottom: 16.0),
            width: MediaQuery.of(context).size.width,
            child: forcaText("Inventory Move Line",
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                align: TextAlign.center),
          ),
          imParam.list_line.isEmpty
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    forcaText("Inventory Move Line is Empty", fontSize: 17.0),
                    forcaText("Press '+' to add line", fontSize: 12.0),
                  ],
                ))
              : Container(
                  height: 1000,
                  child: ListView.builder(
                    itemBuilder: (c, i) => _lineItem(imParam.list_line[i],index: i),
                    itemCount: imParam.list_line.length,
                  ),
                ),
        ],
      ),
    );
  }

  _lineItem(ListLine line, {int index}) {
    return Container(
      height: 190,
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
                      "Line Number",
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
                      line.line_number,
                      style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 14.0,
                      ),
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
                      "Product",
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
                      line.productName,
                      style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 14.0,
                      ),
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
                      "Movement qty",
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
                      line.forca_qtyentered.toString() ?? "",
                      style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 14.0,
                      ),
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
                      "Locator From",
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
                      line.locatorFrom,
                      style: TextStyle(fontFamily: "Title", fontSize: 14.0),
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
                      "Locator To",
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
                      line.locatorTo,
                      style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 14.0,
                      ),
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
                        detail(line);
                      },
                      child: Text(
                        "Show More",
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
                          onPressed: () => getEditMasterLine(line,index),
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
                          delete(line);
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
  
  detail(ListLine line){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 270.0,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 40.0,
              child: Center(
                child: Text(
                  "Detail Line",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Title",
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Product",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      Text(
                        line.productName,
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Movement Qty",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      Text(
                        line.forca_qtyentered.toString() ?? "",
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Locator From",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      Text(
                        line.locatorFrom,
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Locator To",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      Text(
                        line.locatorTo,
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "UOM",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      Text(
                        line.UomName ?? "",
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.inventoryMove == null ?
          "Create Inventory Move" : "Edit Inventory Move",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () => getMasterLine()
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: _body(),
            ),
            Expanded(
              flex: 1,
              child: forcaButton(
                  forcaText(widget.inventoryMove == null?"Create Iventory Move": "Save Inventory Move", color: Colors.white), () {
                if(widget.inventoryMove == null){
                    if (imParam.list_line.isNotEmpty) {
                  createImDraft();
                } else {
                  MyDialog(context, "FAILED", "Please add line", Status.ERROR)
                      .build(() {
                    Navigator.pop(context);
                  });
                }
                }else{
                updateIm();
                }
              },
                  color: Colors.blue,
                  height: 50.0,
                  width: 200.0,
                  margin: EdgeInsets.only(top: 20.0)),
            )
          ],
        ),
      ),
    );
  }
}
