import 'dart:convert';
import 'package:forca_so/models/document_type/doctype.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt_response.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/receipt_orderline.dart';
import 'package:forca_so/models/material_receipt/material_receipt.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/create_mr_line.dart';
import 'package:forca_so/utils/forca_assets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/material_receipt/MR_param/create_mr_param.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/add_material_receipt_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddMaterialReceiptViewModel extends State<AddMaterialReceiptScreen> {
  List<MrLine> lines = List();
  List<Widget> mrLine = List();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Warehouse warehouse;
  BPartner bPartner;
  DocType docType;
  SalesOrder selectedOrder;
  DetailMaterialReceipt editInfoMaterialReceipt;

  int lineNumber = 0; // this for MSC attribute
  int inOutLineID = 0;
  String selectedDocStatus;
  int inOutID = 0;//end of msc attribute

  var descriptionController;

  CreateMrParam mrParam = CreateMrParam();

  setParam() {
    bPartner == null ? mrParam.c_bpartner_id = editInfoMaterialReceipt.c_bpartner_id : mrParam.c_bpartner_id = int.parse(bPartner.bPartnerID);
//    mrParam.m_warehouse_id = int.parse(warehouse.warehouseID);
    warehouse == null ? mrParam.m_warehouse_id = editInfoMaterialReceipt.m_warehouse_id : mrParam.m_warehouse_id = int.parse(warehouse.warehouseID);
//    mrParam.c_bpartner_id = int.parse(bPartner.bPartnerID);
    bPartner == null ? mrParam.c_bpartner_location_id = editInfoMaterialReceipt.c_bpartner_location_id : mrParam.c_bpartner_location_id = int.parse(bPartner.c_bpartner_location_id);
//    mrParam.c_bpartner_location_id = int.parse(bPartner.c_bpartner_location_id);
    selectedOrder == null ? mrParam.c_order_id = editInfoMaterialReceipt.c_order_id : mrParam.c_order_id = int.parse(selectedOrder.orderID);
//    mrParam.c_order_id = int.parse(selectedOrder.orderID);
    mrParam.issotrx = "N";
    descriptionController.text.isNotEmpty ? mrParam.description = descriptionController.text.toString() : "";
  }

  initialParam(){
    mrParam.c_bpartner_id = editInfoMaterialReceipt.c_bpartner_id;
    mrParam.m_warehouse_id = editInfoMaterialReceipt.m_warehouse_id;
    mrParam.c_order_id = editInfoMaterialReceipt.c_order_id;
    mrParam.m_inout_id = editInfoMaterialReceipt.m_inout_id;
    mrParam.movementdate = editInfoMaterialReceipt.movementdate.replaceAll(new RegExp('00:00:00.0'),'');
    mrParam.description = editInfoMaterialReceipt.description;
  }

  bool isNotEmptyHeader() {
    if (warehouse == null) {
      MyDialog(context, "Error", "Warehouse required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (bPartner == null) {
      MyDialog(context, "Error", "Business Partner required", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return false;
    }
    return true;
  }

  getWarehouse() async {
    selectWarehouse(context, (warehouse) {
      setState(() {
        this.warehouse = warehouse;
      });
      Navigator.pop(context);
    });
  }

  _getwarehouse() async{
    Loading(context).show();
    await reqWarehouse(keyWord: editInfoMaterialReceipt.warehouse).then((listWr){
      setState(() {
        this.warehouse = listWr[0];
      });
    });
    Navigator.pop(context);
 }

  getDocumentStatus(){
    List<String> docStatus = ["Completed", "Drafted"];
    selectDocumentStatus(context, docStatus, (selectedDocStatus) {
      setState(() {
        this.selectedDocStatus = selectedDocStatus;
      });
      Navigator.pop(context);
    });
  }

  getBPartner() {
    selectBPartner(context, (bPartner) {
      setState(() {
        this.bPartner = bPartner;
      });
      Navigator.pop(context);
    });
  }

  getDocumentType() async {
    Loading(context).show();
    await reqDocType(docBaseType: "MMR").then((listDocTypes) {
      Navigator.pop(context);
      selectDocType(context, listDocTypes, (docType) {
        setState(() {
          this.docType = docType;
        });
        Navigator.pop(context);
      });
    });
  }


  _getBPartner() async{
    Loading(context).show();
    await reqBPartner(keyWord: editInfoMaterialReceipt.c_bpartner_name).then((lisBp){
      setState(() {
        this.bPartner = lisBp[0];
      });
    });
    Navigator.pop(context);
  }

  getOrder() async {
    if (isNotEmptyHeader()){
      selectOrderItem(context, warehouse, bPartner, (order) {
        setState(() {
          this.selectedOrder = order;
        });
        Navigator.pop(context);
      });
    }else{
      print("false");
    }
  }

  _getOrder()async{
  Loading(context).show();
  await reqOrder(editInfoMaterialReceipt.c_bpartner_id.toString(), editInfoMaterialReceipt.m_warehouse_id.toString(),documentno: editInfoMaterialReceipt.documentno_order ).then((listOder){
    setState(() {
      this.selectedOrder = listOder[0];
    });
  });
  Navigator.pop(context);
  }

  getMasterLine() async {
    if (isNotEmptyHeader()) {
      Loading(context).show();
      List<Locator> listLocator = List();
      await reqLocator(warehouseID:warehouse.warehouseID).then((locatorList) {
        listLocator.addAll(locatorList);
      }).catchError((err) {
        print(err.toString());
      });
      print("data locator ${listLocator.length}");
      Navigator.pop(context);
      if (selectedOrder == null) {
        MyDialog(context, "Error", "Order Item required", Status.ERROR).build(() {
          Navigator.pop(context);
        });
        return false;
      }
      showModalBottomSheet(
          context: context,
          builder: (_) => CreateMRLine(listLocator, selectedOrder.orderID, (newline) async {
            setState(() {
              Navigator.pop(context);
            });
            if(editInfoMaterialReceipt != null){
              await updateLine(newline);
            }
            setState(() {
              newline.m_inoutline_id = inOutLineID;
              newline.line_number = lineNumber.toString();
              mrParam.list_line.add(newline);
            });

          }, warehouse));
    }
  }

  getEditMasterLine(MrLine line,int index)async {
    Loading(context).show();
    List<Locator> listLocator = List();
    await reqLocator(warehouseID:warehouse.warehouseID).then((locatorList) {
      listLocator.addAll(locatorList);
    }).catchError((err) {
      print(err.toString());
    });
    print("data locator ${listLocator.length}");
    Navigator.pop(context);
    if (selectedOrder == null) {
      MyDialog(context, "Error", "Order Item required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    }
    showModalBottomSheet(
        context: context,
        builder: (_) => CreateMRLine(listLocator, selectedOrder.orderID, (newline) async {
          setState(() {
            Navigator.pop(context);
          });
          if(editInfoMaterialReceipt !=null){
            await updateLine(newline);
          }
          setState(() {
            newline.m_inoutline_id = inOutLineID;
            newline.line_number = lineNumber.toString();
            mrParam.list_line[index] = newline;
          });

        }, warehouse,line));
  }

  updateLine(MrLine line)async{
   Loading(context).show();
   var ref = await SharedPreferences.getInstance();
   var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
   var url = "${ref.getString(BASE_URL)}$CREATE_INOUTLINE";
   print(url);
   var mybody;
   if(line.m_inoutline_id != null){
     mybody = {
     "m_inout_id" : mrParam.m_inout_id.toString(),
      "m_inoutline_id" : line.m_inoutline_id.toString(),
       "m_locator_id" : line.m_locator_id.toString(),
       "qty" : line.qtyConversion != null ? line.qtyConversion.toString() : line.qty.toString(),
       "m_product_id" : line.m_product_id.toString(),
       "c_uom_id" : line.c_uom_id.toString(),
       "c_orderline": line.c_orderline_id.toString(),
     };
   }else{
     mybody ={
       "m_inout_id" : mrParam.m_inout_id.toString(),
       "m_locator_id" : line.m_locator_id.toString(),
       "qty" : line.qtyConversion != null ? line.qtyConversion.toString() : line.qty.toString(),
       "m_product_id" : line.m_product_id.toString(),
       "c_uom_id" : line.c_uom_id.toString(),
       "c_orderline": line.c_orderline_id.toString(),
     };
   }
   print(" param updateline $mybody");
   var response = await http.post(url,body: mybody, headers:{"Forca-Token": user.token}).catchError((
       err) {
     print("error ${err.toString()}");
     Navigator.pop(context);
   });

   Navigator.pop(context);
   print("iki response update line ${response.body}");
   if (response.statusCode == 200) {
     var res = jsonDecode(response.body);
     if(res["codestatus"] == "S"){
       setState(() {
         lineNumber = res['resultdata'][0]['line_number'];
         inOutLineID = res['resultdata'][0]['m_inoutline_id'];
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

  _getLine(){
    editInfoMaterialReceipt.m_inoutline.forEach((g)=> _initLine(g));
  }

  _initLine(m_inOutline outline){
    MrLine item = MrLine();

    item.line_number = outline.line_number;
    item.c_uom_id = int.parse(outline.c_uom_id);
    item.m_inoutline_id = int.parse(outline.m_inoutline_id);
    item.productName = outline.product_name;
    item.m_product_id = int.parse(outline.m_product_id);
    item.uom_name = outline.uom_name;
    item.m_locator_id = int.parse(outline.m_locator_id);
    item.locator_name = outline.locator_name;
    item.qty = outline.movementqty;

    setState(() {
      mrParam.list_line.add(item);
    });

  }

  completeDocumentDraft()async{
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$DOC_COMPLETED_MR",
        headers: {"Forca-Token": usr.token},
        body:{"m_inout_id": widget.materialReceipt == null ? inOutID.toString() : mrParam.m_inout_id.toString()}).catchError((errr){
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

  createMR() async {
    if (isNotEmptyHeader()) {
      setParam();
      Loading(context).show();
      var ref = await SharedPreferences.getInstance();
      var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
      var url = "${ref.getString(BASE_URL)}$CREATE_INOUT";
      print("parameter ${jsonEncode(mrParam)}");
      var response = await http.post(url, body: jsonEncode(mrParam), headers: {
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
          var message = res['resultdata']['documentno'];
          MyDialog(context, "Sukses", 'Insert succeeded with documentno $message', Status.SUCCESS).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });

        } else {
          if(res["message"] == "Error caused by : java.lang.Exception: Quantity of inout cannot exceed the quantity of order"){
            MyDialog(context, "Failed", "Quantity of inout cannot exceed the quantity of order", Status.ERROR).build(() {
              Navigator.pop(context);
            });
          }else{
            MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
              Navigator.pop(context);
            });
          }
        }
      }
    }

    selectedDocStatus = null;
  }

  updateMR() async{
    setParam();
    Loading(context).show();
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CREATE_INOUT";
    mrParam.list_line.forEach((g)=>lines.add(g));
    mrParam.list_line.clear();
    print("parameter ${jsonEncode(mrParam)}");
    var response = await http.post(url, body: jsonEncode(mrParam), headers: {
      "Forca-Token": user.token,
      "Content-Type": "application/json"
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    mrParam.list_line = lines;
    Navigator.pop(context);
    if (response != null) {
      print("hasil ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var message = res['resultdata']['documentno'];
        this.inOutID = res['resultdata']['m_inout_id'];
        MyDialog(context, "Succes", 'Update documentno $message succeeded', Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
        if(selectedDocStatus == "Completed"){
          completeDocumentDraft();
        }
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }
    }
  }

  showDialogDocStatus(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          content: Container(
            padding: EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: forcaText("Set document as complete?",
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 16.0)),
                Padding(padding: EdgeInsets.only(top: 16.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child:
                      forcaButton(
                          forcaText("Yes", color: Colors.white), () => setSelectedDocStatus("Completed")),
                    ),
                    Container(
                      child: forcaButton(forcaText("No", color: Colors.white), () => setSelectedDocStatus("Drafted"),
                          color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  setSelectedDocStatus(String s) {
    Navigator.pop(context);
    selectedDocStatus = s;
    createMR();
  }

  delete(MrLine line){
    setState(() {
      mrParam.list_line.remove(line);
    });
    if(editInfoMaterialReceipt !=null){
      deleteLine(line);
    }
  }

  deleteLine(MrLine line)async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$DEL_INOUTLINE";
    var myBody = {
      "m_inoutline_id": line.m_inoutline_id.toString()
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

  getEditDetailMaterialReceiptInfo(MaterialReceipt materialReceipt) async {
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var myBody = {"m_inout_id": materialReceipt.inOutID};
    var response = await http.post("$url$DETAIL_RECEIPT",
        headers: {"Forca-Token": usr.token},
        body:myBody ).catchError((err) {
          print(err);
    });
    if (response != null) {
      print('ini getdetail response ${response.body}');
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var detailResponse = DetailMaterialReceiptResponse.fromJsonMap(res);
        setState(() {
          editInfoMaterialReceipt = detailResponse.materialReceipts;
        });

      } else {
        print("getDetail : ${res["message"]}");
        MyDialog(context, "Failur", "Detail Material Receipt not Found", Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }
    await _getBPartner();
    await _getwarehouse();
    await _getOrder();
    await initialParam();
    await _getLine();
  }

  @override
  void initState() {
    var now = DateTime.now();
    mrParam.list_line= List();
    if(widget.materialReceipt != null){
    print("masuk edit");
    getEditDetailMaterialReceiptInfo(widget.materialReceipt);
    mrParam.movementdate = widget.materialReceipt.movementDate.replaceAll(new RegExp('00:00:00'),'');
    print("iki bagian di edit ${mrParam.movementdate}");
    }else{
      mrParam.movementdate = "${now.year}-${now.month}-${now.day}";
      print(mrParam.movementdate);
    }
    descriptionController = TextEditingController();
//    var inoutid = widget.materialReceipt.inOutID;
//    print('iki itoutID $inoutid');
    super.initState();
  }

}
