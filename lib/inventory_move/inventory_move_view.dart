import 'package:flutter/material.dart';
import './inventory_move_view_model.dart';
import 'package:forca_so/create_i_m/create_i_m.dart';
  
class InventoryMoveView extends InventoryMoveViewModel {
  _filter(){
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
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
                  : Container(
                margin: EdgeInsets.only(right: 16.0, left: 16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      status = i;
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
  _item(){
    return Container(
      height: 140.0,
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "12345",
                    style: TextStyle(
                      fontFamily: "Title",
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Movement Date",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "01/08/2019",
                    style: TextStyle(
                        fontFamily: "Title",
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 30.0,
                  child: OutlineButton(onPressed: (){
                    //TODO detail Inventory Move
                  }, child: Text(
                    "Detail",style: TextStyle(
                    fontFamily: "Title",
                    fontSize: 13.0,
                    color: Colors.black
                  ),
                  ),),
                ),
                Row(children: <Widget>[
                  status < 3 ?
                  Container(
                    height: 30.0,
                    child: OutlineButton(onPressed: (){
                      //TODO create Inventory Move
//                        Navigator.push(context, MaterialPageRoute(builder:
//                        null));
                    }, child: Text(
                      "Edit",
                      style: TextStyle(fontFamily: "Title",
                          fontSize: 13.0,
                          color: Colors.black),
                    ),
                    ),
                  )
                      : Container(), Padding(padding: EdgeInsets.only(right: 16.0)),
                Container(
                  height: 30.0,
                    child: RaisedButton(onPressed: null ,disabledColor: status == 1 ?
                      Colors.yellow :
                    status == 2
                        ? Colors.blue
                        : status == 3
                        ? Colors.green
                        : status == 4
                        ? Colors.orange
                        : status == 5
                        ? Colors.red
                        : Colors.grey,
                    child: Text(status == 1
                        ? "Drafted"
                        : status == 2
                        ? "In Progress"
                        : status == 3
                        ? "Completed"
                        : status == 4
                        ? "Reversed"
                        : status == 5
                        ? "Invalid"
                        : "Closed",
                      style:TextStyle(
                        fontSize: 13.0,
                        fontFamily: "Title",
                        color: Colors.white
                      ) ,),),
                )],)
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
        title: Text("Iventory Move",
        style: TextStyle(fontFamily: "Title"),
        ),actions: <Widget>[
          FlatButton(
            onPressed: () => _filter(),
            child: Text(
                "Status", style: TextStyle(fontFamily: "Title", color: Colors.white),
            ),
          )
      ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateIM()));
          },child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.only(right: 8.0,left: 8.0),
        child: ListView.builder(itemBuilder:(context,index)=>_item()),
      ),
    );
  }
}

