import 'package:flutter/material.dart';
import 'package:forca_so/models/im_line/im_line.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_screen.dart';


abstract class DetailIMViewModel extends State<DetailIMScreen>{
  InventoryMoveDetail inventoryMoveDetail;
  List<IMLine> imLine = List();
  List<Widget> linesWidget = List();
  addLine(IMLine line){
    setState(() {
      imLine.add(line);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    inventoryMoveDetail = widget.inventorymoveDetail;
    super.initState();
  }
}