import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class AddMaterialReceiptView extends AddMaterialReceiptViewModel {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                margin: EdgeInsets.only(top: 16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Order Item *",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 70,
                            child: Text(
                              selectedOrder == null
                                  ? 'Select Order Item'
                                  : selectedOrder.documentNO ?? "",
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
                                getOrder();
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
                width: MediaQuery.of(context).size.width / 2 - 20,
                margin: EdgeInsets.only(top: 16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Movement Date *",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 70,
                            child: Text(
                              mrParam.movementdate,
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
              ),
            ],
          ),
//          Container(
//            width: MediaQuery.of(context).size.width / 2 - 20,
//            margin: EdgeInsets.only(top: 16.0),
//            child: Container(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    "Documaent Status",
//                    style: TextStyle(
//                        fontFamily: "Title",
//                        fontSize: 15.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Container(
//                        width: MediaQuery.of(context).size.width - 32,
//                        child: DropdownButtonHideUnderline(
//                            child: ButtonTheme(
//                              alignedDropdown: true,
//                              child: new DropdownButton(
//                                value: currentStatus,
//                                items: dropDownMenuItems,
//                                onChanged: changedDropDownItem,
//                              )
//                            )
//                        )
//                      ),
//
//                    ],
//                  ),
//                  Container(
//                    height: 1.0,
//                    color: Colors.grey[600],
//                  ),
//                ],
//              ),
//            ),
//          ),
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
            child: forcaText("MR Line",
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                align: TextAlign.center),
          ),
          mrParam.list_line.isEmpty
              ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  forcaText("MR Line is Empty", fontSize: 17.0),
                  forcaText("Press '+' to add line", fontSize: 12.0),
                ],
              ))
              : Container(
            height: 1000,
            child: ListView.builder(
              itemBuilder: (c, i) => _lineItem(mrParam.list_line[i], index: i),
              itemCount: mrParam.list_line.length,
            ),
          ),
        ],
      ),
    );
  }

  _lineItem(MrLine line, {int index}) {
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
                        style: TextStyle(fontFamily: "Title", fontSize: 14.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Text(
                      line.line_number ?? "",
                      style: TextStyle(
                          fontFamily: "Subtitle",
                          fontSize: 14.0,
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
                      line.productName ?? "",
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
//                        _detailLine(line);
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
//                            editMasterLine(line, index);
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
//                            delete(line);
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

  _detailLine(SoLine line) {
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
                            line.productName ?? " ",
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
                            line.price.toString() ?? "0",
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
                            line.qty.toString() ?? "0",
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
                            line.discount.toString() ?? "0",
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
                            line.uomName ?? " ",
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
                            line.taxName ?? " ",
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
                            (line.price * line.qty).toString() ?? "0",
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
      resizeToAvoidBottomPadding: true,
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create MR",
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
              child: forcaButton(forcaText("Create MR", color: Colors.white), () {
                 if (mrParam.list_line.isNotEmpty) {
                    createMR();
                  } else {
                   MyDialog(context, "FAILED", "Please add line", Status.ERROR)
                        .build(() {
                     Navigator.pop(context);
                    });
                 }
//            if(widget.orderItem == null){ //create SO
//                  if (mrParam.list_line.isNotEmpty) {
//                    createMR();
//                  } else {
//                    MyDialog(context, "FAILED", "Please add line", Status.ERROR)
//                        .build(() {
//                      Navigator.pop(context);
//                    });
//                  }
//                }else{//update SO
//                  updateSO();
//                }
              },
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
