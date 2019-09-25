import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/document_type/doctype.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:forca_so/utils/my_dialog.dart';

class SelectDocType extends StatefulWidget {
  final ValueChanged<DocType> onSelected;
  final String docBaseType;
  final String isSoTrx;
  final String docSubTypeSo;

  SelectDocType(this.onSelected, {this.docBaseType, this.isSoTrx, this.docSubTypeSo});

  @override
  _SelectDocTypeState createState() => _SelectDocTypeState(onSelected, docBaseType, isSoTrx, docSubTypeSo);
}

class _SelectDocTypeState extends State<SelectDocType> {
  List<DocType> docType = List();
  String docBaseType;
  String isSoTrx;
  String docSubTypeSo;
  final ValueChanged<DocType> onSelected;

  _SelectDocTypeState(this.onSelected, this.docBaseType, this.isSoTrx, this.docSubTypeSo);

  TextEditingController keyword;
  int page = 1;

  _getDocType() async {
    Loading(context).show();
    await reqDocType(keyWord: keyword.text.toString(), docBaseType: docBaseType, isSoTrx: isSoTrx, docSubTypeSo: docSubTypeSo)
        .then((listDT) {
      setState(() {
        this.docType = listDT;
      });
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    keyword = TextEditingController();
    _getDocType();
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
              child: forcaText("Select Document Type",
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          TextFormField(
            controller: keyword,
            decoration: InputDecoration(
                hintText: "Search Doc. Type by name",
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      page = 1;
                      docType.clear();
                      _getDocType();
                    })),
          ),
          docType.isEmpty
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
                      onSelected(docType[i]);
                    },
                    child: forcaText(docType[i].name)),
                itemCount: docType.length,
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
                        _getDocType();
                      });
                    }
                  },
                  child: forcaText("Previus",
                      color: page <= 1 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                  onPressed: docType.isEmpty
                      ? null
                      : () {
                    setState(() {
                      page++;
                      _getDocType();
                    });
                  },
                  child: forcaText("Next",
                      color: docType.isEmpty ? Colors.grey : Colors.black,
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
