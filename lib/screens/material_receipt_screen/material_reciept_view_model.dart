import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/material_receipt.dart';
import 'package:forca_so/models/material_receipt/material_receipt_response.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class MaterialRecieptViewModel extends State<MaterialRecieptScreen> {
  DocumentStatus documentStatus = DocumentStatus.COMPLETED;
  bool isReq = true;
  int page = 1;
  String startDate = "Select Date";
  String endDate = "Select Date";
  List<MaterialReceipt> listMaterialReceipt = List();

  getMaterialReceipts(
      {String status,
      String page,
      String perPage,
      String dateFrom,
      String dateTo}) async {
    isReq = true;
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var myBody = {"issotrx": "Y"};
    if (page != null) myBody.addAll({"page": page});
    if (perPage != null) myBody.addAll({"perPage": perPage});
    if (status != null) myBody.addAll({"status": status});
    if (dateFrom != null) myBody.addAll({"datefrom": dateFrom});
    if (dateTo != null) myBody.addAll({"dateto": dateTo});
    var response = await http
        .post("$url$MATERIAL_RECEIPT",
            headers: {"Forca-Token": usr.token}, body: myBody)
        .catchError((err) => print("${err.toString()}"));
    setState(() {
      if (context != null && response != null) {
        isReq = false;
        var res = jsonDecode(response.body);
        if (res["codestatus"] == "S") {
          MaterialReceiptResponse materialReceiptResponse =
              MaterialReceiptResponse.fromJsonMap(res);
          listMaterialReceipt
              .addAll(materialReceiptResponse.listMaterialReceipt);
        }
        print("response receipt ${listMaterialReceipt.length}");
      }
    });
  }
}
