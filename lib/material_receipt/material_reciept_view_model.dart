import 'package:flutter/material.dart';
import './material_reciept.dart';

abstract class MaterialRecieptViewModel extends State<MaterialReciept> {
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
