
class m_inOutline {
	final String m_inoutline_id;
	final String locator_name;
	final String product_name;
	final String movementqty;
	final String uom_name;
	final String c_orderline_id;
	final String isinvoiced;
	final String total;
	final String qtyentered;
	final String qtydelivered;
	final String qtyinvoiced;
	final String discount;
	final String priceentered;

	m_inOutline.fromJsonMap(Map<String, dynamic> map)
			: product_name = map["product_name"],
				qtydelivered = map["qtydelivered"],
				qtyinvoiced = map["qtyinvoiced"],
				priceentered = map["priceentered"],
				discount = map["discount"],
				uom_name = map["uom_name"],
				movementqty = map["movementqty"],
				locator_name = map["locator_name"],
				c_orderline_id = map["c_orderline_id"],
				isinvoiced = map["isinvoiced"],
				m_inoutline_id = map["m_inoutline_id"],
				qtyentered = map["qtyentered"],
				total = map["total"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data["product_name"]= product_name;
		data["qtydelivered"]= qtydelivered;
		data["qtyinvoiced"]= qtyinvoiced;
		data["priceentered"]=priceentered;
		data["discount"]= discount;
		data["uom_name"]= uom_name;
		data["movementqty"]= movementqty;
		data["locator_name"]=locator_name;
		data["c_orderline_id"] = c_orderline_id;
		data["isinvoiced"]= isinvoiced;
		data["m_inoutline_id"] = m_inoutline_id;
		data["qtyentered"] = qtyentered;
		data["total"] = total;

		return data;
	}
}
