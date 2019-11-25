import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forca_so/screens/splash_screen/splash_screen.dart';
import 'package:forca_so/screens/home_screen/home_screen.dart';
import 'package:forca_so/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/utils/string.dart';
import 'package:package_info/package_info.dart';

abstract class SplashViewModel extends State<SplashScreen> {
  String versionName = "";

  _getVersion() async {
    var version = await PackageInfo.fromPlatform();
    versionName = version.version;
    setState(() {});
  }
  // Add your state and logic here
  @override
  void initState() {
    gotoNextPage();
    super.initState();
  }

  gotoNextPage() async {
    var ref = await SharedPreferences.getInstance();
    var usrStr = ref.getString(USER) ?? "";
    if (usrStr == "") {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => LoginScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeScreen())));
    }
  }
}
