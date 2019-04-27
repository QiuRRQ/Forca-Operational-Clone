
class Tax {

  String taxID;
  String clientID;
  String clientName;
  String orgID;
  String orgName;
  String taxName;
  String description;
  String categoryID;
  String categoryName;
  String validFrom;
  String isActive;
  String isSummary;
  String isSalesTax;
  String isDocumentLevel;
  String sopoType;
  String rate;
  String countryID;
  String countryName;
  String regionID;
  String regionName;
  String taxIndicator;

	Tax.fromJsonMap(Map<String, dynamic> map): 
		taxID = map["c_tax_id"],
		clientID = map["ad_client_id"],
		clientName = map["client_name"],
		orgID = map["ad_org_id"],
		orgName = map["org_name"],
		taxName = map["tax_name"],
		description = map["description"],
		categoryID = map["c_taxcategory_id"],
		categoryName = map["tax_category_name"],
		validFrom = map["validfrom"],
		isActive = map["isactive"],
		isSummary = map["issummary"],
		isSalesTax = map["issalestax"],
		isDocumentLevel = map["isdocumentlevel"],
		sopoType = map["sopotype"],
		rate = map["rate"],
		countryID = map["c_country_id"],
		countryName = map["country_name"],
		regionID = map["c_region_id"],
		regionName = map["region_name"],
		taxIndicator = map["taxindicator"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['c_tax_id'] = taxID;
		data['ad_client_id'] = clientID;
		data['client_name'] = clientName;
		data['ad_org_id'] = orgID;
		data['org_name'] = orgName;
		data['tax_name'] = taxName;
		data['description'] = description;
		data['c_taxcategory_id'] = categoryID;
		data['tax_category_name'] = categoryName;
		data['validfrom'] = validFrom;
		data['isactive'] = isActive;
		data['issummary'] = isSummary;
		data['issalestax'] = isSalesTax;
		data['isdocumentlevel'] = isDocumentLevel;
		data['sopotype'] = sopoType;
		data['rate'] = rate;
		data['c_country_id'] = countryID;
		data['country_name'] = countryName;
		data['c_region_id'] = regionID;
		data['region_name'] = regionName;
		data['taxindicator'] = taxIndicator;
		return data;
	}
}
