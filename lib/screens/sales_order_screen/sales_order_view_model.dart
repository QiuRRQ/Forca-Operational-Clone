import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order_response.dart';
import 'package:forca_so/models/sales_order/sales_order_reponse.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_screen.dart';
import 'package:toast/toast.dart';

abstract class SalesOrderViewModel extends State<SalesOrderScreen> {
  DocumentStatus documentStatus = DocumentStatus.DRAFTED;
  bool isReq = true;
  List<SalesOrder> listSO = List();
  int page = 1;
  String startDate = "Select Date";
  String endDate = "Select Date";
  bool isFilter= false;

  getSOList() async {
    isReq = true;
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
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
    print("myBody $myBody");
    var response = await http.post("$url$LIST_SO",
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
          var listData = SalesOrderReponse.fromJsonMap(res).listSO;
          if (listData.isNotEmpty) {
            setState(() {
              page++;
              listSO.addAll(SalesOrderReponse.fromJsonMap(res).listSO);
            });
          }
          var totaldata = res['pagination']['totaldata'];
          Toast.show("total document ${totaldata} ",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
        } else {}
      }
    }
  }

  setDefault() {
    listSO.clear();
    page = 1;
  }

  getDetail(SalesOrder salesOrder) async {
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$DETAIL_SO",
        headers: {"Forca-Token": usr.token},
        body: {"c_order_id": salesOrder.orderID}).catchError((err) {});
    Navigator.pop(context);
    if (response != null) {
      print(response.body);
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var detailResponse = DetailSalesOrderResponse.fromJsonMap(res);
        var salesOrder = detailResponse.detail;
        Navigator.push(context,
            MaterialPageRoute(builder: (c) => DetailSOScreen(salesOrder)));
      } else {
        MyDialog(context, "Failur", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  void initState() {
    getSOList();
    super.initState();
  }

}
