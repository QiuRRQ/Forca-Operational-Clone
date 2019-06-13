import 'package:forca_so/models/inventory_move/pagination.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';

class InventoryMoveResponse {

  String codestatus;
  String message;
  Pagination pagination;
  List<InventoryMove> listIM;

	InventoryMoveResponse.fromJsonMap(Map<String, dynamic> map):
		codestatus = map["codestatus"],
		message = map["message"],
		pagination = Pagination.fromJsonMap(map["pagination"]),
		listIM = List<InventoryMove>.from(map["resultdata"].map((it) => InventoryMove.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['pagination'] = pagination == null ? null : pagination.toJson();
		data['resultdata'] = listIM != null ?
			this.listIM.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
