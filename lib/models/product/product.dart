class Product {
  String productID;
  String categoryID;
  String value;
  String uomID;
  String tacCategoryID;
  int locatorID;
  String uomSymbol;
  String volume;
  String isSold;
  String name;
  String clientID;
  String description;

  Product();

  Product.fromJsonMap(Map<String, dynamic> map)
      : productID = map["m_product_id"],
        categoryID = map["m_product_category_id"],
        value = map["value"],
        uomID = map["c_uom_id"],
        tacCategoryID = map["c_taxcategory_id"],
        locatorID = map["m_locator_id"],
        uomSymbol = map["uomsymbol"],
        volume = map["volume"],
        isSold = map["issold"],
        name = map["name"],
        clientID = map["ad_client_id"],
        description = map["description"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_product_id'] = productID;
    data['m_product_category_id'] = categoryID;
    data['value'] = value;
    data['c_uom_id'] = uomID;
    data['c_taxcategory_id'] = tacCategoryID;
    data['m_locator_id'] = locatorID;
    data['uomsymbol'] = uomSymbol;
    data['volume'] = volume;
    data['issold'] = isSold;
    data['name'] = name;
    data['ad_client_id'] = clientID;
    data['description'] = description;
    return data;
  }
}
