import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/pagination.dart';

class DetailMaterialReceiptResponse {
  String codeStatus;
  String message;
  Pagination pagination;
  DetailMaterialReceipt materialReceipts;

  DetailMaterialReceiptResponse.fromJsonMap(Map<String, dynamic> map)
      : codeStatus = map["codestatus"],
        message = map["message"],
        pagination = Pagination.fromJsonMap(map["pagination"]),
        materialReceipts = DetailMaterialReceipt.fromJsonMap(map["resultdata"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codestatus'] = codeStatus;
    data['message'] = message;
    data['resultdata'] =
        materialReceipts != null ? materialReceipts.toJson() : null;
    return data;
  }
}
