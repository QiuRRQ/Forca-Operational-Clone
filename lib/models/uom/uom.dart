class Uom {
  String uomSymbol;
  String clientName;
  String uomID;
  String name;
  String realName;
  String description;
  String stdPrecision;
  String costingPrecision;

  Uom();

  Uom.fromJsonMap(Map<String, dynamic> map)
      : uomSymbol = map["uomsymbol"],
        clientName = map["client_name"],
        uomID = map["c_uom_id"],
        name = map["name"],
        realName = map["uom_name"],
        description = map["description"],
        stdPrecision = map["stdprecision"],
        costingPrecision = map["costingprecision"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uomsymbol'] = uomSymbol;
    data['client_name'] = clientName;
    data['c_uom_id'] = uomID;
    data['name'] = name;
    data['description'] = description;
    data['stdprecision'] = stdPrecision;
    data['costingprecision'] = costingPrecision;
    return data;
  }
}
