import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

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