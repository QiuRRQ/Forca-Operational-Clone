import 'package:flutter/material.dart';
import './sales_order_view_model.dart';
import 'detail_s_o/detail_s_o.dart';
import 'create_s_o/create_s_o.dart';
import 'package:forca_so/utils/document_status.dart';

class SalesOrderView extends SalesOrderViewModel {
  _filter() {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            height: 300.0,
            child: ListView.builder(
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
                              fontSize: 17.0,
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
                                : i == 5 ? DocumentStatus.INVALID : DocumentStatus.CLOSED;
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
            ),
          );
        });
  }

  _item() {
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
                    "133456",
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
                    "Rp. 300.000.00",
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
                    "PT. Cong Fandi",
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => DetailSO()));
                      },
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
                      documentStatus == DocumentStatus.DRAFTED
                          ? Container(
                              height: 30.0,
                              child: OutlineButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => CreateSO()));
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
                          disabledColor: DocumentStatusColor().getColor(documentStatus),
                          child: Text(Status(documentStatus).getName(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forca SO",
          style: TextStyle(fontFamily: "Title"),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => _filter(),
            child: Text(
              "Status",
              style: TextStyle(fontFamily: "Title", color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => CreateSO()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: ListView.builder(itemBuilder: (c, i) => _item())),
    );
  }
}
