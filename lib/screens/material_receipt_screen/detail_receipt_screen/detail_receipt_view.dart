import 'package:flutter/material.dart';
import 'package:forca_so/screens/material_receipt_screen/detail_receipt_screen/detail_receipt_view_model.dart';

class DetailReceiptView extends DetailReceiptViewModel {
  _body() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail M Receipt",
          style: TextStyle(fontFamily: "Title"),
        ),
      ),
      body: _body(),
    );
  }
}
