import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_view.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order.dart';

class DetailSOScreen extends StatefulWidget {
  final DetailSalesOrder salesOrder;

  DetailSOScreen(this.salesOrder);

  @override
  DetailSOView createState() => new DetailSOView();
}
