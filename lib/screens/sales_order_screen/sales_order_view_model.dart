import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forca_so/models/sales_order/sales_order_reponse.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';

abstract class SalesOrderViewModel extends State<SalesOrderScreen> {
  DocumentStatus documentStatus = DocumentStatus.DRAFTED;
  bool isReq = true;
  List<SalesOrder> listSO = List();

  getSOList() async {
    listSO.clear();
    isReq = true;
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$LIST_SO", body: {
      "issotrx": "Y",
      "status": Status(documentStatus).getName(),
    }, headers: {
      "Forca-Token": usr.token
    }).catchError((err) {});
    isReq = false;
    if (context != null && response.body != null) {
      print(response.body);
      if (response.statusCode == 200) {
        Map res = jsonDecode(response.body);
        if (res["codestatus"] == "S") {
          setState(() {
            listSO.addAll(SalesOrderReponse.fromJsonMap(res).listSO);
          });
        } else {}
      }
    }
  }

  @override
  void initState() {
    getSOList();
    super.initState();
  }
}
