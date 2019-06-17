import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class SelectWarehouse extends StatefulWidget {
  final ValueChanged<Warehouse> onSelected;

  SelectWarehouse(this.onSelected);

  @override
  _SelectWarehouseState createState() => _SelectWarehouseState(onSelected);
}

class _SelectWarehouseState extends State<SelectWarehouse> {
  List<Warehouse> warehouses = List();
  List<Warehouse> pagerWarehouses = List();
  final ValueChanged<Warehouse> onSelected;

  _SelectWarehouseState(this.onSelected);

  TextEditingController keyword;
  int page = 1;
  int currentPage = 1;
  int currentIndex = 0;

  _getWarehouse() async {
    Loading(context).show();
    await reqWarehouse(keyWord: keyword.text.toString())
        .then((listWH) {
      setState(() {
        this.warehouses = listWH;
      });
    });
    Navigator.pop(context);
  }

  _item(int index){
      index += currentIndex;
      print(index);
      if(index < warehouses.length){
        print("index cukup");
        return FlatButton(
            onPressed: () {
              onSelected(warehouses[index]);
            },
            child: forcaText(warehouses[index].name));
      }else{
        print("index lebih");
        return FlatButton(
            onPressed: () {
              //onSelected(warehouses[index]);
            },
            child: forcaText("No more data!", color: Colors.grey));
      }
  }


  @override
  void initState() {
    keyword = TextEditingController();
    _getWarehouse();
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
              child: forcaText("Select Warehouse",
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          TextFormField(
            controller: keyword,
            decoration: InputDecoration(
                hintText: "Search Warehouse by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      page = 1;
                      warehouses.clear();
                      _getWarehouse();
                    })),
          ),
          warehouses.isEmpty
              ? Container(
                  height: 50.0,
                  child: Center(
                    child: forcaText("No more data!"),
                  ),
                )
              : Expanded(
              child: ListView.builder(
                itemBuilder: (c, i) => _item(i),
                itemCount: 5,
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
                        currentIndex -= 5;
                      });
                    }
                  },
                  child: forcaText("Previus",
                      color: page <= 1 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                  onPressed: currentIndex+5 > warehouses.length
                      ? null
                      : () {
                        setState(() {
                          page++;
                          currentIndex += 5;
                        });
                      },
                      child: forcaText("Next",
                          color: currentIndex+5 > warehouses.length ? Colors.grey : Colors.black,
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
