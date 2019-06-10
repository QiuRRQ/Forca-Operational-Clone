import 'package:flutter/material.dart';

forcaLogo({double width, double height}) {
  return Image.asset(
    'assets/images/logo_forca.png',
    width: width,
    height: height,
  );
}

forcaText(String title,
    {Color color,
    double fontSize,
    FontWeight fontWeight,
    TextOverflow overflow,
    TextAlign align}) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: "Title",
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    overflow: overflow,
    textAlign: align,
  );
}

forcaButton(Text title, ValueChanged onPressed(),
    {color, height, width, margin, padding}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    padding: padding,
    child: RaisedButton(
      color: color == null ? Colors.blue : color,
      onPressed: () => onPressed(),
      child: title,
    ),
  );
  
}
