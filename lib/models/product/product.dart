
class Product {

  final String m_product_id;
  final String m_product_category_id;
  final String value;
  final String c_uom_id;
  final String c_taxcategory_id;
  final int m_locator_id;
  final String uomsymbol;
  final String volume;
  final String issold;
  final String name;
  final String ad_client_id;
  final String description;

	Product.fromJsonMap(Map<String, dynamic> map): 
		m_product_id = map["m_product_id"],
		m_product_category_id = map["m_product_category_id"],
		value = map["value"],
		c_uom_id = map["c_uom_id"],
		c_taxcategory_id = map["c_taxcategory_id"],
		m_locator_id = map["m_locator_id"],
		uomsymbol = map["uomsymbol"],
		volume = map["volume"],
		issold = map["issold"],
		name = map["name"],
		ad_client_id = map["ad_client_id"],
		description = map["description"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_product_id'] = m_product_id;
		data['m_product_category_id'] = m_product_category_id;
		data['value'] = value;
		data['c_uom_id'] = c_uom_id;
		data['c_taxcategory_id'] = c_taxcategory_id;
		data['m_locator_id'] = m_locator_id;
		data['uomsymbol'] = uomsymbol;
		data['volume'] = volume;
		data['issold'] = issold;
		data['name'] = name;
		data['ad_client_id'] = ad_client_id;
		data['description'] = description;
		return data;
	}
}
