import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/material_receipt_screen/detail_receipt_screen/detail_receipt_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


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

  deleteDocumentDraft()async{
   Loading(context).show();
   var ref = await SharedPreferences.getInstance();
   var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
   var url = ref.getString(BASE_URL) ?? "";
   var response = await http.post("$url$DEL_INOUT",
   headers: {"Forca-Token": usr.token},
   body: {"m_inout_id": docNumer.m_inout_id.toString()}).catchError((errr){
     print(errr);
   });

   Navigator.pop(context);
   if(response !=null){
     print(response.body);
     var res = jsonDecode(response.body);
     if(res["codestatus"]== "S"){
       var message = res['resultdata']['documentno'];
       print(res);
       MyDialog(context, "Succes", "Delete Documentno $message Succeded", Status.SUCCESS).build(() {
         Navigator.pop(context);
         Navigator.pop(context);
       });
     }else{
       MyDialog(context,"Failed",res["message"],Status.ERROR).build((){
         Navigator.pop(context);
       });
     }
   }
  }

  completeDocumentDraft()async{
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$DOC_COMPLETED_MR",
    headers: {"Forca-Token": usr.token},
        body:{"m_inout_id": docNumer.m_inout_id.toString()}).catchError((errr){
      print(errr);
    });
    Navigator.pop(context);
    if(response !=null){
      print(response.body);
      var res = jsonDecode(response.body);
      if(res["codestatus"]== "S"){
        // todo: perlu di check
        var message = res['resultdata'][0]['documentno'];
        MyDialog(context, "Succes", 'Completed Documentno $message succeeded ', Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }else{
        MyDialog(context,"Failed",res["message"],Status.ERROR).build((){
          Navigator.pop(context);
          Navigator.pop(context);

        });
      }
    }
  }

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
