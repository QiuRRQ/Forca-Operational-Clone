import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/resultdata.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MaterialRecieptViewModel extends State<MaterialRecieptScreen> {
  // Add your state and logic here
  DocumentStatus documentStatus = DocumentStatus.COMPLETED;
  bool isReq = true;
  int page = 1;
  String startDate = "Select Date";
  String endDate = "Select Date";
  List<String> materialReceipts = List();

  setData(){
    for (var i = 0; i < 10; i++) {
      setState(() {
        materialReceipts.add("value");
      });
    }
  }


  getMaterialList() async{
    isReq = true;
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL) ?? ""}$LIST_MATERIAL_RECIEPT";
    var myBody = {
      "issotrx": "Y",
      "status": StatusDocument(documentStatus).getName(),
      "page": page.toString()
    };
    if (startDate != "Select Date" && startDate.isNotEmpty) {
      myBody.addAll({"datefrom": startDate});
    }
    if (endDate != "Select Date" && endDate.isNotEmpty) {
      myBody.addAll({"dateto": endDate});
    }
    var res = await http.post(url);

    print(res.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMaterialList();
  }
// usr.token (get user token force)
}
