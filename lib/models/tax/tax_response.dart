import 'package:forca_so/models/tax/tax.dart';

class TaxResponse {

  String codeStatus;
  String message;
  List<Tax> lisTax;

	TaxResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		lisTax = List<Tax>.from(map["resultdata"].map((it) => Tax.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = lisTax != null ? 
			this.lisTax.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
