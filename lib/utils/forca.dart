import 'package:flutter/material.dart';

class Forca {
  static const String APP_NAME = "Forca Operational";
  static const String APP_VERSION_NAME = "Alpha 1.0.0";
  static const int APP_VERSION_CODE = 1;
  static const String FORCA_LOGO = "";

  static forcaTitle(text, {size, color, align, weight,textoverflow}) {
    return Text(
      text,
      style: TextStyle(
          color: color == null ? Colors.grey : color,
          fontWeight: weight == null ? FontWeight.normal : weight,
          fontSize: size == null ? 12.0 : size,
          fontFamily: "Title"),
      textAlign: align == null ? TextAlign.start : align,
      overflow: textoverflow == null ? TextOverflow.fade :textoverflow,
    );
  }

  static forcaSubtitle(text, {size, color, align, weight}) {
    return Text(
      text,
      style: TextStyle(
          color: color == null ? Colors.grey : color,
          fontWeight: weight == null ? FontWeight.normal : weight,
          fontSize: size == null ? 12.0 : size,
          fontFamily: "Subtitle"),
      textAlign: align == null ? TextAlign.start : align,
    );
  }
}