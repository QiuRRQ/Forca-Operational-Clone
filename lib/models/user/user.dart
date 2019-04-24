
class User {

  final String userID;
  final String userName;
  final String clientID;
  final String orgID;
  final String roleID;
  final String salesRefID;
  final String warehouseID;
  final String token;

	User.fromJsonMap(Map<String, dynamic> map): 
		userID = map["ad_user_id"],
		userName = map["ad_user_name"],
		clientID = map["ad_client_id"],
		orgID = map["ad_org_id"],
		roleID = map["ad_role_id"],
		salesRefID = map["salesrep_ID"],
		warehouseID = map["m_warehouse_ID"],
		token = map["token"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ad_user_id'] = userID;
		data['ad_user_name'] = userName;
		data['ad_client_id'] = clientID;
		data['ad_org_id'] = orgID;
		data['ad_role_id'] = roleID;
		data['salesrep_ID'] = salesRefID;
		data['m_warehouse_ID'] = warehouseID;
		data['token'] = token;
		return data;
	}
}
