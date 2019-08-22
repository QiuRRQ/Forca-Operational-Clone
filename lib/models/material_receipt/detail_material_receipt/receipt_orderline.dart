
class m_inOutline {
	String line_number;
	String m_inoutline_id;
	String m_locator_id;
	String locator_name;
	String m_product_id;
	String c_uom_id;
	String product_name;
	var movementqty;
	var inout_qtyentered;
	String uom_name;
	String c_orderline_id;
	String isinvoiced;
	var total;
	var qtyentered;
	var qtydelivered;
	var qtyinvoiced;
	String discount;
	var qtyreserved;
	var priceentered;

	m_inOutline.fromJsonMap(Map<String, dynamic> map):
				line_number = map["line_number"],
				m_inoutline_id = map["m_inoutline_id"],
				m_locator_id = map["m_locator_id"],
				locator_name = map["locator_name"],
				m_product_id = map["m_product_id"],
				c_uom_id = map["c_uom_id"],
				product_name = map["product_name"],
				movementqty = map["movementqty"],
				uom_name = map["uom_name"],
				c_orderline_id = map["c_orderline_id"],
				isinvoiced = map["isinvoiced"],
				total = map["total"],
				inout_qtyentered = map["inout_qtyentered"],
				qtyentered = map["qtyentered"],
				qtydelivered = map["qtydelivered"],
				qtyinvoiced = map["qtyinvoiced"],
				discount = map["discount"],
				qtyreserved = map ["qtyreserved"],
				priceentered = map["priceentered"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['line_number'] = line_number;
		data['m_inoutline_id'] = m_inoutline_id;
		data['m_locator_id'] = m_locator_id;
		data['locator_name'] = locator_name;
		data['m_product_id'] = m_product_id;
		data['c_uom_id'] = c_uom_id;
		data['product_name'] = product_name;
		data['movementqty'] = movementqty;
		data['uom_name'] = uom_name;
		data['c_orderline_id'] = c_orderline_id;
		data['isinvoiced'] = isinvoiced;
		data['total'] = total;
		data['qtyentered'] = qtyentered;
		data['qtydelivered'] = qtydelivered;
		data['qtyinvoiced'] = qtyinvoiced;
		data['discount'] = discount;
		data['qtyreserved'] = qtyreserved;
		data['priceentered'] = priceentered;
		return data;
	}

}
