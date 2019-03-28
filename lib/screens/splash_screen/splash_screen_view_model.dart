import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forca_so/screens/splash_screen/splash_screen.dart';
import 'package:forca_so/screens/home_screen/home_screen.dart';

abstract class SplashViewModel extends State<SplashScreen> {
  // Add your state and logic here
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> HomeScreen())));
    super.initState();
  }
}
