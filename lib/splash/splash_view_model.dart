import 'dart:async';

import 'package:flutter/material.dart';
import './splash.dart';
import 'package:forca_so/login/login.dart';

abstract class SplashViewModel extends State<Splash> {
  // Add your state and logic here
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Login())));
    super.initState();
  }
}
