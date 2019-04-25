
class Warehouse {

  final String m_warehouse_id;
  final String client_name;
  final String value;
  final String name;
  final String description;

	Warehouse.fromJsonMap(Map<String, dynamic> map):
		m_warehouse_id = map["m_warehouse_id"],
		client_name = map["client_name"],
		value = map["value"],
		name = map["name"],
		description = map["description"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_warehouse_id'] = m_warehouse_id;
		data['client_name'] = client_name;
		data['value'] = value;
		data['name'] = name;
		data['description'] = description;
		return data;
	}
}
