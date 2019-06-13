import 'package:flutter/material.dart';
import 'package:forca_so/master/select_bussines_partner.dart';
import 'package:forca_so/master/select_product.dart';
import 'package:forca_so/master/select_warehouse.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';

/*selectWarehouse(BuildContext context, List<Warehouse> warehouses,
    ValueChanged<Warehouse> onSelected) {
  showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: forcaText("Select Warehouse",
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (c, i) => Container(
                        margin: EdgeInsets.only(right: 8.0, left: 8.0),
                        width: MediaQuery.of(context).size.width,
                        height: 30.0,
                        color: i % 2 == 1 ? Colors.grey[300] : Colors.white,
                        child: InkWell(
                          onTap: () {
                            onSelected(warehouses[i]);
                          },
                          child: Center(
                            child: forcaText(warehouses[i].name),
                          ),
                        ),
                      ),
                  itemCount: warehouses.length,
                ))
              ],
            ),
          ));
}*/

selectWarehouse(BuildContext context, ValueChanged<Warehouse> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SelectWarehouse(onSelected),
      ));
}

selectBPartner(BuildContext context,ValueChanged<BPartner> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: SelectBPartner(onSelected),
          ));
}

selectProduct(BuildContext context, String pricelistID,
    ValueChanged<Product> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: SelectProduct(pricelistID, (product) {
              onSelected(product);
            }),
          ));
}

selectSaleRep(BuildContext context, List<SaleRep> saleReps,
    ValueChanged<SaleRep> onSelected) {
  showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: forcaText("Select Sales Rep",
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (c, i) => Container(
                        margin: EdgeInsets.only(right: 8.0, left: 8.0),
                        width: MediaQuery.of(context).size.width,
                        height: 30.0,
                        color: i % 2 == 1 ? Colors.grey[300] : Colors.white,
                        child: InkWell(
                          onTap: () {
                            onSelected(saleReps[i]);
                          },
                          child: Center(
                            child: forcaText(saleReps[i].name),
                          ),
                        ),
                      ),
                  itemCount: saleReps.length,
                ))
              ],
            ),
          ));
}

selectPaymentRule(BuildContext context, List<PaymentRule> paymentRules,
    ValueChanged<PaymentRule> onSelected) {
  showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: forcaText("Select Payment Rule",
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (c, i) => Container(
                        margin: EdgeInsets.only(right: 8.0, left: 8.0),
                        width: MediaQuery.of(context).size.width,
                        height: 30.0,
                        color: i % 2 == 1 ? Colors.grey[300] : Colors.white,
                        child: InkWell(
                          onTap: () {
                            onSelected(paymentRules[i]);
                          },
                          child: Center(
                            child: forcaText(paymentRules[i].name),
                          ),
                        ),
                      ),
                  itemCount: paymentRules.length,
                ))
              ],
            ),
          ));
}

selectPriceList(BuildContext context, List<PriceList> priceLists,
    ValueChanged<PriceList> onSelected) {
  showModalBottomSheet(
      context: context,
      builder: (c) => Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 40.0,
                  color: Colors.blue,
                  child: Center(
                    child: forcaText("Select Price List",
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (c, i) => Container(
                        margin: EdgeInsets.only(right: 8.0, left: 8.0),
                        width: MediaQuery.of(context).size.width,
                        height: 30.0,
                        color: i % 2 == 1 ? Colors.grey[300] : Colors.white,
                        child: InkWell(
                          onTap: () {
                            onSelected(priceLists[i]);
                          },
                          child: Center(
                            child: forcaText(priceLists[i].name),
                          ),
                        ),
                      ),
                  itemCount: priceLists.length,
                ))
              ],
            ),
          ));
}
