class PaymentRule {
  final String value;
  final String name;
  final String clientID;
  final String isActive;
  final String description;

  PaymentRule.fromJsonMap(Map<String, dynamic> map)
      : value = map["value"],
        name = map["name"],
        clientID = map["ad_client_id"],
        isActive = map["isactive"],
        description = map["description"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = value;
    data['name'] = name;
    data['ad_client_id'] = clientID;
    data['isactive'] = isActive;
    data['description'] = description;
    return data;
  }
}
