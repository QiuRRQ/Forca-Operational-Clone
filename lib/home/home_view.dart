import 'package:flutter/material.dart';
import './home_view_model.dart';
import 'package:forca_so/inventory_move/inventory_move.dart';
import 'package:forca_so/sales_order/sales_order.dart';
import 'package:forca_so/material_receipt/material_reciept.dart';
import 'package:forca_so/about_app/about_app.dart';
import './menu.dart';

class HomeView extends HomeViewModel {
  
  List<HomeMenu> menus = List();

  _menu() {
    return Container(
      child: Column(
        children: <Widget>[
          _header(),
          Expanded(
            child: GridView.builder(
              itemCount: menus.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (c,i)=>_menuItem(menus[i]),
            ),
          ),
        ],
      ),
    );
  }

  _addMenu(){
    menus.add(HomeMenu("Sales Order", Icons.unarchive, SalesOrder()));
    menus.add(HomeMenu("Material Receipt", Icons.view_agenda, MaterialReciept()));
    menus.add(HomeMenu("Inventory Move", Icons.vertical_align_top, InventoryMove()));
    menus.add(HomeMenu("Setting", Icons.settings, InventoryMove()));
    menus.add(HomeMenu("About App", Icons.info, AboutApp()));
    menus.add(HomeMenu("Logout", Icons.exit_to_app, InventoryMove()));
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
      margin: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.width / 2 - 20,
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (c)=>menu.navigator));
        },
        child: Card(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                menu.icon,
                size: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Text(menu.title,style: TextStyle(fontFamily: "Title",fontSize: 15.0),),
            ],
          )),
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
      backgroundColor: Colors.white,
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
                        'https://sisi.id/wp-content/uploads/2016/11/Logo-SISI-800x481-e1478515725941.png',
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
                Navigator.push(context, MaterialPageRoute(builder: (c)=>AboutApp()));
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
