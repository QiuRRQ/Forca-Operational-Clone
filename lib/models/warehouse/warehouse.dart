
class Warehouse {

	final String warehouseID;
  final String clientName;
  final String value;
  final String name;
  final String description;

	Warehouse.fromJsonMap(Map<String, dynamic> map):
		warehouseID = map["m_warehouse_id"],
		clientName = map["client_name"],
		value = map["value"],
		name = map["name"],
		description = map["description"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_warehouse_id'] = warehouseID;
		data['client_name'] = clientName;
		data['value'] = value;
		data['name'] = name;
		data['description'] = description;
		return data;
	}
}
