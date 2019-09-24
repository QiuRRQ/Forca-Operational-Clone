

import 'package:forca_so/models/document_type/doctype.dart';

class DocTypeResponse {

  String codestatus;
  String message;
  List<DocType> docType;

	DocTypeResponse.fromJsonMap(Map<String, dynamic> map):
		codestatus = map["codestatus"],
		message = map["message"],
		docType = List<DocType>.from(map["resultdata"].map((it) => DocType.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['resultdata'] = docType != null ?
			this.docType.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
