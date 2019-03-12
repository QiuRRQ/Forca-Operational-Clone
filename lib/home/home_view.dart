import 'package:flutter/material.dart';
import './home_view_model.dart';
import 'package:forca_so/inventory_move/inventory_move.dart';

class HomeView extends HomeViewModel {
  _menu() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width / 2 - 40,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Card(
                        child: Center(child: Text("Sales Order")),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2 - 40,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Card(
                        child: Center(child: Text("Material Receipt")),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width / 2 - 40,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Card(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c)=>InventoryMove()));
                          },
                          child: Center(child: Text("Inventory Move"))),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2 - 40,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Card(
                        child: Center(child: Text("About App")),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width / 2 - 40,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Card(
                        child: Center(child: Text("Setting")),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2 - 40,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Card(
                        child: Center(child: Text("Logout")),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Forca SO",
            style: TextStyle(fontFamily: "Title"),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                "Status",
                style: TextStyle(fontFamily: "Title", color: Colors.white),
              ),
            )
          ],
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
