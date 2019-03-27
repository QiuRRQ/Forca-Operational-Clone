import 'package:flutter/material.dart';
import './login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:forca_so/home/home.dart';

abstract class LoginViewModel extends State<LoginScreen> {
  // Add your state and logic here
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    if (username.text == null || username.text.isEmpty) {
      error("Username required");
      return;
    }
    if (password.text == null || password.text.isEmpty) {
      error("Password required");
      return;
    }
    var response = await http
        .post("https://qa.forca.id:8888/api/ws/authentication/v3/login", body: {
      "username": username.text,
      "password": password.text
    }).catchError((error) {
      error("Internal Server Error!");
    });
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["codestatus"] == "S") {
        print("Sukses coyy");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => Home()));
      } else {
        error(jsonDecode(response.body)["message"]);
      }
      print("${response.body}");
    } else {
      error("Internal Server Error!");
    }
  }

  error(String error) {
    showModalBottomSheet(
        context: context,
        builder: (c) => Container(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        color: Colors.red,
                        height: 40.0,
                        child: Center(
                            child: Text(
                          "Error!",
                          style: TextStyle(
                              fontFamily: "Title",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
                    Container(
                      margin: EdgeInsets.only(top: 20.0,right: 16.0,left: 16.0,bottom: 20.0),
                        height: 40.0,
                        child: Center(
                            child: Text(
                              error,
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 17.0,

                                  color: Colors.black),
                            ))),
                  ],
                ),
              ),
            ));
  }
}
