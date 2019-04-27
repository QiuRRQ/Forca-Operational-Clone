class SoLine {
  int discount;
  int productID;
  int taxID;
  int qty;
  int price;
  int uomID;

  SoLine(
      {this.discount,
      this.productID,
      this.taxID,
      this.qty,
      this.price,
      this.uomID});

  SoLine.fromJsonMap(Map<String, dynamic> map)
      : discount = map["discount"],
        productID = map["m_product_id"],
        taxID = map["c_tax_id"],
        qty = map["qty_entered"],
        price = map["price_entered"],
        uomID = map["c_uom_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = discount;
    data['m_product_id'] = productID;
    data['c_tax_id'] = taxID;
    data['qty_entered'] = qty;
    data['price_entered'] = price;
    data['c_uom_id'] = uomID;
    return data;
  }
}
