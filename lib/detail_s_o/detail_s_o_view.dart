import 'package:flutter/material.dart';
import './detail_s_o_view_model.dart';

class DetailSOView extends DetailSOViewModel {
  _body() {
    return Container(
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail SO",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }
}
