
class Resultdata {

  String m_inout_id;
  String name;
  String documentno;
  String movementdate;
  String status;

	Resultdata.fromJsonMap(Map<String, dynamic> map): 
		m_inout_id = map["m_inout_id"],
		name = map["name"],
		documentno = map["documentno"],
		movementdate = map["movementdate"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_inout_id'] = m_inout_id;
		data['name'] = name;
		data['documentno'] = documentno;
		data['movementdate'] = movementdate;
		data['status'] = status;
		return data;
	}
}
