import 'package:flutter/material.dart';
import 'package:forca_so/inventory_move/create_i_m/create_i_m_view_model.dart';

class CreateIMView extends CreateIMViewModel{






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Create Inventory Move",
        style: TextStyle(
          fontFamily: "Title",
          fontWeight: FontWeight.bold
        ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
                "Save",
            style: TextStyle(fontFamily: "Title",color: Colors.white)),
          )
        ],
      ),
    );
  }

}