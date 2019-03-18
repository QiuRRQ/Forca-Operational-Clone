import 'package:flutter/material.dart';
import './inventory_move.dart';
import 'package:forca_so/utils/document_status.dart';

abstract class InventoryMoveViewModel extends State<InventoryMove> {
  // Add your state and logic here
  DocumentStatus documentStatus = DocumentStatus.DRAFTED;
}
