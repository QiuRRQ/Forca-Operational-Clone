
class MrLine{
  int inOutId = 0;
  int orderId = 0;
  String orderName ="";
  int locatorId = 0;
  String locatorName ="";
  int qty = 0;

  MrLine({
    this.inOutId,
    this.locatorId,
    this.orderId,
    this.qty
  });

  MrLine.fromJsonMap(Map<String, dynamic> map)
      : inOutId = map["m_inout_id"],
        orderId = map["c_order_id"],
        locatorId = map["m_locator_id"],
        qty = map["qty"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_inout_id'] = inOutId;
    data['c_order_id'] = orderId;
    data['m_locator_id'] = locatorId;
    data['qty'] = qty;
    return data;
  }


}