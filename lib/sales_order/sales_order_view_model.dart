import 'package:flutter/material.dart';
import './sales_order.dart';
import 'package:forca_so/utils/document_status.dart';

abstract class SalesOrderViewModel extends State<SalesOrder> {
  // Add your state and logic here
    DocumentStatus documentStatus = DocumentStatus.DRAFTED;
}
