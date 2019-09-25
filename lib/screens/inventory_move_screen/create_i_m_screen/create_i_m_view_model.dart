import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/document_type/doctype.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/create_iventory_move_param.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/list_line.dart';
import 'package:forca_so/models/inventory_move/inventory_move.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventory_move_detail_response.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/inventorymove_detail.dart';
import 'package:forca_so/models/inventory_move/inventory_move_detail/m_movementline.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_line.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


abstract class CreateIMViewModel extends State<CreateIMScreen> {
  // Add your state and logic here
  List<ListLine> temp = List();
  List<Widget> imLine = List();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  SaleRep saleRep;
  BPartner bpartner;
  DocType docType;
  InventoryMoveDetail editInventoryMoveInfo;
  CreateIventoryMoveParam imParam = CreateIventoryMoveParam();
  bool checkTransit;
  var descriptionController;

  int lineNumber = 0; // this for MSC attribute
  int movementLineID = 0;
  String selectedDocStatus;
  int movementID = 0;//end of msc attribute

  setParam() {
    saleRep == null
        ? imParam.salerep_name = editInventoryMoveInfo.salesrep_name
        : imParam.salerep_name = saleRep.name;
    bpartner == null ?
    imParam.c_bpartner_id = editInventoryMoveInfo.c_bpartner_id : imParam
        .c_bpartner_id = int.parse(bpartner.bPartnerID);
    imParam.isintransit = checkTransit == true ? "Y" : "N";
    descriptionController.text.isNotEmpty ? imParam.description = descriptionController.text.toString() : "";
    print(imParam.isintransit);
  }

  isTransit(bool transit){
    setState(() {
      checkTransit = transit;
    });
  }


  initialParam() {
    imParam.salerep_name = editInventoryMoveInfo.salesrep_name;
    imParam.c_bpartner_id = editInventoryMoveInfo.c_bpartner_id;
    imParam.m_movement_id = editInventoryMoveInfo.m_movement_id;
    imParam.isintransit = editInventoryMoveInfo.istransit.toString();
    print(imParam.isintransit);
    imParam.isintransit == "true" ? isTransit(true): isTransit(false);
    imParam.description = editInventoryMoveInfo.description;

  }

