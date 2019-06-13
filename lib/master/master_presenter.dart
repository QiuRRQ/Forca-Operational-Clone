import 'dart:async';
import 'dart:convert';

import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/locator/locator_response.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/price_list/price_list_response.dart';
import 'package:forca_so/models/tax/tax.dart';
import 'package:forca_so/models/tax/tax_response.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/models/uom/uom_response.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:http/http.dart' as http;
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/models/warehouse/warehouse_response.dart';
import 'package:forca_so/models/bpartner/bpartner_reponse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/product/product_response.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sale_rep/sales_rep_response.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/models/payment_rule/payment_rule_response.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';

Future<List<Warehouse>> reqWarehouse() async {
  List<Warehouse> warehouses = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_WAREHOUSE";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return WarehouseResponse.fromJsonMap(res).warehouses;
    }
  }
  return warehouses;
}

Future<List<BPartner>> reqBPartner(
    {String page, int perPage, String keyWord}) async {
  List<BPartner> bPartners = List();
  var myBody = {
    "page": (page ?? 1).toString(),
    "perpage": (perPage ?? 25).toString(),
    "name": keyWord ?? ""
  };
  print("myBOdy ${myBody.toString()}");
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_B_PARTNER";
  var response = await http.post(
    url,
    body: myBody,
    headers: {"Forca-Token": user.token},
  ).catchError((err) => print("error ${err.toString()}"));
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return BPartnerReponse.fromJsonMap(res).bPartners;
    }
  }
  return bPartners;
}

Future<List<Product>> reqProduct(
    {String priceListID,String keyWord, String page, String productID, String perPage}) async {
  List<Product> products = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_PRODUCT";
  var myBody = {"showpricelist": "Y"};
  if (priceListID != null) myBody.addAll({"m_pricelist_id": priceListID});
  if (keyWord != null) if (keyWord.isNotEmpty) myBody.addAll({"name": keyWord});
  if (page != null) myBody.addAll({"page": page});
  if (perPage != null) myBody.addAll({"perpage": perPage});
  if (productID != null) myBody.addAll({"m_product_id": productID});
  var response =
      await http.post(url, headers: {"Forca-Token": user.token}, body: myBody);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return ProductResponse.fromJsonMap(res).products;
    }
  }
  print("${products.length} | product ${response.body}");
  return products;
}

Future<List<SaleRep>> reqSaleRep() async {
  List<SaleRep> salesReps = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_SALES_REP";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return SalesRepResponse.fromJsonMap(res).salesReps;
    }
  }
  return salesReps;
}

Future<List<PaymentRule>> reqPaymentRule() async {
  List<PaymentRule> paymentRules = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_PAYMENT_RULE";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return PaymentRuleResponse.fromJsonMap(res).paymentRule;
    }
  }
  return paymentRules;
}

Future<List<PriceList>> reqPriceList() async {
  List<PriceList> priceList = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_PRICE_LIST";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return PriceListResponse.fromJsonMap(res).priceLists;
    }
  }
  return priceList;
}

Future<List<Uom>> reqUom() async {
  List<Uom> uomList = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_UOM";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print("list UOM ${response.body}");
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return UomResponse.fromJsonMap(res).listUom;
    }
  }
  return uomList;
}

Future<List<Tax>> reqTax() async {
  List<Tax> taxList = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_TAX";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return TaxResponse.fromJsonMap(res).lisTax;
    }
  }
  return taxList;
}

Future<List<Locator>> reqLocator() async {
  List<Locator> locatorList = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LOCATOR";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res['codestatus'] == "S") {
      return LocatorResponse
          .fromJsonMap(res)
          .locatorList;
    }
  }
  return locatorList;
}
