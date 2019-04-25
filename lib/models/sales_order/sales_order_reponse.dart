

import 'package:forca_so/models/sales_order/sales_order.dart';

class SalesOrderReponse {

  String codeStatus;
  String message;
  List<SalesOrder> listSO;

	SalesOrderReponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		listSO = List<SalesOrder>.from(map["resultdata"].map((it) => SalesOrder.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = listSO != null ? 
			this.listSO.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
