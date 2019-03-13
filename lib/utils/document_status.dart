import 'package:flutter/material.dart';
enum  DocumentStatus {
  DRAFTED,
  INPROGRESS,
  COMPLETED,
  RESERVED,
  INVALID,
  CLOSED,
  APPROVED,
  NOTAPPROVED,
  VOIDED,
  WAITINGCONFIRMATION,
  WAITINGPAYMENT
}

class DocumentStatusColor {
  getColor(status){
      switch (status) {
        case DocumentStatus.DRAFTED:
            return Colors.yellow;
          break;
        case DocumentStatus.INPROGRESS:
          return Colors.blue;
          break;
          case DocumentStatus.COMPLETED:
          return Colors.green;
          break;
          case DocumentStatus.RESERVED:
          return Colors.orange;
          break;
          case DocumentStatus.INVALID:
          return Colors.red;
          break;
          case DocumentStatus.CLOSED:
          return Colors.grey;
          break;
          case DocumentStatus.APPROVED:
            return Colors.green[600];
          break;
          case DocumentStatus.NOTAPPROVED:
          return Colors.red[600];
          break;
          case DocumentStatus.VOIDED:
          return Colors.red[300];
          break;
          case DocumentStatus.WAITINGCONFIRMATION:
          return Colors.orange[300];
          break;
          case DocumentStatus.WAITINGPAYMENT:
          return Colors.yellow[600];
          break;
      }
  }
}
