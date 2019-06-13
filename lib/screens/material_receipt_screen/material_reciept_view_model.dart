import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt_response.dart';
import 'package:forca_so/models/material_receipt/material_receipt.dart';
import 'package:forca_so/models/material_receipt/material_receipt_response.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_receipt_screen/detail_receipt_screen.dart';

abstract class MaterialReceiptViewModel extends State<MaterialReceiptScreen> {
  DocumentStatus documentStatus = DocumentStatus.COMPLETED;
  bool isReq = true;
  int page = 1;
  String startDate = "Select Date";
  String endDate = "Select Date";
  List<MaterialReceipt> listMaterialReceipt = List();

  getMaterialReceipts() async {
    isReq = true;
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var myBody = {
      "status": StatusDocument(documentStatus).getName(),
      "page": page.toString(),
    };
    if (startDate != "Select Date") myBody.addAll({"datefrom": startDate});
    if (endDate != "Select Date") myBody.addAll({"dateto": endDate});
    print(myBody);
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

  setDefault() {
    listMaterialReceipt.clear();
    page = 1;
  }

  getDetail(MaterialReceipt materialReceipt) async {
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var myBody = {"m_inout_id": materialReceipt.inOutID,
    "issotrx":"Y"};
    var response = await http.post("$url$DETAIL_RECEIPT",
        headers: {"Forca-Token": usr.token},
        body:myBody ).catchError((err) {});
    Navigator.pop(context);
    if (response != null) {
      print(response.body);
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var detailResponse = DetailMaterialReceiptResponse.fromJsonMap(res);
        var materialReceipt = detailResponse.materialReceipts;
        Navigator.push(context,
            MaterialPageRoute(builder: (c) => DetailReceiptScreen(materialReceipt)));
      } else {
        MyDialog(context, "Failur", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  void initState() {
    getMaterialReceipts();
    super.initState();
  }
}
