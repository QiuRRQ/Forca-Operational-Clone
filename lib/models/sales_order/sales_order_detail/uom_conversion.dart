 class UomConversion {
  String uomId,uomName;
  var qtyreserved;

  UomConversion();

  UomConversion.fromJsonMap(Map<String, dynamic> map):
      uomId = map ["c_uom_id"],
      uomName = map ["c_uom_name"],
      qtyreserved = map ["qtyreserved"];
 }