
class Pagination {

  int perpage;
  int page;
  int totaldata;

	Pagination.fromJsonMap(Map<String, dynamic> map): 
		perpage = map["perpage"],
		page = map["page"],
		totaldata = map["totaldata"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['perpage'] = perpage;
		data['page'] = page;
		data['totaldata'] = totaldata;
		return data;
	}
}
