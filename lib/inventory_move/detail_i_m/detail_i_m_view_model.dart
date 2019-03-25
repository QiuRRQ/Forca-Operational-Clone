import 'package:flutter/material.dart';
import 'package:forca_so/models/im_line/im_line.dart';
import 'package:forca_so/inventory_move/detail_i_m/detail_i_m.dart';

abstract class DetailIMViewModel extends State<DetailIM>{
  List<IMLine> imLine = List();
  addLine(IMLine line){
    setState(() {
      imLine.add(line);
    });
  }

}