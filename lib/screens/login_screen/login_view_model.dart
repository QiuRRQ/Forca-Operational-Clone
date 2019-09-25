import 'package:flutter/material.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/models/user/user_response.dart';
import 'package:forca_so/screens/login_screen/login_screen.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:forca_so/screens/home_screen/home_screen.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginViewModel extends State<LoginScreen> {
  var username = TextEditingController();
  var password = TextEditingController();
  var url = TextEditingController();
  bool isShow = false;

  setShow() {
    setState(() {
      isShow = isShow ? false : true;
    });
  }

  login() async {
    var pref = await SharedPreferences.getInstance();
    String url = pref.getString(BASE_URL) ?? "";
    print("URL $url");
    if (url == "") {
      dialogUrl(url);
    } else {
      if (username.text.isEmpty ||
          username.text == null ||
          username.text == "") {
        MyDialog(context, "Error", "username required", Status.ERROR).build(() {
          Navigator.pop(context);
        });
        return;
      }
      if (password.text.isEmpty ||
          password.text == null ||
          password.text == "") {
        MyDialog(context, "Error", "password required", Status.ERROR).build(() {
          Navigator.pop(context);
        });
        return;
      }
      loginProcess(url);
    }
  }

  loginProcess(String baseUrl) async {
    Loading(context).show();
    String url = "$baseUrl$LOGIN";
    print(url);
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text
    }).catchError((error) {
      Navigator.pop(context);
      MyDialog(context, "Error!", "Couldn't any response from $baseUrl",
              Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return;
    });
    if (response.body != null) {
      print(response.body);
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Map res = jsonDecode(response.body);
        if (res["codestatus"] == "S") {
          UserResponse userResponse = UserResponse.fromJsonMap(res);
          saveToken(userResponse.user);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeScreen()));
        } else {
          MyDialog(context, "Error", res["message"], Status.ERROR).build(() {
            Navigator.pop(context);
          });
        }
      }
    }
  }

  saveToken(User user) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString(USER, jsonEncode(user));
  }

  settingUrl() async {
    var ref = await SharedPreferences.getInstance();
    var url = ref.getString(BASE_URL) ?? "";
    this.url.text = url;
    dialogUrl(url);
  }

  saveUrl(String url) async {
    var ref = await SharedPreferences.getInstance();
    ref.setString(BASE_URL, url);
  }

  dialogUrl(String baseUrl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
            content: Container(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: forcaText("SETTING",
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  forcaText("URL Adress Destination"),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  TextFormField(
                    style: TextStyle(
                      fontFamily: "Title",
                    ),
                    controller: url,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Input your URL"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: forcaText("SAVE", fontSize: 20.0),
                      onPressed: () {
                        Navigator.pop(context);
                        saveUrl(url.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    saveUrl("https://qa.forca.id:8888");
    super.initState();
  }
}
