import 'package:flutter/material.dart';
import './about_app_view_model.dart';
  
class AboutAppView extends AboutAppViewModel {
    
  @override
  Widget build(BuildContext context) {
    
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text('About App',style: TextStyle(
          fontFamily: "Title"
        ),),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              
            ],
          ),
        ),
      ),
    );
  }
}

