import 'package:flutter/material.dart';
import 'package:forca_so/utils/document_status.dart';

class MaterialReceiptWidget {
  item(context, status) {
    return Container(
      margin: EdgeInsets.only(top: 8.0,right: 8.0,left: 8.0),
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
                    "Business Partner",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Semen Indonesia",
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
                    "Quantity",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "1200",
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
                        Navigator.push(
                            context, MaterialPageRoute(builder: (c) {}));
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
                      status == DocumentStatus.DRAFTED
                          ? Container(
                              height: 30.0,
                              child: OutlineButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (c) {}));
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
                          disabledColor: DocumentStatusColor().getColor(status),
                          child: Text(
                            status == DocumentStatus.DRAFTED
                                ? "Drafted"
                                : status == DocumentStatus.INPROGRESS
                                    ? "In Progress"
                                    : status == DocumentStatus.COMPLETED
                                        ? "Completed"
                                        : status == DocumentStatus.RESERVED
                                            ? "Reversed"
                                            : status == DocumentStatus.INVALID
                                                ? "Invalid"
                                                : "Closed",
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
}