  bool isNotEmptyHeader() {
    if (saleRep == null) {
      MyDialog(context, "Error", "Salesref required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (bpartner == null) {
      MyDialog(context, "Error", "Business Partner required", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return false;
    }
    return true;
  }

  getBPartner() {
    selectBPartner(context, (bPartner) {
      setState(() {
        this.bpartner = bPartner;
      });
      Navigator.pop(context);
    });
  }

  getDocumentType() async {
    Loading(context).show();
    await reqDocType(docBaseType: "MMM").then((listDocTypes) {
      Navigator.pop(context);
      selectDocType(context, listDocTypes, (docType) {
        setState(() {
          this.docType = docType;
        });
        Navigator.pop(context);
      });
    });
  }

  _getReqBPartner() async {
    Loading(context).show();
    await reqBPartner(keyWord: editInventoryMoveInfo.c_bpartner_name)
        .then((listBp) {
      setState(() {
        this.bpartner = listBp[0];
      });
    });
    Navigator.pop(context);
  }

  getSaleResp() async {
    Loading(context).show();
    await reqSaleRep().then((saleReps) {
      Navigator.pop(context);
      selectSaleRep(context, saleReps, (saleRep) {
        setState(() {
          this.saleRep = saleRep;
        });
        Navigator.pop(context);
      });
    });
  }

  _getReqSaleResp() async {
    //Loading(context).show();
    await reqSaleRep(keyword: editInventoryMoveInfo.salesrep_name).then((
        saleReps) {
      //Navigator.pop(context);
      setState(() {
        this.saleRep = saleReps[0];
      });
    });
  }

  _getLine() {
    editInventoryMoveInfo.m_movementline.forEach((g) => _initLine(g));
  }

  _initLine(M_movementline m_movementline) {
    ListLine item = ListLine();

    item.line_number = m_movementline.line_number;
    item.forca_c_uom_id = int.parse(m_movementline.uom_id);
    item.productName = m_movementline.product_name;
    item.m_product_id = int.parse(m_movementline.productID);
    item.idLine = int.parse(m_movementline.m_movementline_id);
//    item.movementqty =int.parse(m_movementline.movementqty);
    item.forca_qtyentered = m_movementline.forca_qtyentered;
    item.locatorTo = m_movementline.m_locator_to;
    item.locatorFrom = m_movementline.m_locator;
    item.UomName = m_movementline.uom_name;
    item.m_locator_id = int.parse(m_movementline.locatorFromId);
    item.m_locatorto_id = int.parse(m_movementline.locatorToId);

    setState(() {
      imParam.list_line.add(item);
    });
  }

  getMasterLine() async {
    if (isNotEmptyHeader()) {
      Loading(context).show();
      List<Locator> listLocator = List();
      await reqLocator().then((locatorList) {
        listLocator.addAll(locatorList);
      }).catchError((err) {
        print(err.toString());
      });

      print("data locator ${listLocator.length}");
      Navigator.pop(context);
      if (listLocator.isEmpty) {
        MyDialog(context, "Locator Empty", "Locator is Empty", Status.ERROR)
            .build(() {
          Navigator.pop(context);
        });
        return;
      }
      showModalBottomSheet(
          context: context,
          builder: (_) => CreateIMLine(listLocator, (line) async {
                setState(() {
                  Navigator.pop(context);
                });
                if(editInventoryMoveInfo != null){
                  await _updateLine(line);
                }
                setState(() {
                  line.idLine = movementLineID;
                  line.line_number = lineNumber.toString();
                  imParam.list_line.add(line);
                });
              }
          ));
    }
  }

  getEditMasterLine(ListLine line, int index) async {
    Loading(context).show();
    List<Locator> listLocator = List();
    await reqLocator().then((locatorList) {
      listLocator.addAll(locatorList);
    }).catchError((err) {
      print(err.toString());
    });
    print("iki line $line");
    Navigator.pop(context);
    if (listLocator.isEmpty) {
      MyDialog(context, "Locator Empty", "Locator is Empty", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return;
    }
    showModalBottomSheet(context: context, builder: (_) =>
        CreateIMLine(
            listLocator, (newline) async {
          setState(() {
            Navigator.pop(context);
          });
          if (editInventoryMoveInfo != null) {
            await _updateLine(newline);
          }
          setState(() {
            newline.idLine = movementLineID;
            newline.line_number = lineNumber.toString();
            imParam.list_line[index] = newline;
          });
        }, line));
  }

  getDocumentStatus() {
    List<String> docStatus = ["Completed", "Drafted"];
    selectDocumentStatus(context, docStatus, (selectedDocStatus) {
      setState(() {
        this.selectedDocStatus = selectedDocStatus;
      });
      Navigator.pop(context);
    });
  }

  _updateLine(ListLine listLine) async{
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$SET_IM_LINE";
    print(url);
    var myBody;
    if(listLine.idLine != null){
      myBody = {
        "crm_id": "0",
        "m_movement_id": imParam.m_movement_id.toString(),
        "m_movementline_id": listLine.idLine.toString(),
        "m_locator_id": listLine.m_locator_id.toString(),
        "m_locatorto_id": listLine.m_locatorto_id.toString(),
        "m_product_id":listLine.m_product_id.toString(),
        "forca_c_uom_id":listLine.forca_c_uom_id.toString(),
        "forca_qtyentered": listLine.forca_qtyentered.toString(),
      };
    }else{
      myBody = {
        "crm_id": "0",
        "m_movement_id": imParam.m_movement_id.toString(),
        "m_locator_id": listLine.m_locator_id.toString(),
        "m_locatorto_id": listLine.m_locatorto_id.toString(),
        "m_product_id":listLine.m_product_id.toString(),
        "forca_c_uom_id":listLine.forca_c_uom_id.toString(),
        "forca_qtyentered": listLine.forca_qtyentered.toString(),
      };
    }
    var response = await http.post(
        url, body: myBody, headers: {"Forca-Token": user.token}).catchError((
        err) {
      print("error ${err.toString()}");
      print(myBody);
      Navigator.pop(context);
    });
    Navigator.pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      if(res["codestatus"] == "S"){
        setState(() {
          lineNumber = res['resultdata'][0]['line_number'];
          movementLineID = res['resultdata'][0]['m_movementline_id'];
        });
        MyDialog(context,"Succeed", res["message"],Status.SUCCESS).build((){
          Navigator.pop(context);
        });

      }
    } else {
      print(response.statusCode);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  delete(ListLine line){
    setState(() {
      imParam.list_line.remove(line);
    });
    if(editInventoryMoveInfo != null){
    deleteLine(line);
    }

  }

  deleteLine(ListLine line) async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$DELETE_IM_LINE";
    var myBody = {
      "m_movementline_id": line.idLine.toString()
    };
    print("line param : $myBody");
    var response = await http.post(url, body: myBody, headers: {
      "Forca-Token": user.token
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    if (response != null) {
      print("delete line result ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
          Navigator.pop(context);
          //Navigator.pop(context);
        });
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
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
        body: {"m_movement_id": widget.inventoryMove == null? movementID.toString() : imParam.m_movement_id.toString()}).catchError((err) {
      print(err.toString());
    });
    Navigator.pop(context);
    if(response !=null){
      print(response.body);
      var res = jsonDecode(response.body);
      if(res["codestatus"]== "S"){
        print(res);
        var message = res['resultdata'][0]['documentno'];
        MyDialog(context, "Succes", 'Completed Documentno $message Succeeded ', Status.SUCCESS).build(() {
          Navigator.pop(context);
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

  createImDraft()async {
    if (isNotEmptyHeader()) {
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
       var res = jsonDecode(response.body);
        print("hasil ${response.body}");
        if (res["codestatus"] == "E") {
          MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });

        } else {
          var message = res['resultdata']['documentno'];
          this.movementID = res['resultdata']['m_movement_id'];
          MyDialog(context, "Succes",'Insert succeeded with documentno $message', Status.SUCCESS).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });
          if(selectedDocStatus == "Completed"){
            completedDoc();
          }
        }
      }
  }
  }

  getEditDetailInventoryMoveInfo(InventoryMove inventoryMove) async{
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$DETAIL_IM",
        headers: {"Forca-Token": usr.token},
        body: {"m_movement_id": inventoryMove.m_movement_id}).catchError((err) {
    });
    if (response != null) {
      print("iki response geteditdetail ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var detailResponse = InventoryMoveDetailResponse.fromJsonMap(res);
        setState(() {
          editInventoryMoveInfo = detailResponse.inventorymove_detail;
        });
      } else {
        MyDialog(context, "Failur", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
     await _getReqBPartner();
     await _getReqSaleResp();
     await initialParam();
     await _getLine();
  }

  updateIm() async{
    setParam();
    print(imParam.salerep_name);
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CREATE_IM";
    imParam.list_line.forEach((g)=>temp.add(g));
    imParam.list_line.clear();
    print("parameter ${jsonEncode(imParam)}");
    var response = await http.post(url, body: jsonEncode(imParam), headers: {
      "Forca-Token": user.token,
      "Content-Type": "application/json"
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    imParam.list_line = temp;
    Navigator.pop(context);
    if (response != null) {
      print("hasil ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        print("line lengt ${imParam.list_line.length}");
        var message = res["resultdata"]['documentno'];
        MyDialog(
            context, "Succes", 'Update documentno $message succeeded',
            Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
        if(selectedDocStatus == "Completed"){
          completedDoc();
        }
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
    var now = DateTime.now();
    imParam.list_line = List();
    if(widget.inventoryMove != null){
      print("ini masuk edit inventorymove");
      getEditDetailInventoryMoveInfo(widget.inventoryMove);
      imParam.movementdate = widget.inventoryMove.movementdate.replaceAll(new RegExp('00:00:00'),'');
    }else{
      imParam.movementdate = "${now.year}-${now.month}-${now.day}";
    }
    descriptionController = TextEditingController();

    super.initState();
  }
}