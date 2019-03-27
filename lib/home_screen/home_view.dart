import 'package:flutter/material.dart';
import 'package:forca_so/about_app_screen/about_app_screen.dart';
import 'package:forca_so/inventory_move_screen/inventory_move_screen.dart';
import './home_view_model.dart';
import './menu.dart';
import 'package:forca_so/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/material_receipt_screen/material_reciept_screen.dart';

class HomeView extends HomeViewModel {
  List<HomeMenu> menus = List();

  _menu() {
    return Container(
      child: Column(
        children: <Widget>[
          _header(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (c, i) => _menuItem(menus[i]),
              itemCount: menus.length,
            ),
//            GridView.builder(
//              itemCount: menus.length,
//              gridDelegate:
//                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//              itemBuilder: (c, i) => _menuItem(menus[i]),
//            ),
          ),
        ],
      ),
    );
  }

  _addMenu() {
    menus.add(HomeMenu("Sales Order", Icons.unarchive, SalesOrderScreen()));
    menus.add(
        HomeMenu("Material Receipt", Icons.view_agenda, MaterialRecieptScreen()));
    menus.add(
        HomeMenu("Inventory Move", Icons.vertical_align_top, InventoryMoveScreen()));
//    menus.add(HomeMenu("Setting", Icons.settings, InventoryMove()));
//    menus.add(HomeMenu("About App", Icons.info, AboutApp()));
//    menus.add(HomeMenu("Logout", Icons.exit_to_app, InventoryMove()));
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
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      height: 70.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => menu.navigator));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          elevation: 4.0,
          child: Row(

            children: <Widget>[
              Container(
                width: 4.0,
                color: Colors.blue,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width-28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      menu.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: "Title",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        VerticalDivider(),
                        IconButton(
                            icon: Icon(
                              Icons.note_add,
                              color: Colors.blue[300],
                            ),
                            onPressed: () {}),
                        VerticalDivider(),
                        IconButton(
                            icon: Icon(Icons.remove_red_eye,color: Colors.blue[600],), onPressed: () {}),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

//          Center(
//              child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Icon(
//                menu.icon,
//                size: 40.0,
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 8.0),
//              ),
//              Text(
//                menu.title,
//                style: TextStyle(fontFamily: "Title", fontSize: 15.0),
//              ),
//            ],
//          )),
        ),
      ),
    );
  }

  @override
  void initState() {
    _addMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Forca Operational",
            style: TextStyle(fontFamily: "Title"),
          ),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => AboutAppScreen()));
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
