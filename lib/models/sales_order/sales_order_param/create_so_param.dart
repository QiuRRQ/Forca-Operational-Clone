import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';

class CreateSoParam {
  String dateOrdered = "";

  String poreference = "";
  int c_paymentterm_id = 0;
  int dropship_location_id = 0;
  int dropship_bpartner_id = 0;
  int c_project_id = 0;
  int user2_id = 0;
  String description = "";

  List<SoLine> lines;
  int warehouseID = 0;
  int partnerID = 0;
  int orgID = 0;
  int userID = 0;
  int orderID = 0;
  int priceListID = 0;
  String saleRepName = "";
  String paymentRule = "";
  int orgTrxID = 0;
  int crmID = 0;
  int campaignID = 0;
  int opportunityID = 0;
  int partnerLocationID = 0;
  String isSoTrx = "";
  String documentNo = "";

  CreateSoParam();

  CreateSoParam.fromJsonMap(Map<String, dynamic> map)
      : dateOrdered = map["dateordered"],
        poreference = map ["poreference"],
        c_paymentterm_id = map["c_paymentterm_id"],
        dropship_location_id = map["dropship_location_id"],
        dropship_bpartner_id = map["dropship_bpartner_id"],
        c_project_id = map["c_project_id"],
        user2_id = map["user2_id"],
        description = map["description"],
        lines = List<SoLine>.from(
            map["list_line"].map((it) => SoLine.fromJsonMap(it))),
        warehouseID = map["m_warehouse_id"],
        partnerID = map["c_bpartner_id"],
        orgID = map["ad_org_id"],
        userID = map["ad_user_id"],
        orderID = map["c_order_id"],
        priceListID = map["m_pricelist_id"],
        saleRepName = map["salerep_name"],
        paymentRule = map["payment_rule"],
        orgTrxID = map["ad_orgtrx_id"],
        crmID = map["crm_id"],
        campaignID = map["c_campaign_id"],
        opportunityID = map["c_opportunity_id"],
        partnerLocationID = map["c_bpartner_location_id"],
        isSoTrx = map["issotrx"],
        documentNo = map["documentno"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateordered'] = dateOrdered;
    data["poreference"] = poreference;
    data["c_paymentterm_id"] = c_paymentterm_id;
    data["dropship_location_id"] = dropship_location_id;
    data["dropship_bpartner_id"] = dropship_bpartner_id;
    data["c_project_id"] = c_project_id;
    data["user2_id"] = user2_id;
    data["description"] = description;
    data['list_line'] =
    lines != null ? this.lines.map((v) => v.toJson()).toList() : null;
    data['m_warehouse_id'] = warehouseID;
    data['c_bpartner_id'] = partnerID;
    data['ad_org_id'] = orgID;
    data['ad_user_id'] = userID;
    data['c_order_id'] = orderID;
    data['m_pricelist_id'] = priceListID;
    data['salerep_name'] = saleRepName;
    data['payment_rule'] = paymentRule;
    data['ad_orgtrx_id'] = orgTrxID;
    data['crm_id'] = crmID;
    data['c_campaign_id'] = campaignID;
    data['c_opportunity_id'] = opportunityID;
    data['c_bpartner_location_id'] = partnerLocationID;
    data['issotrx'] = isSoTrx;
    data['documentno'] = documentNo;
    return data;
  }
}
