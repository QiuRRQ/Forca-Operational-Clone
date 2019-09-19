import 'package:flutter/material.dart';
import 'package:forca_so/master/select_bussines_partner.dart';
import 'package:forca_so/master/select_order.dart';
import 'package:forca_so/master/select_pricelist.dart';
import 'package:forca_so/master/select_product.dart';
import 'package:forca_so/master/select_productOrdered.dart';
import 'package:forca_so/master/select_warehouse.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/get_order_line.dart';
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

selectProductOrdered(BuildContext context, String orderID, ValueChanged<getOderLine> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SelectProductOrdered(onSelected, orderID),
      ));
}

selectBPartner(BuildContext context,ValueChanged<BPartner> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: SelectBPartner(onSelected),
          ));
}

selectOrderItem(BuildContext context, Warehouse warehouse,
BPartner bPartner, ValueChanged<SalesOrder> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SelectOrder(bPartner.bPartnerID, warehouse.warehouseID, onSelected),
      ));
}

selectProduct(BuildContext context, String pricelistID,
    ValueChanged<Product> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: SelectProduct((product) {
              onSelected(product);
            },pricelistID),
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

selectDocumentStatus(BuildContext context, List<String> docStatus,
    ValueChanged<String> onSelected) {
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
                child: forcaText("Select Document Status",
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
                        onSelected(docStatus[i]);
                      },
                      child: Center(
                        child: forcaText(docStatus[i]),
                      ),
                    ),
                  ),
                  itemCount: docStatus.length,
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

selectPriceList(BuildContext context, ValueChanged<PriceList> onSelected, String isSoPriceList) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SelectPricelist(onSelected, isSoPriceList),
      ));
}
