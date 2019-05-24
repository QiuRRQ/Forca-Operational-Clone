import 'package:flutter/material.dart';
import 'package:forca_so/screens/material_receipt_screen/detail_receipt_screen/detail_receipt_view.dart';

class DetailReceiptScreen extends StatefulWidget{
  final String docNumer;
  DetailReceiptScreen(this.docNumer);
  @override
  State<StatefulWidget> createState() => DetailReceiptView();

}