import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class SelectPricelist extends StatefulWidget {
  final ValueChanged<PriceList> onSelected;
  final String isSoPriceList;

  SelectPricelist( this.onSelected, this.isSoPriceList);

  @override
  _SelectPricelistState createState() =>
      _SelectPricelistState(this.onSelected, this.isSoPriceList);
}

class _SelectPricelistState extends State<SelectPricelist> {
  final ValueChanged<PriceList> onSelected;
  final String isSoPriceList;
  List<PriceList> myPriceList = List();

  _SelectPricelistState(this.onSelected, this.isSoPriceList);

  TextEditingController keyword;
  int page = 1;

  _getPricelist() async {
    Loading(context).show();
    await reqPriceList(isSoPriceList: isSoPriceList != "" ? "Y" : "N", keyWord: keyword.text.toString(), page: page.toString())
        .then((listPriceList) {
      setState(() {
        this.myPriceList = listPriceList;
      });
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    keyword = TextEditingController();
    _getPricelist();
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
              child: forcaText("Select PriceList",
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          TextFormField(
            controller: keyword,
            decoration: InputDecoration(
                hintText: "Search PriceList by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      page = 1;
                      myPriceList.clear();
                      _getPricelist();
                    })),
          ),
          myPriceList.isEmpty
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
                      onSelected(myPriceList[i]);
                    },
                    child: forcaText(myPriceList[i].name)),
                itemCount: myPriceList.length,
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
                        _getPricelist();
                      });
                    }
                  },
                  child: forcaText("Previus",
                      color: page <= 1 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                  onPressed: myPriceList.isEmpty
                      ? null
                      : () {
                    setState(() {
                      page++;
                      _getPricelist();
                    });
                  },
                  child: forcaText("Next",
                      color: myPriceList.isEmpty ? Colors.grey : Colors.black,
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
