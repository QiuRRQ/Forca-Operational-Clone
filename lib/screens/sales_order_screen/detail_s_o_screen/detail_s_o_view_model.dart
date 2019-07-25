import 'dart:convert';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DetailSOViewModel extends State<DetailSOScreen> {
  // Add your state and logic here
  DetailSalesOrder salesOrder;
  List<Line> poLines = List();
  List<Widget> linesWidget = List();

  addLine(Line line) {
    setState(() {
      poLines.add(line);
    });
  }

  setComplete()async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$SET_SOCOMPLETE";
    var myBody = {
      "c_order_id": salesOrder.orderID.toString()
    };
    print("line param : $myBody");
    var response = await http.post(url, body: myBody, headers: {
      "Forca-Token": user.token
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    if (response != null) {
      print("res complete ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
  }

  deleteOrder()async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$DEL_ORDER";
    var myBody = {
      "c_order_id": salesOrder.orderID.toString()
    };
    print("line param : $myBody");
    var response = await http.post(url, body: myBody, headers: {
      "Forca-Token": user.token
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    if (response != null) {
      print("res del ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  void initState() {
    salesOrder = widget.salesOrder;
    super.initState();
  }

}
