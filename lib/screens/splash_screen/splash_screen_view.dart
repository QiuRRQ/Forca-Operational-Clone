import 'package:flutter/material.dart';
import 'package:forca_so/screens/splash_screen/splash_screen_view_model.dart';
import 'package:forca_so/utils/string.dart';
class SplashScreenView extends SplashViewModel {
    
  @override
  Widget build(BuildContext context) {
    
    // Replace this with your build function
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
       child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
            child: Image.asset('assets/images/logo_forca.png',width: 130.0,),
          ),
          Text(APP_VERSION_NAME,style: TITLE_STYLE,),
        ],
       ), 
      ),
    );
  }
}

