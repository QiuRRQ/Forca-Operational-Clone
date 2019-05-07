import 'package:flutter/material.dart';
import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';

class CreateSOView extends CreateSOViewModel {
  _body() {
    return Container(
      child: ListView(
        children: <Widget>[
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
                            "Warehouse *",
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
                                      ? 'Select Warehouse'
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
                            "BPartner *",
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
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sales Rep *",
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
                          saleRep == null ? 'Select Sales Rep' : saleRep.name,
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
                            "Price List *",
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
                            "Payment Rule *",
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
//          Padding(padding: EdgeInsets.only(top: 20)),
//          Container(
//            width: MediaQuery.of(context).size.width,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Description",
//                  style: TextStyle(
//                      fontFamily: "Title",
//                      fontSize: 15.0,
//                      fontWeight: FontWeight.bold),
//                ),
//                TextField(
//                  controller: descriptionController,
//                  decoration: InputDecoration(
//                      hintText: 'Input description of Material Receipt'),
//                  style: TextStyle(
//                    fontFamily: "Title",
//                    fontSize: 14.0,
//                  ),
//                ),
//              ],
//            ),
//          ),
          Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
            width: MediaQuery.of(context).size.width,
            child: forcaText("SO Line",
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                align: TextAlign.center),
          ),
          soParams.lines.isEmpty
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    forcaText("SO Line is Empty", fontSize: 17.0),
                    forcaText("Press '+' to add line", fontSize: 12.0),
                  ],
                ))
              : Container(
                  height: 1000,
                  child: ListView.builder(
                    itemBuilder: (c, i) => _lineItem(soParams.lines[i]),
                    itemCount: soParams.lines.length,
                  ),
                ),
        ],
      ),
    );
  }

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
                      "Product",
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
                      line.productName,
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
                      "Price",
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
                      line.price.toString(),
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
                      line.qty.toString(),
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
//                        detail(line);
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
//                            edit(line);
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
                            setState(() {
                              soParams.lines.remove(line);
                            });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create SO",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () => getMasterLine())
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: _body(),
            ),
            Expanded(
              flex: 1,
              child: forcaButton(
                  forcaText("Create SO", color: Colors.white), () => createSO(),
                  color: Colors.blue,
                  height: 50.0,
                  width: 200.0,
                  margin: EdgeInsets.only(top: 20.0)),
            )
          ],
        ),
      ),
    );
  }
}
