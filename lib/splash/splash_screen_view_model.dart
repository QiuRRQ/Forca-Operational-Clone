import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forca_so/home_screen/home_screen.dart';
import './splash_screen.dart';


abstract class SplashViewModel extends State<SplashScreen> {
  // Add your state and logic here
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> HomeScreen())));
    super.initState();
  }
}
