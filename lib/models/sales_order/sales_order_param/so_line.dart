class SoLine {
  int discount;
  int productID;
  String productName;
  int taxID;
  String taxName;
  String lineNo;
  int qty;
  double price;
  int uomID;
  int idLine;
  String uomName;

  SoLine(
      {this.discount,
      this.productID,
      this.taxID,
      this.idLine,
        this.lineNo,
      this.qty,
      this.price,
      this.uomID});

  SoLine.fromJsonMap(Map<String, dynamic> map)
      : discount = map["discount"],
        productID = map["m_product_id"],
        taxID = map["c_tax_id"],
        idLine = map["c_orderline_id"],
        lineNo = map["line_number"],
        qty = map["qty_entered"],
        price = map["price_entered"],
        uomID = map["c_uom_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = discount;
    data['m_product_id'] = productID;
    data['line_number'] = lineNo;
    data['c_tax_id'] = taxID;
    data['c_orderline_id'] = idLine;
    data['qty_entered'] = qty;
    data['price_entered'] = price;
    data['c_uom_id'] = uomID;
    return data;
  }
}
