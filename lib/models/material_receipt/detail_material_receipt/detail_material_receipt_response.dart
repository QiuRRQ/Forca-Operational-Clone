import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';

class DetailMaterialReceiptResponse {
  final String codeStatus;
  final String message;
  final DetailMaterialReceipt materialReceipts;

  DetailMaterialReceiptResponse.fromJsonMap(Map<String, dynamic> map)
      : codeStatus = map["codestatus"],
        message = map["message"],
        materialReceipts = DetailMaterialReceipt.fromJsonMap(map["resultdata"]);


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codestatus'] = codeStatus;
    data['message'] = message;
    data['resultdata'] =materialReceipts == null ? null : materialReceipts.toJson();
    return data;
  }
}
