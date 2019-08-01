import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class SelectOrder extends StatefulWidget {
  final String bPartnerID;
  final String warehouseID;
  final ValueChanged<SalesOrder> onSelected;

  SelectOrder(this.bPartnerID,  this.warehouseID, this.onSelected);

  @override
  _SelectOrderState createState() =>
      _SelectOrderState(this.bPartnerID, this.warehouseID, this.onSelected);
}

class _SelectOrderState extends State<SelectOrder> {
  final ValueChanged<SalesOrder> onSelected;
  final String bPartnerID;
  final String warehouseID;
  List<SalesOrder> myOrder = List();

  _SelectOrderState(this.bPartnerID, this.warehouseID, this.onSelected);

  TextEditingController keyword;
  int page = 1;

  _getOrder() async {
    Loading(context).show();
    await reqOrder(bPartnerID, warehouseID,
        documentno: keyword.text.toString(), page: page.toString())
        .then((listOrder) {
      if(listOrder.isNotEmpty){
        setState(() {
          this.myOrder = listOrder;
        });
        Navigator.pop(context);
      }else{
        Navigator.pop(context);
        print("list order kosong");
        MyDialog(context, "Failur", "Order not Found for this Warehouse and BPartner", Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    });

  }

  @override
  void initState() {
    keyword = TextEditingController();
    _getOrder();
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
              child: forcaText("Select Order",
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          TextFormField(
            controller: keyword,
            decoration: InputDecoration(
                hintText: "Search Order by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      page = 1;
                      myOrder.clear();
                      _getOrder();
                    })),
          ),
          myOrder.isEmpty
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
                      onSelected(myOrder[i]);
                    },
                    child: forcaText(myOrder[i].documentNO)),
                itemCount: myOrder.length,
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
                        _getOrder();
                      });
                    }
                  },
                  child: forcaText("Previus",
                      color: page <= 1 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                  onPressed: myOrder.isEmpty
                      ? null
                      : () {
                    setState(() {
                      page++;
                      _getOrder();
                    });
                  },
                  child: forcaText("Next",
                      color: myOrder.isEmpty ? Colors.grey : Colors.black,
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
