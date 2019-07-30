import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/im_line/im_line.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


abstract class DetailIMViewModel extends State<DetailIMScreen>{
  InventoryMoveDetail inventoryMoveDetail;
  List<IMLine> imLine = List();
  List<Widget> linesWidget = List();
  addLine(IMLine line){
    setState(() {
      imLine.add(line);
    });
  }

 delete() async{
   Loading(context).show();
   var ref = await SharedPreferences.getInstance();
   var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
   var url = ref.getString(BASE_URL) ?? "";
   var response = await http.post("$url$DELETE_IM",
       headers: {"Forca-Token": usr.token},
       body: {"m_movement_id": inventoryMoveDetail.m_movement_id.toString()}).catchError((err) {
         print(err.toString());
   });
   Navigator.pop(context);
   if(response !=null){
     print(response.body);
     var res = jsonDecode(response.body);
     if(res["codestatus"]== "S"){
       print(res);
       MyDialog(context, "Succes", res["message"], Status.SUCCESS).build(() {
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

 completedDoc() async{
   Loading(context).show();
   var ref = await SharedPreferences.getInstance();
   var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
   var url = ref.getString(BASE_URL) ?? "";
   var response = await http.post("$url$DOC_COMPLETED_IM",
       headers: {"Forca-Token": usr.token},
       body: {"m_movement_id": inventoryMoveDetail.m_movement_id.toString()}).catchError((err) {
         print(err.toString());
   });
   Navigator.pop(context);
   if(response !=null){
     print(response.body);
     var res = jsonDecode(response.body);
     if(res["codestatus"]== "S"){
       print(res);
       var message = res['resultdata']['m_movement_id'];
       MyDialog(context, "Succes", 'Insert succeeded with m_movement_id $message', Status.SUCCESS).build(() {
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
  @override
  void initState() {
    // TODO: implement initState
    inventoryMoveDetail = widget.inventorymoveDetail;
    super.initState();
  }
}