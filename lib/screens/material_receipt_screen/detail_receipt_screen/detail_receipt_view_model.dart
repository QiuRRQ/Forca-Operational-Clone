import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/screens/material_receipt_screen/detail_receipt_screen/detail_receipt_screen.dart';


abstract class DetailReceiptViewModel extends State<DetailReceiptScreen> {
  DetailMaterialReceipt docNumer;
  List<Line> poLines = List();
  List<Widget> linesWidget = List();
  //bool isReq = true;
  //List<DetailMaterialReceipt> linesItem = List();

  /* _detailReceipt()async{
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL) ?? ""}$DETAIL_RECEIPT";
    var myBody = {
      "m_inout_id":widget.docNumer,
      "issotrx":"Y"
    };
    print(myBody);
    var header = {"Forca-Token":usr.token};
    var response = await http.post(url,body: myBody,headers: header).catchError((err){
      isReq = false;
      print('hasil ${err.toString()}');
    });

    var res = jsonDecode(response.body);

    print("hasil ${response.body}");
    DetailMaterialReceiptResponse detailMaterialReceiptResponse = DetailMaterialReceiptResponse.fromJsonMap(res);
    return docNumer = detailMaterialReceiptResponse.materialReceipts;
  }*/
  addLine(Line line) {
    setState(() {
      poLines.add(line);
    });
  }

  @override
  void initState() {
    //_detailReceipt();
    docNumer = widget.docNumer;
    super.initState();
  }

}
