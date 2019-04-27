import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/tax/tax.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_line.dart';
import 'package:forca_so/models/product/product.dart';

abstract class CreateLineViewModel extends State<CreateLine> {
  List<Product> products = List();
  List<Uom> listUom = List();
  List<Tax> listTax = List();

  createSO() async {
    var date = DateTime.now();
    var body = {
      "dateordered": "string",
      "list_line": [
        {
          "discount": 0,
          "m_product_id": 0,
          "c_tax_id": 0,
          "qty_entered": 0,
          "price_entered": 0,
          "c_uom_id": 0
        }
      ],
      "m_warehouse_id": 0,
      "c_bpartner_id": 0,
      "ad_org_id": 0,
      "ad_user_id": 0,
      "c_order_id": 0,
      "m_pricelist_id": 0,
      "salerep_name": "string",
      "payment_rule": "string",
      "ad_orgtrx_id": 0,
      "crm_id": 0,
      "c_campaign_id": 0,
      "c_opportunity_id": 0,
      "c_bpartner_location_id": 0,
      "issotrx": "string",
      "documentno": "string"
    };
    var myBody = jsonEncode(body);
  }
}
