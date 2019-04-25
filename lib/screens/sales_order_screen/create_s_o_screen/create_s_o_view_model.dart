import 'package:flutter/material.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';

import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';

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

  _addLine(Line line) {
    setState(() {
      poLines.add(line);
    });
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

  getBpartner() async {
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

  getProduct() async {
    Loading(context).show();
    await reqProduct().then((products) {
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
  
  @override
  void initState() {
    super.initState();
  }
}
