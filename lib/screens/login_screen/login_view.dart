import 'package:flutter/material.dart';
import 'package:forca_so/screens/login_screen/login_view_model.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class LoginView extends LoginViewModel {
  _body() {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  forcaLogo(width: 130),
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        labelText: "Username", prefixIcon: Icon(Icons.person)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    controller: password,
                    obscureText: !isShow,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            icon: Icon(isShow
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => setShow())),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: forcaButton(
                        forcaText("LOGIN", color: Colors.white, fontSize: 17.0),
                        () => login()),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () => settingUrl(),
                          child: forcaText("Setting",
                              fontSize: 17.0, color: Colors.blue)),
                      FlatButton(
                          onPressed: () {
//                            gotoWelcome(context);
                            MyDialog(context, "TEST", "ini errornya",
                                    Status.ERROR)
                                .build(() {
                              print("test");
                            });
                          },
                          child: forcaText("How to login?",
                              fontSize: 17.0, color: Colors.blue)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _body(),
    );
  }
}
