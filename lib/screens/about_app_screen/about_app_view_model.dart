import 'package:flutter/material.dart';
import 'package:forca_so/screens/about_app_screen/about_app_screen.dart';
import 'package:package_info/package_info.dart';

abstract class AboutAppViewModel extends State<AboutAppScreen> {
  // Add your state and logic here
  String versionName = "";

  _getVersion() async {
    var version = await PackageInfo.fromPlatform();
    versionName = version.version;
    setState(() {});
  }
  @override
  void initState() {
    _getVersion();
    super.initState();
  }
}
