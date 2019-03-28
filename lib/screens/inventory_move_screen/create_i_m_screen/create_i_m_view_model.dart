import 'package:flutter/material.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_screen.dart';
import 'package:forca_so/models/im_line/im_line.dart';

abstract class CreateIMViewModel extends State<CreateIMScreen> {
  // Add your state and logic here
  List<IMLine> imLine = List();
  addLine (IMLine line){
    setState(() {
      imLine.add(line);
    });
  }
}
