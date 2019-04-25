import 'package:forca_so/models/payment_rule/payment_rule.dart';

class PaymentRuleResponse {

  final String codeStatus;
  final String message;
  final List<PaymentRule> paymentRule;

	PaymentRuleResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		paymentRule = List<PaymentRule>.from(map["resultdata"].map((it) => PaymentRule.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = paymentRule != null ? 
			this.paymentRule.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
