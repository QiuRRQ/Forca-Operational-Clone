import 'package:forca_so/models/material_receipt/pagination.dart';
import 'package:forca_so/models/material_receipt/material_receipt.dart';

class MaterialReceiptResponse {

  String codeStatus;
  String message;
  Pagination pagination;
  List<MaterialReceipt> listMaterialReceipt;

	MaterialReceiptResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		pagination = Pagination.fromJsonMap(map["pagination"]),
		listMaterialReceipt = List<MaterialReceipt>.from(map["resultdata"].map((it) => MaterialReceipt.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['pagination'] = pagination == null ? null : pagination.toJson();
		data['resultdata'] = listMaterialReceipt != null ? 
			this.listMaterialReceipt.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
