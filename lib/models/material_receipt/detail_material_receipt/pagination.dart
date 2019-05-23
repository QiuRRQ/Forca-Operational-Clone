
class Pagination {

  int perPage;
  int page;
  int totalData;

	Pagination.fromJsonMap(Map<String, dynamic> map): 
		perPage = map["perpage"],
		page = map["page"],
		totalData = map["totaldata"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['perpage'] = perPage;
		data['page'] = page;
		data['totaldata'] = totalData;
		return data;
	}
}
