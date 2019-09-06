import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_view_model.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';

class DetailSOView extends DetailSOViewModel {
  _body() {
    salesOrder.orderLine.forEach((line) {
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
                    "Document Date",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                  ),
                  Text(
                    salesOrder.dateOrdered,
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
                    DOC_NUMBER,
                    style: TextStyle(
                        color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                  ),
                  Text(
                    salesOrder.documentNo,
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
                    "Nominal",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                  ),
                  Text(
                    "${salesOrder.nominal}",
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
                      salesOrder.partnerName ?? "",
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
                    "WareHouse",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15, fontFamily: "Title"),
                  ),
                  Text(
                    salesOrder.warehouse,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: "Subtitile",
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
                    "Sale Rep",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                  ),
                  Text(
                    salesOrder.salesRepName,
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
                    "Price List",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                  ),
                  Text(
                    salesOrder.priceList,
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
                    "Payment Rule",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15.0, fontFamily: "Title"),
                  ),
                  Text(
                    salesOrder.paymentRule,
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
                      salesOrder.description ?? "",
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
                child: Text("SO LINE",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: linesWidget,
              ),
            ],
          ),
          salesOrder.status == "Drafted" ? _buttonAction() : Container(height: 10,)
        ],
      ),
    );
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
              deleteOrder();
            }, color: Colors.red),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 30,
            child: forcaButton(forcaText("Completed", color: Colors.white), () {
              setComplete();
            }),
          ),
        ],
      ),
    );
  }
  _lineItem(OrderLine orderLine) {
    return Container(
      height: 180,
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
                    child: Text("Line No",
                        style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      orderLine.line_number,
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
                      orderLine.productName ?? "",
                      style: TextStyle(fontFamily: "Title", fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      orderLine.priceEntered,
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
                      orderLine.qtyEntered ?? "",
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
                        _detailLine(orderLine);
                      },
                      child: Text(
                        "Show More",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _detailLine(OrderLine line) {
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
                            "Price",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.priceEntered,
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
                            line.qtyEntered,
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
                            line.uomName ?? "",
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
                            "TAX",
                            style: TextStyle(fontFamily: "Title"),
                          ),
                          Text(
                            line.taxName,
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
          "Detail SO",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body: _body()
//      Container(
//        margin: EdgeInsets.only(bottom: 16.0),
//        child: Column(
//          children: <Widget>[
//            Expanded(
//              flex: 9,
//              child: _body(),
//            ),
//            Expanded(
//              flex: 1,
//              child: salesOrder.status == "Drafted" ? _buttonAction() : Container(height: 10,),
//            )
//          ],
//        ),
//      ),
    );
  }
}
