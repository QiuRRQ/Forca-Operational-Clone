import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';

class CreateMrParam {

  int c_order_id = 0;
  int c_bpartner_id = 0;
  int m_warehouse_id = 0;
  List<MrLine> list_line;
  int crm_id = 0;
  int ad_org_id = 0;
  int ad_orgtrx_id = 0;
  int c_bpartner_location_id = 0;
  int ad_user_id = 0;
  String documentno = "";
  String issotrx = "N";
  int c_project_id = 0;
  int user2_id = 0;
  String description = "";
  String movementdate = "";
  int m_inout_id = 0;

  CreateMrParam();

  CreateMrParam.fromJsonMap(Map<String, dynamic> map):
        c_order_id = map["c_order_id"],
        c_bpartner_id = map["c_bpartner_id"],
        m_warehouse_id = map["m_warehouse_id"],
        list_line = List<MrLine>.from(map["list_line"].map((it) => MrLine.fromJsonMap(it))),
        crm_id = map["crm_id"],
        ad_org_id = map["ad_org_id"],
        ad_orgtrx_id = map["ad_orgtrx_id"],
        c_bpartner_location_id = map["c_bpartner_location_id"],
        ad_user_id = map["ad_user_id"],
        documentno = map["documentno"],
        issotrx = map["issotrx"],
        c_project_id = map["c_project_id"],
        user2_id = map["user2_id"],
        description = map["description"],
        movementdate = map["movementdate"],
        m_inout_id = map["m_inout_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_order_id'] = c_order_id;
    data['c_bpartner_id'] = c_bpartner_id;
    data['m_warehouse_id'] = m_warehouse_id;
    data['list_line'] = list_line != null ?
    this.list_line.map((v) => v.toJson()).toList()
        : null;
    data['crm_id'] = crm_id;
    data['ad_org_id'] = ad_org_id;
    data['ad_orgtrx_id'] = ad_orgtrx_id;
    data['c_bpartner_location_id'] = c_bpartner_location_id;
    data['ad_user_id'] = ad_user_id;
    data['documentno'] = documentno;
    data['issotrx'] = issotrx;
    data['c_project_id'] = c_project_id;
    data['user2_id'] = user2_id;
    data['description'] = description;
    data['movementdate'] = movementdate;
    data['m_inout_id'] = m_inout_id;
    return data;
  }
}
