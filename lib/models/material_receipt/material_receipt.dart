
class MaterialReceipt {

  String inOutID;
  String name;
  String documentNo;
  String movementDate;
  String status;

	MaterialReceipt.fromJsonMap(Map<String, dynamic> map): 
		inOutID = map["m_inout_id"],
		name = map["name"],
		documentNo = map["documentno"],
		movementDate = map["movementdate"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_inout_id'] = inOutID;
		data['name'] = name;
		data['documentno'] = documentNo;
		data['movementdate'] = movementDate;
		data['status'] = status;
		return data;
	}
}
