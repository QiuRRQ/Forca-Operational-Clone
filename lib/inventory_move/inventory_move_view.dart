import 'package:flutter/material.dart';
import './inventory_move_view_model.dart';
import 'package:forca_so/create_i_m/create_i_m.dart';
  
class InventoryMoveView extends InventoryMoveViewModel {
  _filter(){
    //TODO : filter document
    showModalBottomSheet(context: context,
        builder: (context){
      return Container(

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
                )
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

