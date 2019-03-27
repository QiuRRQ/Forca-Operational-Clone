import 'package:flutter/material.dart';
import './material_reciept_screen.dart';

abstract class MaterialRecieptViewModel extends State<MaterialRecieptScreen> {
  // Add your state and logic here
  List<String> materialReceipts = List();
  setData(){
    for (var i = 0; i < 10; i++) {
      setState(() {
        materialReceipts.add("value");
      });
    }
  }
}
