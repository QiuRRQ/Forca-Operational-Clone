import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order.dart';

abstract class DetailSOViewModel extends State<DetailSOScreen> {
  // Add your state and logic here
  DetailSalesOrder salesOrder;
  List<Line> poLines = List();
  List<Widget> linesWidget = List();

  addLine(Line line) {
    setState(() {
      poLines.add(line);
    });
  }

  @override
  void initState() {
    salesOrder = widget.salesOrder;
    super.initState();
  }

}
