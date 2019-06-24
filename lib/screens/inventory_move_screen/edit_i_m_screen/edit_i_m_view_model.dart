import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/im_line/im_line.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/create_iventory_move_param.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventory_move_detail_response.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/m_movementline.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/inventory_move_screen/edit_i_m_screen/edit_i_m_screen.dart';
import 'package:forca_so/screens/inventory_move_screen/edit_i_m_screen/edit_i_m_view.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';
import 'package:forca_so/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class EditIMViewModel extends State<EditIMScreen>{
  bool salesRep,bpartNer = false;
  InventoryMoveDetail inventoryMoveDetail ;
  SaleRep saleRep;
  BPartner bpartner;
  CreateIventoryMoveParam imParam = CreateIventoryMoveParam();
//  List<IMLine> imLine = List();
//  List<M_movementline> list = List();
//  List<Widget> linesWidget = List();
//  addLine(IMLine line){
//    setState(() {
//      imLine.add(line);
//    });
//  }

  initialize(){
    imParam.salerep_name = inventoryMoveDetail.salesrep_name;
    imParam.c_bpartner_id = inventoryMoveDetail.c_bpartner_id;
    imParam.m_movement_id =inventoryMoveDetail.m_movement_id;
  }

  setParam() {
   salesRep ? imParam.salerep_name = saleRep.name : imParam.salerep_name = inventoryMoveDetail.salesrep_name;
   bpartNer ? imParam.c_bpartner_id = int.parse(bpartner.bPartnerID) : imParam.c_bpartner_id = inventoryMoveDetail.c_bpartner_id;
    imParam.m_movement_id = inventoryMoveDetail.m_movement_id;
//    imParam.list_line;
  }

  getBPartner(){selectBPartner(context, (bPartner) {
      setState(() {
        this.bpartner = bPartner;
        bpartNer = true;
      });
      Navigator.pop(context);
    });
  }

  getSaleResp() async {
    Loading(context).show();
    await reqSaleRep().then((saleReps) {
      Navigator.pop(context);
      selectSaleRep(context, saleReps, (saleRep) {
        setState(() {
          this.saleRep = saleRep;
          salesRep = true;
        });
        Navigator.pop(context);
      });
    });
  }

 updateIm() async{
    setParam();
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CREATE_IM";
    print("parameter ${jsonEncode(imParam)}");
    var response = await http.post(url, body: jsonEncode(imParam), headers: {
      "Forca-Token": user.token,
      "Content-Type": "application/json"
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    Navigator.pop(context);
    if (response != null) {
      print("hasil ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
 }
  @override
  void initState() {
    // TODO: implement initState
    inventoryMoveDetail = widget.inventorymoveDetail;
    initialize();
    imParam.list_line = List();
    super.initState();
  }


}