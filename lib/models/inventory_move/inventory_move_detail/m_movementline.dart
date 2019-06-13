
class M_movementline {

  String m_movementline_id;
  String m_locator;
  String m_locator_to;
  String product_name;
  String movementqty;
  String forca_qtyentered;
  Object uom_name;

	M_movementline.fromJsonMap(Map<String, dynamic> map): 
		m_movementline_id = map["m_movementline_id"],
		m_locator = map["m_locator"],
		m_locator_to = map["m_locator_to"],
		product_name = map["product_name"],
		movementqty = map["movementqty"],
		forca_qtyentered = map["forca_qtyentered"],
		uom_name = map["uom_name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_movementline_id'] = m_movementline_id;
		data['m_locator'] = m_locator;
		data['m_locator_to'] = m_locator_to;
		data['product_name'] = product_name;
		data['movementqty'] = movementqty;
		data['forca_qtyentered'] = forca_qtyentered;
		data['uom_name'] = uom_name;
		return data;
	}
}
