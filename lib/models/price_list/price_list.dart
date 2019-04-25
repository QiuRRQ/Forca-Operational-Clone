
class PriceList {

  final String priceListID;
  final String clientID;
  final String isActive;
  final String name;
  final String description;
  final String isSOPriceList;

	PriceList.fromJsonMap(Map<String, dynamic> map): 
		priceListID = map["m_pricelist_id"],
		clientID = map["ad_client_id"],
		isActive = map["isactive"],
		name = map["name"],
		description = map["description"],
		isSOPriceList = map["issopricelist"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_pricelist_id'] = priceListID;
		data['ad_client_id'] = clientID;
		data['isactive'] = isActive;
		data['name'] = name;
		data['description'] = description;
		data['issopricelist'] = isSOPriceList;
		return data;
	}
}
