import 'dart:async';
import 'dart:convert';

import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:http/http.dart' as http;
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:forca_so/models/warehouse/warehouse_response.dart';
import 'package:forca_so/models/bpartner/bpartner_reponse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';

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
