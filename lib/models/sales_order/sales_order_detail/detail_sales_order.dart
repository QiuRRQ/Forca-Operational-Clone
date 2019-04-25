import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';

class DetailSalesOrder {
  final int bPartnerID;
  final String priceList;
  final double nominal;
  final String partnerName;
  final String warehouse;
  final String salesRepName;
  final int orderID;
  final String documentNo;
  final String docStatus;
  final String dateOrdered;
  final String status;
  final String docAction;
  final String paymentRule;
  final List<OrderLine> orderLine;

  DetailSalesOrder.fromJsonMap(Map<String, dynamic> map)
      : bPartnerID = map["c_bpartner_id"],
        priceList = map["pricelist"],
        nominal = map["nominal"],
        partnerName = map["c_bpartner_name"],
        warehouse = map["warehouse"],
        salesRepName = map["salesrep_name"],
        orderID = map["c_order_id"],
        documentNo = map["documentno"],
        docStatus = map["docstatus"],
        dateOrdered = map["dateordered"],
        status = map["status"],
        docAction = map["docaction"],
        paymentRule = map["paymentrule"],
        orderLine = List<OrderLine>.from(
            map["c_orderline"].map((it) => OrderLine.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_bpartner_id'] = bPartnerID;
    data['pricelist'] = priceList;
    data['nominal'] = nominal;
    data['c_bpartner_name'] = partnerName;
    data['warehouse'] = warehouse;
    data['salesrep_name'] = salesRepName;
    data['c_order_id'] = orderID;
    data['documentno'] = documentNo;
    data['docstatus'] = docStatus;
    data['dateordered'] = dateOrdered;
    data['status'] = status;
    data['docaction'] = docAction;
    data["paymentrule"] = paymentRule;
    data['c_orderline'] = orderLine != null
        ? this.orderLine.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
