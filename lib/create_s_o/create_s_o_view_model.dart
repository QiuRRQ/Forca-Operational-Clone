import 'package:flutter/material.dart';
import './create_s_o.dart';
import 'package:forca_so/models/po_line/line.dart';

abstract class CreateSOViewModel extends State<CreateSO> {
  // Add your state and logic here
  List<Line> poLines = List();
  addLine(Line line){
    setState(() {
      poLines.add(line);
    });
  }
}
