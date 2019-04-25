
class SaleRep {

  final String userID;
  final String clientName;
  final String clientID;
  final String name;
  final String roleID;
  final String password;
  final String email;
  final String isLock;

	SaleRep.fromJsonMap(Map<String, dynamic> map): 
		userID = map["ad_user_id"],
		clientName = map["client_name"],
		clientID = map["ad_client_id"],
		name = map["name"],
		roleID = map["ad_role_id"],
		password = map["password"],
		email = map["email"],
		isLock = map["islocked"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ad_user_id'] = userID;
		data['client_name'] = clientName;
		data['ad_client_id'] = clientID;
		data['name'] = name;
		data['ad_role_id'] = roleID;
		data['password'] = password;
		data['email'] = email;
		data['islocked'] = isLock;
		return data;
	}
}
