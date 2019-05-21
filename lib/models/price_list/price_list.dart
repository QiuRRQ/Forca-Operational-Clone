class PriceList {
  final String priceListID;
  final String clientID;
  final String isActive;
  final String name;
  final String description;
  final String isSOPriceList;
  final String standartPrice;

  PriceList.fromJsonMap(Map<String, dynamic> map)
      : priceListID = map != null ? map["m_pricelist_id"] : null,
        clientID = map != null ? map["ad_client_id"] : null,
        isActive = map != null ? map["isactive"] : null,
        name = map != null ? map["name"] : null,
        description = map != null ? map["description"] : null,
        standartPrice = map != null ? map["standard_price"] : "0",
        isSOPriceList = map != null ? map["issopricelist"] : null;

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
