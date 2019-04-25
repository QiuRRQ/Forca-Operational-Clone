import 'package:flutter/material.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_view_model.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/widget_so.dart';

class CreateSOView extends CreateSOViewModel {
  _body() {
    return Container(
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
                                child: Text(
                                  warehouse == null
                                      ? 'Select Wwarehouse'
                                      : warehouse.name,
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
                                child: Text(
                                  bPartner == null
                                      ? 'Select BPartner'
                                      : bPartner.name,
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
                                    getBpartner();
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
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sale Rep",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          saleRep == null ? 'Select Sale Rep' : saleRep.name,
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
          ),
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
                            "Price List",
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
                                  priceList == null
                                      ? 'Select Pricelist'
                                      : priceList.name,
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
                                    getPriceList();
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
                            "Payment Rule",
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
                                  paymentRule == null
                                      ? 'Select Payment Rule'
                                      : paymentRule.name,
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
                                    getPaymentRule();
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
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Input description of Material Receipt'),
                  style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            "SO Line",
            style: TextStyle(
                fontFamily: "Title",
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          poLines.isEmpty
              ? Container(
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "SO Line is empty\nPress + to add SO Line",
                      style: TextStyle(fontFamily: "Title"),
                      textAlign: TextAlign.center,
                    ),
                  ))
              : Expanded(
                  child: ListView.builder(
                      itemCount: poLines.length,
                      itemBuilder: (context, index) => WidgetSO.lineItem(
                              context, poLines[index], (detailLine) {
                            WidgetSO.detailLine(context, detailLine);
                          }, (editLine) {
                            WidgetSO.editLine(context, (editedLine) {
                              Navigator.pop(context);
                            });
                          }, (deleteLine) {
                            setState(() {
                              poLines.remove(deleteLine);
                            });
                          })),
                ),
        ],
      ),
    );
  }

  _lineItem(BuildContext context, Line line, ValueChanged<Line> detail,
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

  _addLine(ValueChanged<Line> addLine) {
    showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16.0),
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Add SO Line",
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
                                      product == null
                                          ? 'Select Product'
                                          : product.name,
                                      style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.expand_more),
                                        onPressed: () {
                                          getProduct();
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

  _editLine(BuildContext context, ValueChanged<Line> addLine) {
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

  _detailLine(BuildContext context, Line line) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Create SO",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(fontFamily: "Title", color: Colors.white),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addLine((line) {
            setState(() {
              Navigator.pop(context);
              poLines.add(line);
            });
          });
        },
        tooltip: "Add SO Line",
        child: Icon(Icons.add),
      ),
      body: _body(),
    );
  }
}
