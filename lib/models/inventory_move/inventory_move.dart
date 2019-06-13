
class InventoryMove {

  String m_movement_id;
  String bp_name;
  String documentno;
  String movementdate;
  String status;

	InventoryMove.fromJsonMap(Map<String, dynamic> map):
		m_movement_id = map["m_movement_id"],
		bp_name = map["bp_name"],
		documentno = map["documentno"],
		movementdate = map["movementdate"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_movement_id'] = m_movement_id;
		data['bp_name'] = bp_name;
		data['documentno'] = documentno;
		data['movementdate'] = movementdate;
		data['status'] = status;
		return data;
	}
}
