import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';

class InventoryMoveDetailResponse {

  String codestatus;
  String message;
  InventoryMoveDetail inventorymove_detail;

	InventoryMoveDetailResponse.fromJsonMap(Map<String, dynamic> map): 
		codestatus = map["codestatus"],
		message = map["message"],
		inventorymove_detail = InventoryMoveDetail.fromJsonMap(map["resultdata"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['resultdata'] = inventorymove_detail == null ? null : inventorymove_detail.toJson();
		return data;
	}
}
