
class BPartner {

  String bPartnerID;
  String clientName;
  String value;
  String name;
  String name2;
  String clientID;
  String orgID;
  String isCustomer;
  String soCreditLimit;
  String description;

	BPartner.fromJsonMap(Map<String, dynamic> map): 
		bPartnerID = map["c_bpartner_id"],
		clientName = map["client_name"],
		value = map["value"],
		name = map["name"],
		name2 = map["name2"],
		clientID = map["ad_client_id"],
		orgID = map["ad_org_id"],
		isCustomer = map["iscustomer"],
		soCreditLimit = map["so_creditlimit"],
		description = map["description"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['c_bpartner_id'] = bPartnerID;
		data['client_name'] = clientName;
		data['value'] = value;
		data['name'] = name;
		data['name2'] = name2;
		data['ad_client_id'] = clientID;
		data['ad_org_id'] = orgID;
		data['iscustomer'] = isCustomer;
		data['so_creditlimit'] = soCreditLimit;
		data['description'] = description;
		return data;
	}
}
