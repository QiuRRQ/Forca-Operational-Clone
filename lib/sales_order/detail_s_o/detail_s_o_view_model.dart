import 'package:flutter/material.dart';
import './detail_s_o.dart';
import 'package:forca_so/models/po_line/line.dart';

abstract class DetailSOViewModel extends State<DetailSO> {
  // Add your state and logic here
  List<Line> poLines = List();
  addLine(Line line){
    setState(() {
      poLines.add(line);
    });
  }
}
