import 'package:flutter/material.dart';
import './home_view_model.dart';
import 'package:forca_so/create_s_o/create_s_o.dart';
import 'package:forca_so/detail_s_o/detail_s_o.dart';

class HomeView extends HomeViewModel {

  _filter() {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            height: 300.0,
            child: ListView.builder(
              itemBuilder: (c, i) => i == 0
                  ? Container(
                width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 20.0),
                      height: 50.0,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "Select Status",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: "Title", fontSize: 17.0,color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 16.0, left: 16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            status  = i;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text(i == 1
                                ? "Drafted"
                                : i == 2
                                    ? "In Progress"
                                    : i == 3
                                        ? "Completed"
                                        : i == 4
                                            ? "Reversed"
                                            : i == 5 ? "Invalid" : "Closed"),
                            Divider()
                          ],
                        ),
                      ),
                    ),
              itemCount: 7,
            ),
          );
        });
  }

  _item() {
    return Container(
      height: 130.0,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(7.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Doc Number",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "133456",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Nominal",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp. 300.000.00",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Business Partner",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PT. Cong Fandi",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>DetailSO()));
                      },
                      child: Text(
                        "Detail",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 13.0,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[

                      status<3?Container(
                        height: 30.0,
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (c)=>CreateSO()));
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 13.0,
                                color: Colors.black),
                          ),
                        ),
                      ):Container(),
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      Container(
                        height: 30.0,
                        child: RaisedButton(
                          onPressed: null,
                          disabledColor: status == 1
                              ? Colors.yellow
                              : status == 2
                              ? Colors.blue
                              : status == 3
                              ? Colors.green
                              : status == 4
                              ? Colors.orange
                              : status == 5 ? Colors.red : Colors.grey,
                          child: Text(
                            status == 1
                                ? "Drafted"
                                : status == 2
                                ? "In Progress"
                                : status == 3
                                ? "Completed"
                                : status == 4
                                ? "Reversed"
                                : status == 5 ? "Invalid" : "Closed",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 13.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
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
        title: Text(
          "Forca SO",
          style: TextStyle(fontFamily: "Title"),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => _filter(),
            child: Text(
              "Status",
              style: TextStyle(fontFamily: "Title", color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c)=>CreateSO()));
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network('https://sisi.id/wp-content/uploads/2016/11/Logo-SISI-800x481-e1478515725941.png',height: 80,),
                        Text("Cong Fandi",style: TextStyle(fontFamily: "Title"),),
                        Text("congfandi@gmail.com",style: TextStyle(fontFamily: "Title"),),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting',style: TextStyle(fontFamily: "Title",fontSize: 14.0),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About App',style: TextStyle(fontFamily: "Title",fontSize: 14.0),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout',style: TextStyle(fontFamily: "Title",fontSize: 14.0),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
      body: Container(
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: ListView.builder(itemBuilder: (c, i) => _item())),
    );
  }
}
