
class ListLine {

  int m_product_id;
  String productName;
  int m_locator_id;
  String locatorFrom;
  var forca_qtyentered;
  int m_locatorto_id;
  String locatorTo;
  var movementqty = 0;
  int forca_c_uom_id = 0;
  String UomName;
  int idLine;
	String line_number;
	String qtyConversion;

  
  ListLine({
		this.m_product_id,
		this.m_locator_id,
		this.m_locatorto_id,
		this.forca_qtyentered,
		this.qtyConversion,
		this.forca_c_uom_id
});

	ListLine.fromJsonMap(Map<String, dynamic> map): 
		m_product_id = map["m_product_id"],
		m_locator_id = map["m_locator_id"],
		forca_qtyentered = map["forca_qtyentered"],
		m_locatorto_id = map["m_locatorto_id"],
		movementqty = map["movementqty"],
		idLine = map["m_movementline_id"],
		line_number = map["line_number"],
		forca_c_uom_id = map["forca_c_uom_id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_product_id'] = m_product_id;
		data['m_locator_id'] = m_locator_id;
		data['forca_qtyentered'] = forca_qtyentered;
		data['m_locatorto_id'] = m_locatorto_id;
		data['movementqty'] = movementqty;
		data['forca_c_uom_id'] = forca_c_uom_id;
		data['line_number'] = line_number;
		return data;
	}
}
