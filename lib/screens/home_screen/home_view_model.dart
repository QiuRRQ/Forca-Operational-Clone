import 'package:flutter/material.dart';
import 'package:forca_so/screens/home_screen/home_screen.dart';
import 'package:forca_so/screens/inventory_move_screen/inventory_move_screen.dart';
import 'package:forca_so/screens/login_screen/login_screen.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_screen.dart';
import 'package:forca_so/screens/home_screen/menu.dart';
import 'package:forca_so/screens/about_app_screen/about_app_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/utils/string.dart';

abstract class HomeViewModel extends State<HomeScreen> {
  // Add your state and logic here
  int status = 1;
  List<HomeMenu> menus = List();

  _addMenu() {
    menus.add(
        HomeMenu("SO", "Sales Order", Icons.unarchive, SalesOrderScreen()));
    menus.add(HomeMenu(
        "MR", "Material Receipt", Icons.view_agenda, MaterialReceiptScreen()));
    menus.add(HomeMenu("IM", "Inventory Move", Icons.vertical_align_top,
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

  logoutProcess() async {
    var ref = await SharedPreferences.getInstance();
    ref.setString(USER, null);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => LoginScreen()));
  }

  @override
  void initState() {
    _addMenu();
    super.initState();
  }
}
