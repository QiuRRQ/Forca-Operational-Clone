class OrderLine {
   String productName;
   String productID;
   String qty;
   String qtyDelivered;
   String qtyInvoiced;
   String priceEntered;
   String discount;
   String uomName;
   String uomID;
   String line_number;
   String c_orderline_id;
   String taxName;
   String taxID;
   String total;
   String qtyEntered;

  OrderLine();

  OrderLine.fromJsonMap(Map<String, dynamic> map)
      : productName = map["product_name"],
        line_number = map["line_number"],
        productID = map["m_product_id"],
        qty = map["qtyordered"],
        c_orderline_id = map["c_orderline_id"],
        qtyDelivered = map["qtydelivered"],
        qtyInvoiced = map["qtyinvoiced"],
        qtyEntered = map['qtyentered'],
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
