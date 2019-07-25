class OrderLine {
  final String productName;
  final String productID;
  final String qty;
  final String qtyDelivered;
  final String qtyInvoiced;
  final String priceEntered;
  final String discount;
  final String uomName;
  final String uomID;
  final String line_number;
  final String c_orderline_id;
  final String taxName;
  final String taxID;
  final String total;

  OrderLine.fromJsonMap(Map<String, dynamic> map)
      : productName = map["product_name"],
        line_number = map["line_number"],
        productID = map["m_product_id"],
        qty = map["qtyordered"],
        c_orderline_id = map["c_orderline_id"],
        qtyDelivered = map["qtydelivered"],
        qtyInvoiced = map["qtyinvoiced"],
        priceEntered = map["priceentered"],
        discount = map["discount"],
        uomName = map["uom_name"],
        uomID = map["c_uom_id"],
        taxName = map["tax_name"],
        taxID = map["c_tax_id"],
        total = map["total"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = productName;
    data['m_product_id'] = productID;
    data['line_number'] = line_number;
    data['qtyordered'] = qty;
    data['c_orderline_id'] = c_orderline_id;
    data['qtydelivered'] = qtyDelivered;
    data['qtyinvoiced'] = qtyInvoiced;
    data['priceentered'] = priceEntered;
    data['discount'] = discount;
    data['uom_name'] = uomName;
    data['c_uom_id'] = uomID;
    data['tax_name'] = taxName;
    data['c_tax_id'] = taxID;
    data['total'] = total;
    return data;
  }
}
