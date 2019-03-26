import 'package:flutter/material.dart';
import './create_i_m.dart';
import 'package:forca_so/models/im_line/im_line.dart';

abstract class CreateIMViewModel extends State<CreateIM> {
  // Add your state and logic here
  List<IMLine> imLine = List();
  addLine (IMLine line){
    setState(() {
      imLine.add(line);
    });
  }
}
