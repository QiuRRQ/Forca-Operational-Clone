import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/screens/material_receipt_screen/edit_material_receipt_screen/edit_material_receipt_view.dart';

class EditReceiptScreen extends StatefulWidget{
  //final String docNumer;
  final DetailMaterialReceipt docNumer;
  final String inOutID;
  EditReceiptScreen(this.docNumer, this.inOutID);


  @override
  State<StatefulWidget> createState() => EditReceiptView();

}