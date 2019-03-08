import 'package:flutter/material.dart';
import 'package:forca_so/models/po_line/line.dart';

class WidgetSO {
  static lineItem(BuildContext context, Line line, ValueChanged<Line> detail,
      ValueChanged<Line> edit, ValueChanged<Line> delete) {
    return Container(
      height: 135,
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
                      "Semen Gresik 5Kg",
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
                      "Rp. 50.000",
                      style: TextStyle(
                          fontFamily: "Title",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
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
                      "QTY",
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
                      "10",
                      style: TextStyle(
                          fontFamily: "Title",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
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
                      "Discount",
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
                      "10.000",
                      style: TextStyle(
                          fontFamily: "Title",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
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
                            edit(line);
                          },
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

  static addLine(BuildContext context, ValueChanged<Line> addLine) {
    showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16.0),
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Add PO Line",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Title",
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Select Product',
                                      style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 14.0,
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
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "UOM",
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Select UOM',
                                      style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 14.0,
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
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  margin: EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Price",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "Title",
                                    color: Colors.black,
                                    fontSize: 14.0),
                                decoration: InputDecoration(
                                    hintText: 'Enter price of product'),
                              ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "QTY",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "Title",
                                    color: Colors.black,
                                    fontSize: 14.0),
                                decoration: InputDecoration(
                                    hintText: 'Enter QTY of product'),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  margin: EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "TAX",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Select TAX',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Discount",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "Title",
                                    color: Colors.black,
                                    fontSize: 14.0),
                                decoration: InputDecoration(
                                    hintText: 'Enter discount of product'),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                      onPressed: () {
                        addLine(Line());
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.white,
                            fontSize: 17.0),
                      ),
                      color: Colors.green,
                    )),
              ],
            ),
          ),
    );
  }

  static editLine(BuildContext context, ValueChanged<Line> addLine) {
    showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16.0),
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Edit SO Line",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Title",
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Select Product',
                                      style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 14.0,
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
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "UOM",
                                  style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Select UOM',
                                      style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 14.0,
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
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  margin: EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Price",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "Title",
                                    color: Colors.black,
                                    fontSize: 14.0),
                                decoration: InputDecoration(
                                    hintText: 'Enter price of product'),
                              ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "QTY",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "Title",
                                    color: Colors.black,
                                    fontSize: 14.0),
                                decoration: InputDecoration(
                                    hintText: 'Enter QTY of product'),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  margin: EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "TAX",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Select TAX',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Discount",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "Title",
                                    color: Colors.black,
                                    fontSize: 14.0),
                                decoration: InputDecoration(
                                    hintText: 'Enter discount of product'),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                      onPressed: () {
                        addLine(Line());
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.white,
                            fontSize: 17.0),
                      ),
                      color: Colors.green,
                    )),
              ],
            ),
          ),
    );
  }

  static detailLine(BuildContext context, Line line) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            height: 250.0,
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
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "Semen Gresik 5Kg",
                            style: TextStyle(
                                fontFamily: "Title",
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
                            "Price",
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "Rp. 50.000",
                            style: TextStyle(
                                fontFamily: "Title",
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
                            "QTY",
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                                fontFamily: "Title",
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
                            "Discount",
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "10.000",
                            style: TextStyle(
                                fontFamily: "Title",
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
                            "UOM",
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "SAK",
                            style: TextStyle(
                                fontFamily: "Title",
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
                            "TAX",
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "10.000",
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                              fontFamily: "Title",
                            ),
                          ),
                          Text(
                            "Rp. 500.000",
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
