import 'package:flutter/material.dart';
import 'package:forca_so/master/filter_document.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_screen.dart';
import 'package:forca_so/screens/inventory_move_screen/inventory_move_view_model.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/forca_assets.dart';

class InventoryMoveView extends InventoryMoveViewModel {
  _filter() {
    showModalBottomSheet(
        context: context,
        builder: (c) =>
           new FilterDocument(documentStatus, startDate, endDate, (filterParam) {
              Navigator.pop(context);
              page = 1;
              listIM.clear();
              documentStatus = filterParam.documentStatus;
              startDate = filterParam.startDate;
              endDate = filterParam.endDate;
              setState(() {
                isReq = true;
              });
              getIMList();
            }));
  }

  _item(InventoryMove im) {
    return Container(
      height: 130.0,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16.0),
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
                    "${im.documentno}",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
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
                    "${im.movementdate.replaceAll(new RegExp('00:00:00'),'') ?? ""}",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 16.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    child: OutlineButton(
                      onPressed: () => getDetailIM(im),
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
                      im.status == "Drafted"
                          ? Container(
                              height: 30.0,
                              child: OutlineButton(
                                onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateIMScreen(inventoryMove: im,)));
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
                      Padding(padding: EdgeInsets.only(right: 16.0)),
                      Container(
                        height: 30.0,
                        child: RaisedButton(
                          onPressed: null,
                          disabledColor:
                              DocumentStatusColor().getColor(im.status),
                          child: Text(
                            im.status ?? "",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: "Title",
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
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
      getIMList();
    }
  }

  _data() {
    return ListView.builder(
//      controller: _controller,
      itemBuilder: (c, i) => _item(listIM[i]),
      itemCount: listIM.length,
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
          "Iventory Move",
          style: TextStyle(fontFamily: "Title"),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => _filter(),
            child: Text(
              "Filter",
              style: TextStyle(fontFamily: "Title", color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateIMScreen()));
        },
        child: Icon(Icons.add),
      ),
      body:  RefreshIndicator(
        child: Container(
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: isReq && listIM.isEmpty
              ? _loading()
              : !isReq && listIM.isEmpty ? _noData() : _data(),
        ),
        onRefresh: (){
          _loading();
          setDefault();
          getIMList();
          print("refresh iki");
          return isReq ? Future.value(null) : null;
        }
      ),
    );
  }
}
