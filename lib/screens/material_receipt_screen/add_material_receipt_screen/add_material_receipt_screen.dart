import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/material_receipt.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_view.dart';

class AddMaterialReceiptScreen extends StatefulWidget {
  final MaterialReceipt materialReceipt;

  const AddMaterialReceiptScreen({Key key, this.materialReceipt}) : super(key: key);

  @override
  AddMaterialReceiptView createState() => new AddMaterialReceiptView();
}
  
