import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class SelectBPartner extends StatefulWidget {
  final ValueChanged<BPartner> onSelected;

  SelectBPartner(this.onSelected);

  @override
  _SelectBPartnerState createState() => _SelectBPartnerState(onSelected);
}

class _SelectBPartnerState extends State<SelectBPartner> {
  List<BPartner> bPartners = List();
  final ValueChanged<BPartner> onSelected;

  _SelectBPartnerState(this.onSelected);

  TextEditingController keyword;
  int page = 1;

  _getBPartner() async {
    Loading(context).show();
    await reqBPartner(keyWord: keyword.text.toString(), page: page.toString())
        .then((listBp) {
      setState(() {
        this.bPartners = listBp;
      });
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    keyword = TextEditingController();
    _getBPartner();
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
            controller: keyword,
            decoration: InputDecoration(
                hintText: "Search BP by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      page = 1;
                      bPartners.clear();
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
