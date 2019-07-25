
class MrLine {

  int c_uom_id = 0;
  int m_locator_id = 0;
  int m_product_id = 0;
  int m_inoutline_id = 0;
  int c_orderline_id = 0;
  String description = "";
  int m_inout_id = 0;
  int qty = 0;

  MrLine(
      {this.m_locator_id,
        this.description,
        this.c_orderline_id,
        this.c_uom_id,
        this.m_inout_id,
        this.qty,
        this.m_inoutline_id,
        this.m_product_id});

  MrLine.fromJsonMap(Map<String, dynamic> map):
        c_uom_id = map["c_uom_id"],
        m_locator_id = map["m_locator_id"],
        m_product_id = map["m_product_id"],
        m_inoutline_id = map["m_inoutline_id"],
        c_orderline_id = map["c_orderline_id"],
        description = map["description"],
        m_inout_id = map["m_inout_id"],
        qty = map["qty"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_uom_id'] = c_uom_id;
    data['m_locator_id'] = m_locator_id;
    data['m_product_id'] = m_product_id;
    data['m_inoutline_id'] = m_inoutline_id;
    data['c_orderline_id'] = c_orderline_id;
    data['description'] = description;
    data['m_inout_id'] = m_inout_id;
    data['qty'] = qty;
    return data;
  }
}
