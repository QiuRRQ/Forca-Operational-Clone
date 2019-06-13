import 'package:forca_so/models/locator/locator.dart';

class LocatorResponse {

  String codestatus;
  String message;
  List<Locator> locator;

	LocatorResponse.fromJsonMap(Map<String, dynamic> map):
		codestatus = map["codestatus"],
		message = map["message"],
				locator = List<Locator>.from(map["resultdata"].map((it) => Locator.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['resultdata'] = locator != null ?
			this.locator.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
