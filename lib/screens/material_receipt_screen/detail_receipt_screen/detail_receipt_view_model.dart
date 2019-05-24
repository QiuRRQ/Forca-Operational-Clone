import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/material_receipt_screen/detail_receipt_screen/detail_receipt_screen.dart';
import 'package:forca_so/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
abstract class DetailReceiptViewModel extends State<DetailReceiptScreen> {
  DetailMaterialReceipt detailMaterialReceipt;
  bool isReq = true;
  _detailReceipt()async{
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL) ?? ""}$DETAIL_RECEIPT";
    var myBody = {
      "m_inout_id":widget.docNumer,
      "issotrx":"Y"
    };
    print(myBody);
    var header = {"Forca-Token":usr.token};
    var response = await http.post(url,body: myBody,headers: header).catchError((err){
      isReq = false;
      print('hasil ${err.toString()}');
    });
    print("hasil ${response.body}");
  }

  @override
  void initState() {
    _detailReceipt();
    super.initState();
  }
}
