import 'package:flutter/material.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/utils/my_dialog.dart';

selectWarehouse(BuildContext context, List<Warehouse> warehouses,
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
}

class SelectBPartner extends StatefulWidget {
  final List<BPartner> bPartners;
  final ValueChanged<BPartner> onSelected;

  SelectBPartner(this.bPartners, this.onSelected);

  @override
  _SelectBPartnerState createState() =>
      _SelectBPartnerState(bPartners, onSelected);
}

class _SelectBPartnerState extends State<SelectBPartner> {
  List<BPartner> bPartners;
  TextEditingController keyWorld;
  int page = 1;
  final ValueChanged<BPartner> onSelected;

  _SelectBPartnerState(this.bPartners, this.onSelected);

  _getBPartner() async {
    Loading(context).show();
    await reqBPartner(page: page, keyWorld: keyWorld.text.toString())
        .then((listBPatner) {
      setState(() {
        this.bPartners = listBPatner;
      });
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    keyWorld = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Center(
              child: forcaText("Select Business Partner",
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          TextFormField(
            controller: keyWorld,
            decoration: InputDecoration(
                hintText: "Search BPartner by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _getBPartner();
                    })),
          ),
          bPartners.isEmpty
              ? Container(
                  height: 50.0,
                  child: Center(
                    child: forcaText("No more data!"),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                  itemBuilder: (c, i) => FlatButton(
                      onPressed: () {
                        onSelected(bPartners[i]);
                      },
                      child: forcaText(bPartners[i].name)),
                  itemCount: bPartners.length,
                )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                  onPressed: page <= 1
                      ? null
                      : () {
                          if (page - 1 > 0) {
                            setState(() {
                              page--;
                              _getBPartner();
                            });
                          }
                        },
                  child: forcaText("Previus",
                      color: page <= 1 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                  onPressed: bPartners.isEmpty
                      ? null
                      : () {
                          setState(() {
                            page++;
                            _getBPartner();
                          });
                        },
                  child: forcaText("Next",
                      color: bPartners.isEmpty ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          forcaButton(forcaText("Close", color: Colors.white), () {
            Navigator.pop(context);
          }, width: MediaQuery.of(context).size.width)
        ],
      ),
    );
  }
}

selectBPartner(BuildContext context, List<BPartner> bPartners,
    ValueChanged<BPartner> onSelected) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: SelectBPartner(bPartners, onSelected),
          ));
}

selectProduct(BuildContext context, List<Product> products,
    ValueChanged<Product> onSelected) {
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
                    child: forcaText("Select Product",
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
                            onSelected(products[i]);
                          },
                          child: Center(
                            child: forcaText(products[i].name),
                          ),
                        ),
                      ),
                  itemCount: products.length,
                ))
              ],
            ),
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
