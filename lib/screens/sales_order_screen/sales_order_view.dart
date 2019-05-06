import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_view_model.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_screen.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:loadmore/loadmore.dart';

class SalesOrderView extends SalesOrderViewModel {
  _filter() {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: forcaText("Filter",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        width: MediaQuery.of(context).size.width,
                        child: forcaText("Select End Date Document",
                            align: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                        width: MediaQuery.of(context).size.width,
                        child: forcaText("YYYY-MM-DD", align: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                        width: MediaQuery.of(context).size.width,
                        child: forcaText("Select End Date Document",
                            align: TextAlign.left),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            forcaText("YYYY-MM-DD",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () {})
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(top: 8.0, bottom: 0.0),
                        width: MediaQuery.of(context).size.width,
                        child:
                            forcaText("Document Status", align: TextAlign.left),
                      ),
                      Container(
                        child: DropdownButton<DocumentStatus>(
                          isExpanded: true,
                          value: documentStatus,
                          items: DocumentStatus.values.map((docStatus) {
                            return DropdownMenuItem<DocumentStatus>(
                              value: docStatus,
                              child: forcaText(
                                  docStatus
                                      .toString()
                                      .replaceAll("DocumentStatus.", ""),
                                  fontSize: 12.0,
                                  align: TextAlign.center,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            );
                          }).toList(),
                          onChanged: (status) {
                            setState(() {
                              documentStatus = status;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                forcaButton(
                    forcaText("Search Document", color: Colors.white), () {},
                    height: 45.0,
                    margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    color: Colors.blue)
              ],
            ),
          );
        });
  }

  _listStatus() {
    return ListView.builder(
      itemBuilder: (c, i) => i == 0
          ? Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20.0),
              height: 50.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Select Status",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Title",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 16.0, left: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    documentStatus = i == 1
                        ? DocumentStatus.DRAFTED
                        : i == 2
                            ? DocumentStatus.INPROGRESS
                            : i == 3
                                ? DocumentStatus.COMPLETED
                                : i == 4
                                    ? DocumentStatus.RESERVED
                                    : i == 5
                                        ? DocumentStatus.INVALID
                                        : DocumentStatus.CLOSED;
                    getSOList();
                  });
                },
                child: Column(
                  children: <Widget>[
                    Text(i == 1
                        ? "Drafted"
                        : i == 2
                            ? "Inprogress"
                            : i == 3
                                ? "Completed"
                                : i == 4
                                    ? "Reserved"
                                    : i == 5 ? "Invalid" : "Closed"),
                    Divider()
                  ],
                ),
              ),
            ),
      itemCount: 7,
    );
  }

  _item(SalesOrder so) {
    return Container(
      height: 140.0,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(7.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Doc Number",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${so.documentNO}",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Nominal",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${so.grandTotal}",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Business Partner",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${so.name}",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
                      onPressed: () => getDetail(so),
                      child: Text(
                        "Detail",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 13.0,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      so.status == "Drafted"
                          ? Container(
                              height: 30.0,
                              child: OutlineButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => CreateSOScreen()));
                                },
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 13.0,
                                      color: Colors.black),
                                ),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      Container(
                        height: 30.0,
                        child: RaisedButton(
                          onPressed: null,
                          disabledColor:
                              DocumentStatusColor().getColor(so.status),
                          child: Text(
                            so.status,
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 13.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _noData() {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            forcaText("No Document", fontSize: 17.0, color: Colors.grey),
            forcaText("Press '+' to add new document",
                fontSize: 12.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  _data() {
    return LoadMore(
      isFinish: page >= 2,

      whenEmptyLoad: true,
      delegate: DefaultLoadMoreDelegate(),
      textBuilder: DefaultLoadMoreTextBuilder.english,
      onLoadMore: getSOList,
      child: ListView.builder(
        itemBuilder: (c, i) => _item(listSO[i]),
        itemCount: listSO.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sales Order",
            style: TextStyle(fontFamily: "Title"),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => _filter(),
              child: Text(
                "Filter",
                style: TextStyle(
                    fontFamily: "Title",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => CreateSOScreen()));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: isReq ? _loading() : listSO.isEmpty ? _noData() : _data(),
        ));
  }
}
