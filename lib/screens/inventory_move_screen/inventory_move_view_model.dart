import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventory_move_detail_response.dart';
import 'package:forca_so/models/inventory_move/inventory_move_response.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_screen.dart';
import 'package:forca_so/screens/inventory_move_screen/inventory_move_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

abstract class InventoryMoveViewModel extends State<InventoryMoveScreen> {
  // Add your state and logic here
  DocumentStatus documentStatus = DocumentStatus.DRAFTED;
  bool isReq = true;
  bool isFilter = false;
  List<InventoryMove> listInventoryMove = List();
  int page = 1;
  String startDate = "Select Date";
  String endDate = "Select Date";
  String documentNo = "Document No";

  getIMList() async {
    isReq = true;
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var myBody = {
      "status": StatusDocument(documentStatus).getName(),
      "page": page.toString()
    };
    if (startDate != "Select Date" && startDate.isNotEmpty) {
      myBody.addAll({"datefrom": startDate});
    }
    if (endDate != "Select Date" && endDate.isNotEmpty) {
      myBody.addAll({"dateto": endDate});
    }
    if (documentNo != "Document No" && documentNo.isNotEmpty) {
      myBody.addAll({"documentno": documentNo});
      documentNo = "Document No";
    }
    print("myBody $myBody");
    var response = await http.post("$url$LIST_IM",
        body: myBody, headers: {"Forca-Token": usr.token}).catchError((err) {
      print("error ${err.toString()}");
    });
    if (context != null && response != null) {
      setState(() {
        isReq = false;
      });
      print(response.body);
        if (response.statusCode == 200) {
        Map res = jsonDecode(response.body);
        if (res["codestatus"] == "S") {
          var listData = InventoryMoveResponse.fromJsonMap(res).listIM;
          if (listData.isNotEmpty) {
            setState(() {
              page++;
              listInventoryMove.addAll(InventoryMoveResponse.fromJsonMap(res).listIM);
            });
          }
          var totaldata = res['pagination']['totaldata'];
          Toast.show("total document ${totaldata} ",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
        } else {}
      }
    }
  }

  getDetailIM(InventoryMove inventorymove)async{
  Loading(context).show();
  var ref = await SharedPreferences.getInstance();
  var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
  var url = ref.getString(BASE_URL) ?? "";
  var response = await http.post("$url$DETAIL_IM",
      headers: {"Forca-Token": usr.token},
      body: {"m_movement_id": inventorymove.m_movement_id}).catchError((err) {});
  Navigator.pop(context);
  if (response != null) {
    var isi = response.body;
    print("iki isine $isi");
    var res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      var detailResponse = InventoryMoveDetailResponse.fromJsonMap(res);
      var inventorymoveDetail = detailResponse.inventorymove_detail;
      Navigator.push(context,
          MaterialPageRoute(builder: (c) => DetailIMScreen(inventorymoveDetail)));
    } else {
      MyDialog(context, "Failur", res["message"], Status.ERROR).build(() {
        Navigator.pop(context);
      });
    }
  }
  }

  getIMData(InventoryMove inventorymove)async{
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$DETAIL_IM",
        headers: {"Forca-Token": usr.token},
        body: {"m_movement_id": inventorymove.m_movement_id}).catchError((err) {});
    Navigator.pop(context);
    if (response != null) {
      print(response.body);
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
//        var detailResponse = InventoryMoveDetailResponse.fromJsonMap(res);
//        var inventorymoveDetail = detailResponse.inventorymove_detail;
//        Navigator.push(context,
//            MaterialPageRoute(builder: (c) =>EditIMScreen()));
      } else {
        MyDialog(context, "Failur", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
  }


  setDefault() {
    listInventoryMove.clear();
    page = 1;
  }


  @override
  void initState() {
    // TODO: implement initState
    getIMList();
    super.initState();

  }
}
