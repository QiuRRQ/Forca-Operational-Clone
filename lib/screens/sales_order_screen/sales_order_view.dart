import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/filter_so.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_view_model.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/utils/forca_assets.dart';

class SalesOrderView extends SalesOrderViewModel {
  _filter() {
    showModalBottomSheet(
        context: context,
        builder: (c) => FilterSO((ok) {
              Navigator.pop(context);
            }));
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
                    "${so.docDate}",
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

  _loadMore() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      getSOList();
    }
  }

  _data() {
    return ListView.builder(
      controller: _controller,
      itemBuilder: (c, i) => _item(listSO[i]),
      itemCount: listSO.length,
    );
  }

  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_loadMore);
    super.initState();
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
