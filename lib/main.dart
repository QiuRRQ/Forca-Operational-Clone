import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forca_so/screens/splash_screen/splash_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main(){
//  bool isInDebugMode = false;

  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  Crashlytics.instance.setUserName("forca Rnd");
  Crashlytics.instance.setUserEmail("rnd.forca@gmail.com");
//  FlutterError.onError = (FlutterErrorDetails details) {
//    if (isInDebugMode) {
//      // In development mode simply print to console.
//      FlutterError.dumpErrorToConsole(details);
//    } else {
//      // In production mode report to the application zone to report to
//      // Crashlytics.
//      Zone.current.handleUncaughtError(details.exception, details.stack);
//    }
//  };

  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forca Mobile Operational',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

