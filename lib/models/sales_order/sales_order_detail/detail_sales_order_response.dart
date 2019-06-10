import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order.dart';

class DetailSalesOrderResponse {

  final String codeStatus;
  final String message;
  final DetailSalesOrder detail;

	DetailSalesOrderResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		detail = DetailSalesOrder.fromJsonMap(map["resultdata"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = detail == null ? null : detail.toJson();
		return data;
	}


}
