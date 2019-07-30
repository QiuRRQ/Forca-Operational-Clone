
class InventoryMoveLine {

  int m_movement_id;
  int m_movementline_id;
  int m_product_id;
  String product_name;
  int m_locator_id;
  String locator_name;
  int m_locatorto_id;
  String locatorto_name;
  var qtyentered;
  var movementqty;
  int forca_c_uom_id;
  String uom_name;

	InventoryMoveLine.fromJsonMap(Map<String, dynamic> map): 
		m_movement_id = map["m_movement_id"],
		m_movementline_id = map["m_movementline_id"],
		m_product_id = map["m_product_id"],
		product_name = map["product_name"],
		m_locator_id = map["m_locator_id"],
		locator_name = map["locator_name"],
		m_locatorto_id = map["m_locatorto_id"],
		locatorto_name = map["locatorto_name"],
		qtyentered = map["qtyentered"],
		movementqty = map["movementqty"],
		forca_c_uom_id = map["forca_c_uom_id"],
		uom_name = map["uom_name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_movement_id'] = m_movement_id;
		data['m_movementline_id'] = m_movementline_id;
		data['m_product_id'] = m_product_id;
		data['product_name'] = product_name;
		data['m_locator_id'] = m_locator_id;
		data['locator_name'] = locator_name;
		data['m_locatorto_id'] = m_locatorto_id;
		data['locatorto_name'] = locatorto_name;
		data['qtyentered'] = qtyentered;
		data['movementqty'] = movementqty;
		data['forca_c_uom_id'] = forca_c_uom_id;
		data['uom_name'] = uom_name;
		return data;
	}
}
