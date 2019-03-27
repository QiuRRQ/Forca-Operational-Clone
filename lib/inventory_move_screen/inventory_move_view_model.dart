import 'package:flutter/material.dart';
import 'package:forca_so/inventory_move_screen/inventory_move_screen.dart';
import 'package:forca_so/utils/document_status.dart';

abstract class InventoryMoveViewModel extends State<InventoryMoveScreen> {
  // Add your state and logic here
  DocumentStatus documentStatus = DocumentStatus.DRAFTED;
}
