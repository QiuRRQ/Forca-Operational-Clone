import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/uom/uom.dart';

class Product {
  String productID;
  String categoryID;
  String value;
  String taxCategoryID;
  String locatorID;
  String uomSymbol;
  String volume;
  String isSold;
  String name;
  String clientID;
  String description;
  List<Uom> uom;
  List<Uom> uomConversion;
  List<PriceList> priceList;

  Product();

  Product.fromJsonMap(Map<String, dynamic> map)
      : productID = map["m_product_id"],
        categoryID = map["m_product_category_id"],
        value = map["value"],
        taxCategoryID = map["c_taxcategory_id"],
        locatorID = map["m_locator_id"],
        uomSymbol = map["uomsymbol"],
        volume = map["volume"],
        isSold = map["issold"],
        name = map["name"],
        clientID = map["ad_client_id"],
        description = map["description"],
        uom = List<Uom>.from(map["uom"].map((it) => Uom.fromJsonMap(it))),
        uomConversion = List<Uom>.from(
            map["uom_conversion"].map((it) => Uom.fromJsonMap(it))),
        priceList = List<PriceList>.from(
            map["pricelist"].map((it) => PriceList.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_product_id'] = productID;
    data['m_product_category_id'] = categoryID;
    data['value'] = value;
    data['c_taxcategory_id'] = taxCategoryID;
    data['m_locator_id'] = locatorID;
    data['uomsymbol'] = uomSymbol;
    data['volume'] = volume;
    data['issold'] = isSold;
    data['name'] = name;
    data['ad_client_id'] = clientID;
    data['description'] = description;
    data['uom'] = uom != null ? this.uom.map((v) => v.toJson()).toList() : null;
    data['uom_conversion'] = uomConversion != null
        ? this.uomConversion.map((v) => v.toJson()).toList()
        : null;
    data['pricelist'] = priceList != null
        ? this.priceList.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
