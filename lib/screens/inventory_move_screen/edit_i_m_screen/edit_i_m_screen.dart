import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/screens/inventory_move_screen/edit_i_m_screen/edit_i_m_view.dart';

class EditIMScreen extends StatefulWidget {
  final InventoryMoveDetail inventorymoveDetail;
  EditIMScreen(this.inventorymoveDetail);
  @override
  EditImView createState() => EditImView();
}