import 'package:flutter/material.dart';
import 'package:forca_so/screens/home_screen/home_screen.dart';
import 'package:forca_so/screens/inventory_move_screen/inventory_move_screen.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/screens/material_receipt_screen/material_reciept_screen.dart';
import 'package:forca_so/screens/home_screen/menu.dart';

abstract class HomeViewModel extends State<HomeScreen> {
  // Add your state and logic here
  int status = 1;
  List<HomeMenu> menus = List();
  _addMenu() {
    menus.add(HomeMenu("SO","Sales Order", Icons.unarchive, SalesOrderScreen()));
    menus.add(HomeMenu(
        "MR","Material Receipt", Icons.view_agenda, MaterialRecieptScreen()));
    menus.add(HomeMenu(
        "IM","Inventory Move", Icons.vertical_align_top, InventoryMoveScreen()));
    menus.add(HomeMenu(
        "APPROVAL","Forca Approval", Icons.assignment_turned_in, InventoryMoveScreen()));
    menus.add(HomeMenu(
        "PD","Forca Performance Dashboard", Icons.multiline_chart, InventoryMoveScreen()));
    menus.add(HomeMenu(
        "INFO","Forca App Info", Icons.info, InventoryMoveScreen()));
  }
  @override
  void initState() {
    _addMenu();
    super.initState();
  }
}
