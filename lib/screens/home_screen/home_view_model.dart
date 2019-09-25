import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/home_screen/home_screen.dart';
import 'package:forca_so/screens/inventory_move_screen/inventory_move_screen.dart';
import 'package:forca_so/screens/login_screen/login_screen.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_screen.dart';
import 'package:forca_so/screens/home_screen/menu.dart';
import 'package:forca_so/screens/about_app_screen/about_app_screen.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/utils/string.dart';

abstract class HomeViewModel extends State<HomeScreen> {
  // Add your state and logic here
  int status = 1;
  User user;
  var url = TextEditingController();
  List<HomeMenu> menus = List();

  _addMenu() {
    menus.add(
        HomeMenu("SO", "Sales Order", Icons.unarchive, SalesOrderScreen()));
    menus.add(HomeMenu(
        "MR", "Material Receipt", Icons.local_shipping, MaterialReceiptScreen()));
    menus.add(HomeMenu("IM", "Inventory Move", Icons.swap_horizontal_circle,
        InventoryMoveScreen()));
    menus.add(HomeMenu(
        "INFO", "APP Information", Icons.info, AboutAppScreen()));
//    menus.add(HomeMenu(
//        "APPROVAL","Forca Approval", Icons.assignment_turned_in, InventoryMoveScreen()));
//    menus.add(HomeMenu(
//        "PD","Forca Performance Dashboard", Icons.multiline_chart, InventoryMoveScreen()));
  }

  logout() {
    Navigator.pop(context);
    MyDialog(context, "Logout", "Are you sure?", Status.WARNING).build(() {
      logoutProcess();
    }, cancel: () {
      Navigator.pop(context);
    });
  }

  settingUrl() async {
    var ref = await SharedPreferences.getInstance();
    var url = ref.getString(BASE_URL) ?? "";
    this.url.text = url;
    dialogUrl(url);
  }

  dialogUrl(String baseUrl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
            content: Container(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: forcaText("SETTING",
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  forcaText("URL Adress Destination"),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  TextFormField(
                    style: TextStyle(
                      fontFamily: "Title",
                    ),
                    controller: url,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Input your URL"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: forcaText("SAVE", fontSize: 20.0),
                      onPressed: () {
                        Navigator.pop(context);
                        saveUrl(url.text);
                        logout();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  saveUrl(String url) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString(BASE_URL, url);
  }

  logoutProcess() async {
    var ref = await SharedPreferences.getInstance();
    ref.setString(USER, null);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => LoginScreen()));
  }

  getUserInfo() async{
    var ref = await SharedPreferences.getInstance();
    setState(() {
      user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
    });
  }

  doFirst()async{
    await _addMenu();
    await getUserInfo();
  }

  @override
  void initState() {
    doFirst();
    super.initState();
  }
}
