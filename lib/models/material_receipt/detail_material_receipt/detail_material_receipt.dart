import 'package:forca_so/models/material_receipt/detail_material_receipt/receipt_orderline.dart';

class DetailMaterialReceipt {

  String inOutID;
  String clientID;
  String orgID;
  int orderID;
  String dateOrdered;
  String documentNo;
  String poReference;
  String descHeader;
  String docTypeID;
  String movementDate;
  String dateAcct;
  int bPartnerID;
  String bPartnerLocID;
  String userID;
  int warehouseID;
  String saleRepID;
  String docStatus;
  String movementType;
  String inOutLineID;
  String orderLineID;
  String line;
  String productID;
  String locatorID;
  String descDetail;
  String qtyEntered;
  String uomID;
  String warehouseCode;
  String warehouseName;
  String clientName;
  String distributorCode;
  String distributorName;
  String customerCode;
  String sapCode;
  String createdDate;
  String productCode;
  String productName;
  double qty;
  String price;
  String unit;
  String address;
// ignore: non_constant_identifier_names
	List<m_inOutline> m_line;

//DetailMaterialReceipt();

	DetailMaterialReceipt.fromJsonMap(Map<String, dynamic> map):
		inOutID = map["m_inout_id"],
		clientID = map["ad_client_id"],
		orgID = map["ad_org_id"],
		orderID = map["c_order_id"],
		dateOrdered = map["dateordered"],
		documentNo = map["documentno"],
		poReference = map["poreference"],
		descHeader = map["description_header"],
		docTypeID = map["c_doctype_id"],
		movementDate = map["movementdate"],
		dateAcct = map["dateacct"],
		bPartnerID = map["c_bpartner_id"],
		bPartnerLocID = map["c_bpartner_location_id"],
		userID = map["ad_user_id"],
		warehouseID = map["m_warehouse_id"],
		saleRepID = map["salesrep_id"],
		docStatus = map["docstatus"],
		movementType = map["movementtype"],
		inOutLineID = map["m_inoutline_id"],
		orderLineID = map["c_orderline_id"],
		line = map["line"],
		productID = map["m_product_id"],
		locatorID = map["m_locator_id"],
		descDetail = map["description_detail"],
		qtyEntered = map["qtyentered"],
		uomID = map["c_uom_id"],
		warehouseCode = map["warehousecode"],
		warehouseName = map["warehousename"],
		clientName = map["clientname"],
		distributorCode = map["distributorcode"],
		distributorName = map["distributorname"],
		customerCode = map["customercode"],
		sapCode = map["sapcode"],
		createdDate = map["createddate"],
		productCode = map["kodeproduk"],
		productName = map["productname"],
		qty = map["qty"],
		price = map["price"],
		unit = map["unit"],
		address = map["address"],
				m_line = List<m_inOutline>.from(
						map["m_inoutline"].map((it) => m_inOutline.fromJsonMap(it)))
		;



	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_inout_id'] = inOutID;
		data['ad_client_id'] = clientID;
		data['ad_org_id'] = orgID;
		data['c_order_id'] = orderID;
		data['dateordered'] = dateOrdered;
		data['documentno'] = documentNo;
		data['poreference'] = poReference;
		data['description_header'] = descHeader;
		data['c_doctype_id'] = docTypeID;
		data['movementdate'] = movementDate;
		data['dateacct'] = dateAcct;
		data['c_bpartner_id'] = bPartnerID;
		data['c_bpartner_location_id'] = bPartnerLocID;
		data['ad_user_id'] = userID;
		data['m_warehouse_id'] = warehouseID;
		data['salesrep_id'] = saleRepID;
		data['docstatus'] = docStatus;
		data['movementtype'] = movementType;
		data['m_inoutline_id'] = inOutLineID;
		data['c_orderline_id'] = orderLineID;
		data['line'] = line;
		data['m_product_id'] = productID;
		data['m_locator_id'] = locatorID;
		data['description_detail'] = descDetail;
		data['qtyentered'] = qtyEntered;
		data['c_uom_id'] = uomID;
		data['warehousecode'] = warehouseCode;
		data['warehousename'] = warehouseName;
		data['clientname'] = clientName;
		data['distributorcode'] = distributorCode;
		data['distributorname'] = distributorName;
		data['customercode'] = customerCode;
		data['sapcode'] = sapCode;
		data['createddate'] = createdDate;
		data['kodeproduk'] = productCode;
		data['productname'] = productName;
		data['qty'] = qty;
		data['price'] = price;
		data['unit'] = unit;
		data['address'] = address;
		data['m_inoutline'] = m_inOutline != null ?
		this.m_line.map((v) => v.toJson()).toList()
				: null;
		print(data['m_inoutline']);
		return data;
	}


}
