import 'package:flutter/material.dart';
import './login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:forca_so/home/home.dart';

abstract class LoginViewModel extends State<Login> {
  // Add your state and logic here
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    if (username.text == null || username.text.isEmpty) {
      print("username wajib di isi");
      return;
    }
    if (password.text == null || password.text.isEmpty) {
      print("password wajib di isi");
      return;
    }
    var response = await http.post("https://qa.forca.id:8888/api/ws/authentication/v3/login",body: {"username":username.text,"password":password.text}
    ).catchError((error) {});
    if (response.statusCode == 200) {
      if(jsonDecode(response.body)["codestatus"]=="S"){
        print("Sukses coyy");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Home()));
      }else{
        print("gagal coyy");
      }
      print("${response.body}");
    } else {

    }
  }
}
