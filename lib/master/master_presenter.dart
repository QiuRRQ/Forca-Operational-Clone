import 'dart:async';
import 'dart:convert';

import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/price_list/price_list_response.dart';
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

Future<List<BPartner>> reqBPartner() async {
  List<BPartner> bPartners = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_BPARTNER";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return BPartnerReponse.fromJsonMap(res).bPartners;
    }
  }
  return bPartners;
}

Future<List<Product>> reqProduct() async {
  List<Product> products = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_PRODUCT";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return ProductResponse.fromJsonMap(res).products;
    }
  }
  return products;
}

Future<List<SaleRep>> reqSaleRep() async {
  List<SaleRep> products = List();
  var ref = await SharedPreferences.getInstance();
  var user = User.fromJsonMap(jsonDecode(ref.getString(USER))) ?? null;
  var url = "${ref.getString(BASE_URL)}$LIST_SALES_REP";
  var response = await http.post(url, headers: {"Forca-Token": user.token});
  print(response.body);
  if (response.statusCode == 200) {
    Map res = jsonDecode(response.body);
    if (res["codestatus"] == "S") {
      return SalesRepResponse.fromJsonMap(res).salesReps;
    }
  }
  return products;
}

Future<List<PaymentRule>> reqPaymentRule() async {
  List<PaymentRule> pamentRules = List();
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
  return pamentRules;
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
