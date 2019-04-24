import 'package:forca_so/models/user/user.dart';

class UserResponse {

  final String codeStatus;
  final String message;
  final User user;

	UserResponse.fromJsonMap(Map<String, dynamic> map): 
		codeStatus = map["codestatus"],
		message = map["message"],
		user = User.fromJsonMap(map["resultdata"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['codestatus'] = codeStatus;
		data['message'] = message;
		data['resultdata'] = user == null ? null : user.toJson();
		return data;
	}
}
