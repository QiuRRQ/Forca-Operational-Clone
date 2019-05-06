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
  getColor(String status){
      switch (status.toUpperCase()) {
        case "DRAFTED":
            return Colors.yellow[800];
          break;
        case "INPROGRESS":
          return Colors.blue;
          break;
          case "COMPLETED":
          return Colors.green;
          break;
          case "RESERVED":
          return Colors.orange;
          break;
          case "INVALID":
          return Colors.red;
          break;
          case "CLOSED":
          return Colors.grey;
          break;
          case "APPROVED":
            return Colors.green[600];
          break;
          case "NOTAPPROVED":
          return Colors.red[600];
          break;
          case "VOIDED":
          return Colors.red[300];
          break;
          case "WAITINGCONFIRMATION":
          return Colors.orange[300];
          break;
          case "WAITINGPAYMENT":
          return Colors.yellow[600];
          break;
      }
  }
}

class StatusDocument {
  final DocumentStatus status;

  StatusDocument(this.status);

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
