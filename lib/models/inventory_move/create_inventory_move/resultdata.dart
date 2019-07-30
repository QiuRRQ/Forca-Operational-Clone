
class Resultdata {

  Object crm_id;
  int m_movement_id;
  String documentno;

	Resultdata.fromJsonMap(Map<String, dynamic> map): 
		crm_id = map["crm_id"],
		m_movement_id = map["m_movement_id"],
		documentno = map["documentno"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['crm_id'] = crm_id;
		data['m_movement_id'] = m_movement_id;
		data['documentno'] = documentno;
		return data;
	}
}
