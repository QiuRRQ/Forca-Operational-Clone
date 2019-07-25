import 'package:flutter/material.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_view.dart';

class CreateSOScreen extends StatefulWidget {

  final SalesOrder orderItem;

  const CreateSOScreen({Key key, this.orderItem}) : super(key: key);


  @override
  CreateSOView createState() => new CreateSOView();
}
  
