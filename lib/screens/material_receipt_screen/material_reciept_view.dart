import 'package:flutter/material.dart';
import 'package:forca_so/master/filter_document.dart';
import 'package:forca_so/models/material_receipt/material_receipt.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_view_model.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/forca_assets.dart';

class MaterialReceiptView extends MaterialRecieptViewModel {
  _body() {
    return Container(
      margin: EdgeInsets.only(right: 8.0, left: 8.0),
      child: isReq && listMaterialReceipt.isEmpty
          ? _loading()
          : !isReq && listMaterialReceipt.isEmpty ? _noData() : _data(),
    );
  }

  _data() {
    return ListView.builder(
      itemCount: listMaterialReceipt.length,
      itemBuilder: (_, i) => _item(listMaterialReceipt[i]),
    );
  }

  _item(MaterialReceipt materialReceipt) {
    return InkWell(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    materialReceipt.documentNo ?? "",
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
                    "Movement Date",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    materialReceipt.movementDate.split(" ")[0] ?? "",
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
                    "BPartner",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    materialReceipt.name ?? "",
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
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (c) => DetailReceiptScreen()));
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
                      materialReceipt.status == "Drafted"
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
                          disabledColor: DocumentStatusColor()
                              .getColor(materialReceipt.status ?? ""),
                          child: Text(
                            materialReceipt.status ?? "",
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

  _filter() {
    showModalBottomSheet(
        context: context,
        builder: (c) => FilterDocument(documentStatus,startDate,endDate,(filterParam) {
          Navigator.pop(context);
          page = 1;
          listMaterialReceipt.clear();
          documentStatus = filterParam.documentStatus;
          startDate = filterParam.startDate;
          endDate = filterParam.endDate;
          setState(() {
            isReq = true;
          });
          getMaterialReceipts();
        }));
  }
  @override
  void initState() {
    getMaterialReceipts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Material Receipt", style: TextStyle(fontFamily: "Title")),
        actions: <Widget>[
          FlatButton(
              onPressed: _filter,
              child: forcaText("Filter", color: Colors.white, fontSize: 17.0))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (c) => AddMaterialReceiptScreen())),
        tooltip: "Add New Document",
        child: Icon(Icons.add),
      ),
      body: _body(),
    );
  }
}
