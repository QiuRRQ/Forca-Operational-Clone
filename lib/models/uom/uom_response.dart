import 'package:forca_so/models/uom/uom.dart';

class UomResponse {

  String codeStatus;
  String message;
  List<Uom> listUom;

	UomResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		listUom = List<Uom>.from(map["resultdata"].map((it) => Uom.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = listUom != null ? 
			this.listUom.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
