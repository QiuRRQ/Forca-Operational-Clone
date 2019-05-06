import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/tax/tax.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_so_line.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';

import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/models/sales_order/sales_order_param/create_so_param.dart';
import 'package:forca_so/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateSOViewModel extends State<CreateSOScreen> {
  // Add your state and logic here
  List<Line> poLines = List();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Warehouse warehouse;
  BPartner bPartner;
  Product product;
  SaleRep saleRep;
  PaymentRule paymentRule;
  PriceList priceList;
  CreateSoParam soParams = CreateSoParam();
  var descriptionController;

  setParam() {
    soParams.warehouseID = int.parse(warehouse.m_warehouse_id);
    soParams.partnerID = int.parse(bPartner.bPartnerID);
    soParams.saleRepName = saleRep.name;
    soParams.priceListID = int.parse(priceList.priceListID);
    soParams.paymentRule = paymentRule.value;
    soParams.isSoTrx = "Y";
  }

  bool isNotEmptyHeader() {
    if (warehouse == null) {
      MyDialog(context, "Error", "Warehouse required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (bPartner == null) {
      MyDialog(context, "Error", "Business Partner required", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (saleRep == null) {
      MyDialog(context, "Error", "Sales Rep required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return true;
    } else if (priceList == null) {
      MyDialog(context, "Error", "Price List required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return true;
    } else if (paymentRule == null) {
      MyDialog(context, "Error", "Payment Rule required", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return true;
    }
    return true;
  }

  getWarehouse() async {
    Loading(context).show();
    await reqWarehouse().then((warehouses) {
      Navigator.pop(context);
      selectWarehouse(context, warehouses, (warehouse) {
        setState(() {
          this.warehouse = warehouse;
        });
        Navigator.pop(context);
      });
    });
  }

  getBPartner() async {
    Loading(context).show();
    await reqBPartner().then((bPartners) {
      Navigator.pop(context);
      selectBPartner(context, bPartners, (bPartner) {
        setState(() {
          this.bPartner = bPartner;
        });
        Navigator.pop(context);
      });
    });
  }

  getMasterLine() async {
    Loading(context).show();
    List<Product> listProduct = List();
    List<Uom> listUom = List();
    List<Tax> listTax = List();

    await reqProduct(soParams.priceListID).then((products) {
      listProduct.addAll(products);
    });
    await reqUom().then((uomList) {
      listUom.addAll(uomList);
    });
    await reqTax().then((taxList) {
      listTax.addAll(taxList);
    });
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (_) => CreateSOLine(listProduct, listUom, listTax, (line) {
              setState(() {
                Navigator.pop(context);
                soParams.lines.add(line);
              });
            }));
  }

  getProduct() async {
    Loading(context).show();
    await reqProduct(soParams.priceListID).then((products) {
      Navigator.pop(context);
      selectProduct(context, products, (product) {
        setState(() {
          this.product = product;
        });
        Navigator.pop(context);
      });
    });
  }

  getSaleResp() async {
    Loading(context).show();
    await reqSaleRep().then((saleReps) {
      saleReps.forEach((saleR) {
        print("sales rep ${saleR.name}");
      });
      Navigator.pop(context);
      selectSaleRep(context, saleReps, (saleRep) {
        setState(() {
          this.saleRep = saleRep;
        });
        Navigator.pop(context);
      });
    });
  }

  getPaymentRule() async {
    Loading(context).show();
    await reqPaymentRule().then((paymentRules) {
      Navigator.pop(context);
      selectPaymentRule(context, paymentRules, (paymentRule) {
        setState(() {
          this.paymentRule = paymentRule;
        });
        Navigator.pop(context);
      });
    });
  }

  getPriceList() async {
    Loading(context).show();
    await reqPriceList().then((priceLists) {
      Navigator.pop(context);
      selectPriceList(context, priceLists, (priceList) {
        setState(() {
          this.priceList = priceList;
        });
        Navigator.pop(context);
      });
    });
  }

  createSO() async {
    if (isNotEmptyHeader()) {
      setParam();
      Loading(context).show();
      var ref = await SharedPreferences.getInstance();
      var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
      var url = "${ref.getString(BASE_URL)}$CREATE_ORDER";
      print("parameter ${jsonEncode(soParams)}");
      var response = await http.post(url, body: jsonEncode(soParams), headers: {
        "Forca-Token": user.token,
        "Content-Type": "application/json"
      }).catchError((err) {
        MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
          Navigator.pop(context);
        });
      });
      Navigator.pop(context);
      if (response != null) {
        print("hasil ${response.body}");
        var res = jsonDecode(response.body);
        if (res["codestatus"] == "S") {
          MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });
        } else {
          MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
            Navigator.pop(context);
          });
        }
      }
    }
  }

  @override
  void initState() {
    soParams.lines = List();
    descriptionController = TextEditingController();
    super.initState();
  }
}
