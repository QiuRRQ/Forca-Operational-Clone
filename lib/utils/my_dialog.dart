import 'package:flutter/material.dart';
import 'package:forca_so/utils/forca_assets.dart';
enum Status { SUCCESS, ERROR, WARNING }

class MyDialog {
  final context;
  final String title;
  final String description;
  final Status status;

  MyDialog(this.context, this.title, this.description, this.status);

  build(ValueChanged ok(), {ValueChanged cancel()}) {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            content: Container(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: forcaText(title,
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16.0)),
                  forcaText(description, align: TextAlign.center),
                  Padding(padding: EdgeInsets.only(top: 16.0)),
                  cancel == null
                      ? _singleButton(ok)
                      : _doubleButton(ok, cancel),
                ],
              ),
            ),
          );
        });
  }

  _singleButton(ValueChanged ok()) {

    return Container(
      width: 120,
      child: forcaButton(forcaText("Ok", color: Colors.white), () => ok(),
          color: status == Status.ERROR
              ? Colors.red
              : status == Status.WARNING ? Colors.yellow : Colors.blue),
    );
  }

  _doubleButton(ValueChanged ok(), ValueChanged cancel()) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: forcaButton(
              forcaText("Cancel", color: Colors.white), () => cancel(),
              color: Colors.red),
        ),
        Container(
          child: forcaButton(forcaText("Ok", color: Colors.white), () => ok()),
        ),
      ],
    );
  }
}

class Loading {
  final BuildContext context;

  Loading(this.context);

  build() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
              padding: EdgeInsets.all(30.0),
              child: new CircularProgressIndicator())),
    );
  }
}
