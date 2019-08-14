import 'package:forca_so/models/material_receipt/detail_material_receipt/receipt_orderline.dart';

class DetailMaterialReceipt {

	int c_bpartner_id;
	String c_bpartner_name;
	String warehouse;
	int m_inout_id;
	int m_warehouse_id;
	int c_order_id;
	String documentno;
	String docstatus;
	String movementdate;
	String status;
	int c_bpartner_location_id;
	String docaction;
	String description;
	Object crm_id;
	List<m_inOutline> m_inoutline;
	int profitcenter_id;
	List<Object> c_project;

//DetailMaterialReceipt();

	DetailMaterialReceipt.fromJsonMap(Map<String, dynamic> map):
				c_bpartner_id = map["c_bpartner_id"],
				c_bpartner_name = map["c_bpartner_name"],
				warehouse = map["warehouse"],
				m_warehouse_id = map["m_warehouse_id"],
				c_order_id = map["c_order_id"],
				documentno = map["documentno"],
				docstatus = map["docstatus"],
				movementdate = map["movementdate"],
				status = map["status"],
				docaction = map["docaction"],
				description = map["description"],
				crm_id = map["crm_id"],
				c_bpartner_location_id = map["c_bpartner_location_id"],
				m_inout_id = map["m_inout_id"],
				m_inoutline = List<m_inOutline>.from(map["m_inoutline"].map((it) => m_inOutline.fromJsonMap(it))),
				profitcenter_id = map["profitcenter_id"],
				c_project = map["c_project"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['c_bpartner_id'] = c_bpartner_id;
		data['c_bpartner_name'] = c_bpartner_name;
		data['warehouse'] = warehouse;
		data['m_warehouse_id'] = m_warehouse_id;
		data['c_order_id'] = c_order_id;
		data['documentno'] = documentno;
		data['docstatus'] = docstatus;
		data['movementdate'] = movementdate;
		data['status'] = status;
		data['docaction'] = docaction;
		data['description'] = description;
		data ['c_bpartner_location_id'] = c_bpartner_location_id;
		data['crm_id'] = crm_id;
		data['m_inout_id'] = m_inout_id;
		data['m_inoutline'] = m_inoutline != null ?
		this.m_inoutline.map((v) => v.toJson()).toList()
				: null;
		data['profitcenter_id'] = profitcenter_id;
		data['c_project'] = c_project;
		return data;
	}


}
