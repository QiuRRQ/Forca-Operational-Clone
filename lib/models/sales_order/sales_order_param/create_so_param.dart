import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';

class CreateSoParam {

  String dateOrdered;
  List<SoLine> lines;
  int warehouseID;
  int partnerID;
  int orgID;
  int userID;
  int orderID;
  int priceListID;
  String saleRepName;
  String paymentRule;
  int orgTrxID;
  int crmID;
  int campaignID;
  int opportunityID;
  int partnerLocationID;
  String isSoTrx;
  String documentNo;

	CreateSoParam.fromJsonMap(Map<String, dynamic> map): 
		dateOrdered = map["dateordered"],
		lines = List<SoLine>.from(map["list_line"].map((it) => SoLine.fromJsonMap(it))),
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
		data['list_line'] = lines != null ? 
			this.lines.map((v) => v.toJson()).toList()
			: null;
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
