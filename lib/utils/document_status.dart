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

class Status {
  final DocumentStatus status;

  Status(this.status);

  getName() {
    switch (status) {
      case DocumentStatus.DRAFTED:
        return "Drafted";
        break;
      case DocumentStatus.INPROGRESS:
        return "Inprogress";
        break;
      case DocumentStatus.COMPLETED:
        return "Completed";
        break;
      case DocumentStatus.RESERVED:
        return "Reserved";
        break;
      case DocumentStatus.INVALID:
        return "Invalid";
        break;
      case DocumentStatus.CLOSED:
        return "Closed";
        break;
      case DocumentStatus.APPROVED:
        return "Approved";
        break;
      case DocumentStatus.NOTAPPROVED:
        return "Not Approved";
        break;
      case DocumentStatus.VOIDED:
        return "Voided";
        break;
      case DocumentStatus.WAITINGCONFIRMATION:
        return "Waiting Confirmation";
        break;
      case DocumentStatus.WAITINGPAYMENT:
        return "Waiting Payment";
        break;
    }
  }
}
