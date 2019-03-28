import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/sales_order_screen.dart';
import 'package:forca_so/utils/document_status.dart';

abstract class SalesOrderViewModel extends State<SalesOrderScreen> {
  // Add your state and logic here
    DocumentStatus documentStatus = DocumentStatus.DRAFTED;
}
