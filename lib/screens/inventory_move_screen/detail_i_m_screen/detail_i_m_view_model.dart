import 'package:flutter/material.dart';
import 'package:forca_so/models/im_line/im_line.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_screen.dart';


abstract class DetailIMViewModel extends State<DetailIMScreen>{
  List<IMLine> imLine = List();
  addLine(IMLine line){
    setState(() {
      imLine.add(line);
    });
  }
}