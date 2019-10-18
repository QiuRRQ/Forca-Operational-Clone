import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/m_movementline.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/utils/forca.dart';

class DetailIMView extends DetailIMViewModel {
  _body() {
    inventoryMoveDetail.m_movementline.forEach((line) {
      linesWidget.add(_lineItem(line));
    });
    return Container(
      margin: EdgeInsets.all(16.0),
          child:
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ListView(
                children: <Widget>[
                  forcaLogo(width: 70.0),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Document Number",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                      ),
                      Text(
                        inventoryMoveDetail.documentno ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontFamily: "Subtitle",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Movement Date",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                      ),
                      Text(
                        inventoryMoveDetail.movementdate ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontFamily: "Subtitle",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Sales Rep Name",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                      ),
                      Text(
                        inventoryMoveDetail.salesrep_name ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontFamily: "Subtitle",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Business Partner",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Title",
                              ),
                            ),
                          ],
                        ),
                        Text(
                          inventoryMoveDetail.c_bpartner_name ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: "Subtitle",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "In Transit",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Title",
                        ),
                      ),
                      Text(
                        inventoryMoveDetail.istransit.toString() == "true"? "Y" :" N" ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontFamily: "Subtitle",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: "Title",
                              ),
                            ),
                          ],
                        ),
                        Text(
                          inventoryMoveDetail.description ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: "Subtitle",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Center(
                    child: Text("Invetory Move Line",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: linesWidget,
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.only(bottom: 35.0)),
                ],
              ),
            inventoryMoveDetail.status == "Drafted" ? _buttonAction() : Container(height: 10,)
            ],

          ),
    );
  }

  _lineItem(M_movementline movementLine) {
    return Container(
      height: 200,
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
                      style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      movementLine.line_number ?? "",
                      style: TextStyle(
                          fontFamily: "Subtitle",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
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
                      style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      movementLine.product_name ?? "",
                      style: TextStyle(
                          fontFamily: "Subtitle",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text("Locator From",
                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      movementLine.m_locator ?? "",
                      style: TextStyle(
                          fontFamily: "Subtitle",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text("Locator To",
                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      movementLine.m_locator_to ?? "",
                      style: TextStyle(
                          fontFamily: "Subtitle",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text("Movement Qty",
                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      movementLine.forca_qtyentered ?? "",
                      style: TextStyle(
                          fontFamily: "Subtitle",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
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
                        _detail(movementLine);
                      },
                      child: Text(
                        "Show More",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _detail(M_movementline movementLine) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
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
                            "Line Number",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            movementLine.line_number ?? "",
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
                            "Product",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            movementLine.product_name ?? "",
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
                            movementLine.m_locator ?? "",
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
                            movementLine.m_locator_to ?? "",
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
                            movementLine.forca_qtyentered ?? "0",
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
                            movementLine.uom_name ?? "",
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

  _buttonAction(){
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 30,
            child: forcaButton(forcaText("Delete", color: Colors.white), () {
              delete();
            }, color: Colors.red),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 30,
            child: forcaButton(forcaText("Completed", color: Colors.white), () {
              completedDoc();
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inventory Move Detail",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body:_body()
    );
  }

}
