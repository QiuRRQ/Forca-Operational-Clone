import 'package:forca_so/models/inventory_move/create_inventory_move/list_line.dart';

class CreateIventoryMoveParam {

  String salerep_name = "";
  int c_bpartner_id= 0;
  List<ListLine> list_line;
  int crm_id = 0;
  String movementdate = "";
  int ad_org_id = 0;
  int ad_orgtrx_id = 0;
  int c_bpartner_location_id = 0;
  int c_campaign_id = 0;
  int ad_user_id = 0;
  int m_movement_id = 0;

  CreateIventoryMoveParam();

	CreateIventoryMoveParam.fromJsonMap(Map<String, dynamic> map):
		salerep_name = map["salerep_name"],
		c_bpartner_id = map["c_bpartner_id"],
		list_line = List<ListLine>.from(map["list_line"].map((it) => ListLine.fromJsonMap(it))),
		crm_id = map["crm_id"],
		movementdate = map["movementdate"],
		ad_org_id = map["ad_org_id"],
		ad_orgtrx_id = map["ad_orgtrx_id"],
		c_bpartner_location_id = map["c_bpartner_location_id"],
		c_campaign_id = map["c_campaign_id"],
		ad_user_id = map["ad_user_id"],
		m_movement_id = map["m_movement_id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['salerep_name'] = salerep_name;
		data['c_bpartner_id'] = c_bpartner_id;
		data['list_line'] = list_line != null ? 
			this.list_line.map((v) => v.toJson()).toList()
			: null;
		data['crm_id'] = crm_id;
		data['movementdate'] = movementdate;
		data['ad_org_id'] = ad_org_id;
		data['ad_orgtrx_id'] = ad_orgtrx_id;
		data['c_bpartner_location_id'] = c_bpartner_location_id;
		data['c_campaign_id'] = c_campaign_id;
		data['ad_user_id'] = ad_user_id;
		data['m_movement_id'] = m_movement_id;
		return data;
	}
}
