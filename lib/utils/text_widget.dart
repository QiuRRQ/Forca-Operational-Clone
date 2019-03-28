import 'package:flutter/material.dart';

forcaTitle(text, {size, color, align, weight}) {
  return Text(
    text,
    style: TextStyle(
        color: color == null ? Colors.grey : color,
        fontWeight: weight == null ? FontWeight.normal : weight,
        fontSize: size == null ? 12.0 : size,
        fontFamily: "Title"),
    textAlign: align == null ? TextAlign.start : align,
  );
}

forcaSubtitle(text, {size, color, align, weight}) {
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