
import 'package:forca_so/models/sales_order/sales_order_detail/get_order_line.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/pagination.dart';

class getOrderLineResponse {

  String codestatus;
  String message;
  Pagination pagination;
  List<getOderLine> getOrderLine;

	getOrderLineResponse.fromJsonMap(Map<String, dynamic> map):
		codestatus = map["codestatus"],
		message = map["message"],
		pagination = Pagination.fromJsonMap(map["pagination"]),
				getOrderLine = List<getOderLine>.from(map["resultdata"].map((it) => getOderLine.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codestatus;
		data['message'] = message;
		data['pagination'] = pagination == null ? null : pagination.toJson();
		data['resultdata'] = getOrderLine != null ?
			this.getOrderLine.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
