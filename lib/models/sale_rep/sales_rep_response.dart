import 'package:forca_so/models/sale_rep/sale_rep.dart';

class SalesRepResponse {

  final String codeStatus;
  final String message;
  final List<SaleRep> salesReps;

	SalesRepResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		salesReps = List<SaleRep>.from(map["resultdata"].map((it) => SaleRep.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = salesReps != null ? 
			this.salesReps.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
