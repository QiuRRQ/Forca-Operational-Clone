import 'package:forca_so/models/inventory_move/inventory_move_detail/m_movementline.dart';

class InventoryMoveDetail {

  int c_bpartner_id;
  String c_bpartner_name;
  Object salesrep_name;
  int m_movement_id;
  String documentno;
  String docstatus;
  String movementdate;
  String status;
  String docaction;
  Object crm_id;
  bool istransit;
 String description;
  List<M_movementline> m_movementline;



	InventoryMoveDetail.fromJsonMap(Map<String, dynamic> map): 
		c_bpartner_id = map["c_bpartner_id"],
		c_bpartner_name = map["c_bpartner_name"],
		salesrep_name = map["salesrep_name"],
		m_movement_id = map["m_movement_id"],
		documentno = map["documentno"],
		docstatus = map["docstatus"],
		movementdate = map["movementdate"],
		status = map["status"],
		docaction = map["docaction"],
		crm_id = map["crm_id"],
				istransit = map ["istransit"],
				description = map["description"],
		m_movementline = List<M_movementline>.from(map["m_movementline"].map((it) => M_movementline.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['c_bpartner_id'] = c_bpartner_id;
		data['c_bpartner_name'] = c_bpartner_name;
		data['salesrep_name'] = salesrep_name;
		data['m_movement_id'] = m_movement_id;
		data['documentno'] = documentno;
		data['docstatus'] = docstatus;
		data['movementdate'] = movementdate;
		data['status'] = status;
		data['docaction'] = docaction;
		data['crm_id'] = crm_id;
		data['description'] = description;
		data['istransit'] = istransit;
		data['m_movementline'] = m_movementline != null ? 
			this.m_movementline.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
