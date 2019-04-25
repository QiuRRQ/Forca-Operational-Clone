import 'package:forca_so/models/price_list/price_list.dart';

class PriceListResponse {

  final String codeStatus;
  final String message;
  final List<PriceList> priceLists;

	PriceListResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		priceLists = List<PriceList>.from(map["resultdata"].map((it) => PriceList.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = priceLists != null ? 
			this.priceLists.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
