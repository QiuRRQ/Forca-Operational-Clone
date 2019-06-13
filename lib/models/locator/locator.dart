
class Locator {

  String m_locator_id;
  String locator_name;

  Locator();
	Locator.fromJsonMap(Map<String, dynamic> map): 
		m_locator_id = map["m_locator_id"],
		locator_name = map["locator_name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['m_locator_id'] = m_locator_id;
		data['locator_name'] = locator_name;
		return data;
	}
}
