
class M_movementline {
  String productID;
  String m_movementline_id;
  String m_locator;
  String m_locator_to;
  String product_name;
  String movementqty;
  String forca_qtyentered;
  Object uom_name;
  String line_number;
  String uom_id;
  String locatorFromId;
  String locatorToId;

	M_movementline.fromJsonMap(Map<String, dynamic> map): 
		m_movementline_id = map["m_movementline_id"],
		m_locator = map["m_locator"],
		m_locator_to = map["m_locator_to"],
		product_name = map["product_name"],
		movementqty = map["movementqty"],
		forca_qtyentered = map["forca_qtyentered"],
		line_number = map["line_number"],
		productID = map["m_product_id"],
	  uom_id = map["forca_c_uom_id"],
	locatorFromId = map["m_locator_id"],
	locatorToId = map['m_locator_to_id'],
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
		data['line_number'] = line_number;
		data['m_product_id'] = productID;
		data['m_locator_id'] = locatorFromId;
		data['m_locatorto_id'] = locatorToId;
		data['forca_c_uom_id'] = uom_id;
		return data;
	}
}
