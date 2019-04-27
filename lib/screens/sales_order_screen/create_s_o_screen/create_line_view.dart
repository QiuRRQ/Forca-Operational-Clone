import 'package:flutter/material.dart';
import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_line_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';

class CreateLineView extends CreateLineViewModel {


  _lineItem(SoLine line) {
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
                      onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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

  var dropdownValue = "One";
  _addLine() {
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
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>['One', 'Two', 'Free', 'Four']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
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
                      onPressed: () {},
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

  _editLine(BuildContext context, ValueChanged<SoLine> addLine) {
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
                        addLine(SoLine());
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

  _detailLine(BuildContext context, SoLine line) {
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
      appBar: AppBar(
        centerTitle: true,
        title: forcaText("Add SO Line"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addLine(),
        child: Icon(Icons.add),
        tooltip: "Add new line",
      ),
      body: ListView.builder(itemBuilder: (c, i) => _lineItem(SoLine())),
    );
  }
}
