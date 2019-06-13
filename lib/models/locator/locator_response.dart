import 'package:forca_so/models/locator/locator.dart';

class LocatorResponse {

  String codestatus;
  String message;
  List<Locator> locatorList;

	LocatorResponse.fromJsonMap(Map<String, dynamic> map): 
		codestatus = map["codestatus"],
		message = map["message"],
		locatorList = List<Locator>.from(map["resultdata"].map((it) => Locator.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['resultdata'] = locatorList != null ? 
			this.locatorList.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
