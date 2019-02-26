import 'package:flutter/material.dart';
import './home_view_model.dart';
  
class HomeView extends HomeViewModel {
    
  @override
  Widget build(BuildContext context) {
    
    _item(){
      return Container(
        height: 120.0,
        child: Card(
          child: InkWell(
            onTap: (){},
            child: Container(
              child: Column(

              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Forca SO",style: TextStyle(fontFamily: "Title"),),
      ),
      body: Container(margin:EdgeInsets.only(right: 8.0,left: 8.0),child: ListView.builder(itemBuilder: (c,i)=>_item())),
    );
  }
}

