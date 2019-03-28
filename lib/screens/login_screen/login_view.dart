import 'package:flutter/material.dart';
import 'package:forca_so/screens/login_screen/login_view_model.dart';
import 'package:forca_so/utils/string.dart';

class LoginView extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  LOGO,
                  width: 120.0,
                )),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller:username,
              decoration:
                  InputDecoration(hintText: 'Please enter username'),
              style: TITLE_STYLE,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              controller: password,
              decoration:
                  InputDecoration(hintText: 'Please enter password'),
              style: TITLE_STYLE,
            ),
             Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: (){
                  login();
                },
                child: Text("Login",style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Title",
                  fontWeight: FontWeight.bold
                ),),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
