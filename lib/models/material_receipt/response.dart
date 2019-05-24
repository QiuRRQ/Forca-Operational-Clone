import 'package:forca_so/models/material_receipt/pagination.dart';
import 'package:forca_so/models/material_receipt/resultdata.dart';

class Response {

  String codestatus;
  String message;
  Pagination pagination;
  List<Resultdata> resultdata;

	Response.fromJsonMap(Map<String, dynamic> map): 
		codestatus = map["codestatus"],
		message = map["message"],
		pagination = Pagination.fromJsonMap(map["pagination"]),
		resultdata = List<Resultdata>.from(map["resultdata"].map((it) => Resultdata.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['pagination'] = pagination == null ? null : pagination.toJson();
		data['resultdata'] = resultdata != null ? 
			this.resultdata.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
