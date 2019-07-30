import 'package:forca_so/models/inventory_move/edit_iventory_move/inventoryMoveLine.dart';

class ResponseInventoryMoveLine {

  String codestatus;
  String message;
  InventoryMoveLine resultdata;

	ResponseInventoryMoveLine.fromJsonMap(Map<String, dynamic> map): 
		codestatus = map["codestatus"],
		message = map["message"],
		resultdata = InventoryMoveLine.fromJsonMap(map["resultdata"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['resultdata'] = resultdata == null ? null : resultdata.toJson();
		return data;
	}
}
