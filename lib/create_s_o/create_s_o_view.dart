import 'package:flutter/material.dart';
import './create_s_o_view_model.dart';
  
class CreateSOView extends CreateSOViewModel {
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create SO",
          style: TextStyle(fontFamily: "Title",fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

