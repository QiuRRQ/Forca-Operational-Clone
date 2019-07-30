import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_view.dart';

class CreateIMScreen extends StatefulWidget{
  final InventoryMove inventoryMove;

  const CreateIMScreen({Key key, this.inventoryMove}) : super(key: key);
  @override
  CreateIMView createState() => new CreateIMView();
}