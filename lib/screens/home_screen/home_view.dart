import 'package:flutter/material.dart';
import 'package:forca_so/screens/about_app_screen/about_app_screen.dart';
import 'package:forca_so/screens/home_screen/home_view_model.dart';
import 'package:forca_so/screens/home_screen/menu.dart';
import 'package:forca_so/utils/text_widget.dart';

class HomeView extends HomeViewModel {
  _menu() {
    return Container(
      child: ListView(
        children: <Widget>[
          _header(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _menuItem(menus[0]),
              _menuItem(menus[1]),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _menuItem(menus[2]),
              _menuItem(menus[3]),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8),),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              _menuItem(menus[4]),
//              _menuItem(menus[5]),
//            ],
//          )
        ],
      ),
    );
  }

  _header() {
    return Container(
      child: Image.asset(
        'assets/images/logo_forca.png',
        height: 80,
      ),
    );
  }

  _menuItem(HomeMenu menu) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (c) => menu.navigator)),
      child: Card(
        child: Container(
          width: (MediaQuery.of(context).size.width / 2) - 20,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  forcaTitle("Forca ",
                      weight: FontWeight.bold, color: Colors.black, size: 17.0),
                  forcaTitle(menu.title, color: Colors.black, size: 17.0),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Icon(
                menu.icon,
                size: 50.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              forcaTitle(menu.description,
                  color: Colors.black, size: 14.0, align: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: forcaTitle("Forca Operational",
              size: 17.0, color: Colors.white, weight: FontWeight.bold),
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                        'https://sisi.id/wp-content/uploads/6016/11/Logo-SISI-800x481-e1478515725941.png',
                        height: 80,
                      ),
                      Text(
                        "Cong Fandi",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      Text(
                        "congfandi@gmail.com",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Setting',
                style: TextStyle(fontFamily: "Title", fontSize: 14.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About App',
                style: TextStyle(fontFamily: "Title", fontSize: 14.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => AboutAppScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: TextStyle(fontFamily: "Title", fontSize: 14.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
        body: _menu());
  }
}
