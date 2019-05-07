class OrderLine {
  final String productName;
  final String qty;
  final String qtyDelivered;
  final String qtyInvoiced;
  final String priceEntered;
  final String discount;
  final String uomName;
  final String taxName;
  final String total;

  OrderLine.fromJsonMap(Map<String, dynamic> map)
      : productName = map["product_name"],
        qty = map["qtyordered"],
        qtyDelivered = map["qtydelivered"],
        qtyInvoiced = map["qtyinvoiced"],
        priceEntered = map["priceentered"],
        discount = map["discount"],
        uomName = map["uom_name"],
        taxName = map["tax_name"],
        total = map["total"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = productName;
    data['qtyordered'] = qty;
    data['qtydelivered'] = qtyDelivered;
    data['qtyinvoiced'] = qtyInvoiced;
    data['priceentered'] = priceEntered;
    data['discount'] = discount;
    data['uom_name'] = uomName;
    data['tax_name'] = taxName;
    data['total'] = total;
    return data;
  }
}
