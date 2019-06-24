import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_view.dart';

class DetailIMScreen extends StatefulWidget{
  final InventoryMoveDetail inventorymoveDetail;
  DetailIMScreen(this.inventorymoveDetail);
  @override
  DetailIMView createState() => DetailIMView();

}