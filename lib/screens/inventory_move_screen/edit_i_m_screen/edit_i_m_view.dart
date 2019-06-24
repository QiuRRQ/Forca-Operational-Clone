import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/m_movementline.dart';
import 'package:forca_so/screens/inventory_move_screen/edit_i_m_screen/edit_i_m_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';

class EditImView extends EditIMViewModel {
  _body() {
//    inventoryMoveDetail.m_movementline.forEach((line) {
//      linesWidget.add(_lineItem(line));
//    });
    return Container(
//      margin: EdgeInsets.all(16.0),
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
                            "Sales Rep *",
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
                                 saleRep == null? inventoryMoveDetail.salesrep_name:saleRep.name
                                  ,
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
                                  bpartner == null ? inventoryMoveDetail.c_bpartner_name : bpartner.name,
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
                          inventoryMoveDetail.movementdate ,
                              style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 14.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.expand_more), onPressed: () {
                            selectDate(context, (date) {
                              setState(() {
                                inventoryMoveDetail.movementdate = date;
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
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
//          Center(
//            child: Text("Invetory Move Line",
//                style: TextStyle(
//                    fontFamily: "Title",
//                    fontSize: 15.0,
//                    fontWeight: FontWeight.bold)),
//          ),
//          Column(
//            mainAxisSize: MainAxisSize.min,
//            children: linesWidget,
//          ),
        ],
      ),
    );
  }

//  _lineItem(M_movementline movementLine){
//    return Container(
//      height: 180,
//      child: Card(
//        child: Container(
//          padding: EdgeInsets.all(8.0),
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text(
//                      "Product",
//                      style: TextStyle(fontFamily: "Title", fontSize: 15.0),
//                      overflow: TextOverflow.ellipsis,
//                    ),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text(
//                      movementLine.product_name,
//                      style: TextStyle(
//                          fontFamily: "Subtitle",
//                          fontSize: 15.0,
//                          fontWeight: FontWeight.bold),
//                      textAlign: TextAlign.end,
//                      overflow: TextOverflow.ellipsis,
//                    ),
//                  )
//                ],
//              ),
//              Padding(padding: EdgeInsets.only(top: 10.0)),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text("Locator From",
//                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
//                        overflow: TextOverflow.ellipsis),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text(
//                      movementLine.m_locator,
//                      style: TextStyle(
//                          fontFamily: "Subtitle",
//                          fontSize: 15.0,
//                          fontWeight: FontWeight.bold),
//                      textAlign: TextAlign.end,
//                      overflow: TextOverflow.ellipsis,
//                    ),
//                  )
//                ],
//              ),
//              Padding(padding: EdgeInsets.only(top: 10.0)),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text("Locator To",
//                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
//                        overflow: TextOverflow.ellipsis),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text(
//                      movementLine.m_locator_to ?? "",
//                      style: TextStyle(
//                          fontFamily: "Subtitle",
//                          fontSize: 15.0,
//                          fontWeight: FontWeight.bold),
//                      textAlign: TextAlign.end,
//                      overflow: TextOverflow.ellipsis,
//                    ),
//                  )
//                ],
//              ),
//              Padding(padding: EdgeInsets.only(top: 10.0)),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text("Movement Qty",
//                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
//                        overflow: TextOverflow.ellipsis),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width / 2 - 30,
//                    child: Text(
//                      movementLine.movementqty ?? "",
//                      style: TextStyle(
//                          fontFamily: "Subtitle",
//                          fontSize: 15.0,
//                          fontWeight: FontWeight.bold),
//                      textAlign: TextAlign.end,
//                      overflow: TextOverflow.ellipsis,
//                    ),
//                  )
//                ],
//              ),
//              Padding(padding: EdgeInsets.only(top: 10.0)),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    height: 30.0,
//                    child: OutlineButton(
//                      onPressed: () {
//                        _detail(movementLine);
//                      },
//                      child: Text(
//                        "Detail",
//                        style: TextStyle(fontFamily: "Title"),
//                      ),
//                    ),
//                  )
//                ],
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  _detail(M_movementline movementLine) {
//    showModalBottomSheet(
//        context: context,
//        builder: (context) {
//          return Container(
//            height: 270.0,
//            child: Column(
//              children: <Widget>[
//                Container(
//                  color: Colors.blue,
//                  height: 40.0,
//                  child: Center(
//                    child: Text(
//                      "Detail Line",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontFamily: "Title",
//                          fontSize: 17.0,
//                          fontWeight: FontWeight.bold),
//                    ),
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.all(16.0),
//                  child: Column(
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "Product",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),
//                          Text(
//                            movementLine.product_name,
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0)),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "Locator From",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),
//                          Text(
//                            movementLine.m_locator,
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0)),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "Locator To",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),
//                          Text(
//                            movementLine.m_locator_to,
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0)),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "Movement Qty",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),
//                          Text(
//                            movementLine.movementqty ?? "0",
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0)),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "MovementLine id",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),
//                          Text(
//                            movementLine.m_movementline_id,
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0)),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "UOM",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),
//                          Text(
//                            movementLine.uom_name ?? "",
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          );
//        });
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Inventory Move",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
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
              child: forcaButton(forcaText('Update Inventory Move',color: Colors.white),(){
                updateIm();
              }),
            )
          ],
        ),
      ),
    );
  }
}
