import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/get_order_line.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class SelectProductOrdered extends StatefulWidget {
  final String orderID;
  final ValueChanged<getOderLine> onSelected;

  SelectProductOrdered( this.onSelected, this.orderID);

  @override
  _SelectProductState createState() =>
      _SelectProductState(this.orderID, this.onSelected);
}

class _SelectProductState extends State<SelectProductOrdered> {
  final ValueChanged<getOderLine> onSelected;
  final String orderID;
  List<getOderLine> orderLine = List();

  _SelectProductState(this.orderID, this.onSelected);

  TextEditingController keyword;
  int page = 1;

  _getProduct() async {
    Loading(context).show();
    await reqOrderLine(orderID,
        keyWord: keyword.text.toString(), page: page.toString())
        .then((listProduct) {
      setState(() {
        this.orderLine = listProduct;
      });
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    keyword = TextEditingController();
    _getProduct();
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
              child: forcaText("Select Product",
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          TextFormField(
            controller: keyword,
            decoration: InputDecoration(
                hintText: "Search Product by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      page = 1;
                      orderLine.clear();
                      _getProduct();
                    })),
          ),
          orderLine.isEmpty
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
                      onSelected(orderLine[i]);
                      Navigator.pop(context);
                    },
                    child: forcaText(orderLine[i].m_product_name ?? "")),
                itemCount: orderLine.length,
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
                        _getProduct();
                      });
                    }
                  },
                  child: forcaText("Previus",
                      color: page <= 1 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                  onPressed: orderLine.isEmpty
                      ? null
                      : () {
                    setState(() {
                      page++;
                      _getProduct();
                    });
                  },
                  child: forcaText("Next",
                      color: orderLine.isEmpty ? Colors.grey : Colors.black,
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
