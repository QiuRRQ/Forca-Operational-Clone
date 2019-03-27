import 'package:flutter/material.dart';
import './about_app_view_model.dart';

class AboutAppView extends AboutAppViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About App',
          style: TextStyle(fontFamily: "Title"),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Forca Operation Mobile',
                style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(
                'Versi 1.0.0',
                style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Image.asset(
                'assets/images/logo_forca.png',
                width: 100.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                'Copyright 2019 sisi.id\nAll right reserved',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
