
class getOderLine {

  String c_order_id;
  String c_orderline_id;
  String line_number;
  String c_bpartner_id;
  String c_bpartner_name;
  String m_product_id;
  String m_product_name;
  String c_bpartner_location_id;
  String c_bpartner_location_name;
  String dateordered;
  String m_warehouse_id;
  String m_warehouse_name;
  String qtyentered;
  String c_uom_id;
  String c_uom_name;
  String priceentered;
  String pricelist;
  String priceactual;
  String c_tax_id;
  String c_tax_name;

	getOderLine();

	getOderLine.fromJsonMap(Map<String, dynamic> map):
		c_order_id = map["c_order_id"],
		c_orderline_id = map["c_orderline_id"],
		line_number = map["line_number"],
		c_bpartner_id = map["c_bpartner_id"],
		c_bpartner_name = map["c_bpartner_name"],
		m_product_id = map["m_product_id"],
		m_product_name = map["m_product_name"],
		c_bpartner_location_id = map["c_bpartner_location_id"],
		c_bpartner_location_name = map["c_bpartner_location_name"],
		dateordered = map["dateordered"],
		m_warehouse_id = map["m_warehouse_id"],
		m_warehouse_name = map["m_warehouse_name"],
		qtyentered = map["qtyentered"],
		c_uom_id = map["c_uom_id"],
		c_uom_name = map["c_uom_name"],
		priceentered = map["priceentered"],
		pricelist = map["pricelist"],
		priceactual = map["priceactual"],
		c_tax_id = map["c_tax_id"],
		c_tax_name = map["c_tax_name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['c_order_id'] = c_order_id;
		data['c_orderline_id'] = c_orderline_id;
		data['line_number'] = line_number;
		data['c_bpartner_id'] = c_bpartner_id;
		data['c_bpartner_name'] = c_bpartner_name;
		data['m_product_id'] = m_product_id;
		data['m_product_name'] = m_product_name;
		data['c_bpartner_location_id'] = c_bpartner_location_id;
		data['c_bpartner_location_name'] = c_bpartner_location_name;
		data['dateordered'] = dateordered;
		data['m_warehouse_id'] = m_warehouse_id;
		data['m_warehouse_name'] = m_warehouse_name;
		data['qtyentered'] = qtyentered;
		data['c_uom_id'] = c_uom_id;
		data['c_uom_name'] = c_uom_name;
		data['priceentered'] = priceentered;
		data['pricelist'] = pricelist;
		data['priceactual'] = priceactual;
		data['c_tax_id'] = c_tax_id;
		data['c_tax_name'] = c_tax_name;
		return data;
	}
}
