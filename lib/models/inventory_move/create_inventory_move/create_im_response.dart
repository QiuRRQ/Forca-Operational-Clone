import 'package:forca_so/models/inventory_move/create_inventory_move/resultdata.dart';

class CreateImResponse {

  String codestatus;
  String message;
  Resultdata resultdata;

	CreateImResponse.fromJsonMap(Map<String, dynamic> map): 
		codestatus = map["codestatus"],
		message = map["message"],
		resultdata = Resultdata.fromJsonMap(map["resultdata"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['resultdata'] = resultdata == null ? null : resultdata.toJson();
		return data;
	}
}
