import 'package:forca_so/models/product/product.dart';

class ProductResponse {

  final String codeStatus;
  final String message;
  final List<Product> products;

	ProductResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		products = List<Product>.from(map["resultdata"].map((it) => Product.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = products != null ? 
			this.products.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
