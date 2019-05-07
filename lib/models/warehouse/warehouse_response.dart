import 'package:forca_so/models/warehouse/warehouse.dart';

class WarehouseResponse {

  final String codeStatus;
  final String message;
  final List<Warehouse> warehouses;

	WarehouseResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		warehouses = List<Warehouse>.from(map["resultdata"].map((it) => Warehouse.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = warehouses != null ?
			this.warehouses.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
