class SalesOrder {
  String orderID;
  String name;
  String documentNO;
  String grandTotal;
  String status;
  String docDate = "";

  SalesOrder();
  SalesOrder.fromJsonMap(Map<String, dynamic> map)
      : orderID = map["c_order_id"],
        name = map["name"],
        documentNO = map["documentno"],
        status = map["status"],
        docDate = map["dateordered"],
        grandTotal = map["grandtotal"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_order_id'] = orderID;
    data['name'] = name;
    data['documentno'] = documentNO;
    data['grandtotal'] = grandTotal;
    data['dateordered'] = docDate;
    data['status'] = status;
    return data;
  }
}
