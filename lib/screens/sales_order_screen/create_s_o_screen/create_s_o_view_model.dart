import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';

abstract class CreateSOViewModel extends State<CreateSOScreen> {
  // Add your state and logic here
  List<Line> poLines = List();
  addLine(Line line){
    setState(() {
      poLines.add(line);
    });
  }
}
