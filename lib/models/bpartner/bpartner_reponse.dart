import 'package:forca_so/models/bpartner/bpartner.dart';

class BPartnerReponse {

  String codeStatus;
  String message;
  List<BPartner> bPartners;

	BPartnerReponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		bPartners = List<BPartner>.from(map["resultdata"].map((it) => BPartner.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = bPartners != null ? 
			this.bPartners.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
