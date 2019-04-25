class User {
  final String userID;
  final String userName;
  final String clientID;
  final String orgID;
  final String roleID;
  final String salesRefID;
  final String warehouseID;
  final String token;

  User.fromJsonMap(Map<String, dynamic> map)
      : userID = map == null ? "" : map["ad_user_id"],
        userName = map == null ? "" : map["ad_user_name"],
        clientID = map == null ? "" : map["ad_client_id"],
        orgID = map == null ? "" : map["ad_org_id"],
        roleID = map == null ? "" : map["ad_role_id"],
        salesRefID = map == null ? "" : map["salesrep_ID"],
        warehouseID = map == null ? "" : map["m_warehouse_ID"],
        token = map == null ? "" : map["token"];

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
