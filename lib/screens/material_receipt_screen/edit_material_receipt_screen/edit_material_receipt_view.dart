import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/receipt_orderline.dart';
import 'package:forca_so/screens/material_receipt_screen/edit_material_receipt_screen/edit_material_recceipt_model.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';

class EditReceiptView extends EditReceiptViewModel {

  _body() {
    docNumer.m_line.forEach((line) {
      linesWidget.add(_lineItem(line));
    });

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
                                      child: Text( warehouseChange ? warehouse.name : docNumer.warehouseName,
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
                                      child: Text(bPartnerChange ? bPartner.name : docNumer.bPartnerName,
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
                                    docNumer.movementDate,
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
                                          mrParam.movementdate = date;
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
                Divider(),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text("Material Receipt LINE",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: linesWidget,
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),

              ],
            ),
          ),
        ],
      ),
    );
  }

  _lineItem(m_inOutline orderLine) {
    return Container(
      height: 140,
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
                      orderLine.product_name,
                      style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      orderLine.priceentered,
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
                    child: Text("QTY",
                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      orderLine.qtyentered,
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
                    child: Text("Discount",
                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      orderLine.discount ?? "",
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
                        _detailLine( orderLine);
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
                            //edit(line);
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(fontFamily: "Title"),
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

  _detailLine(m_inOutline line) {
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
                            "Product",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.product_name,
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
                            "Price",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.priceentered,
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
                            "QTY",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.qtyentered,
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
                            "Discount",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.discount ?? "0",
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
                            line.uom_name,
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
                            "Total",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.total,
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
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
          "Detail Material Receipt",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
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
                      createMR();
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
    );
  }
}
