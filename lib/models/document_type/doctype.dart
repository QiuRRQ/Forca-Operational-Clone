
class DocType {

  String c_doctype_id;
  String ad_client_id;
  String name;
  String printname;
  String docbasetype;
  String description;

	DocType.fromJsonMap(Map<String, dynamic> map):
		c_doctype_id = map["c_doctype_id"],
		ad_client_id = map["ad_client_id"],
		name = map["name"],
		printname = map["printname"],
		docbasetype = map["docbasetype"],
		description = map["description"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['c_doctype_id'] = c_doctype_id;
		data['ad_client_id'] = ad_client_id;
		data['name'] = name;
		data['printname'] = printname;
		data['docbasetype'] = docbasetype;
		data['description'] = description;
		return data;
	}
}
