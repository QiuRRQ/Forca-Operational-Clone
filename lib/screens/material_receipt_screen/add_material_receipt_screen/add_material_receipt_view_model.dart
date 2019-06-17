import 'dart:convert';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/create_mr_line.dart';
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
  List<String> lines =List();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Warehouse warehouse;
  BPartner bPartner;
  int minOutId;
  bool isSave = false;
  bool isSavedTwice = false;
  bool lineInserted = false;
  CreateMrParam mrParam = CreateMrParam();

  setParam() {
    mrParam.warehouseID = int.parse(warehouse.warehouseID);
    mrParam.partnerID = int.parse(bPartner.bPartnerID);
    mrParam.isSoTrx = "N";
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

  getBPartner() {
    selectBPartner(context, (bPartner) {
      setState(() {
        this.bPartner = bPartner;
      });
      Navigator.pop(context);
    });
  }

  getMasterLine() async {
    if (isNotEmptyHeader()) {
      Loading(context).show();
      List<SalesOrder> listSO = List();
      List<Locator> listLocator = List();

      await reqOrder(bPartner.bPartnerID, warehouse.warehouseID).then((order) {
        listSO.addAll(order);
      }).catchError((err) {
        print(err.toString());
      });
      print("data Order ${listSO.length}");
      await reqLocator().then((locatorList) {
        listLocator.addAll(locatorList);
      }).catchError((err) {
        print(err.toString());
      });
      print("data locator ${listLocator.length}");
      Navigator.pop(context);

      showModalBottomSheet(
          context: context,
          builder: (_) => CreateMRLine(listLocator, (line) {
            setState(() {
              Navigator.pop(context);
              mrParam.lines.add(line);
            });
          }, bPartner, warehouse, minOutId, lineInserted));
      print(lineInserted);
    }
  }

  createLine(){
    if(mrParam.lines.isNotEmpty){
      print("submitting line...");
      mrParam.lines.forEach((element) => (_submitterMR(element)));
    }
  }

  _submitterMR(MrLine item)async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$CREATE_INOUTLINE";
    print("parameter ${jsonEncode(mrParam)}");
    var response = await http.post(url, body: {
      "m_inout_id": item.inOutId.toString(),
      "c_order_id": item.orderId.toString(),
      "m_locator_id": item.locatorId.toString(),
      "qty": item.qty.toString()
    }, headers: {
      "Forca-Token": user.token,
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    Navigator.pop(context);
    if (response != null) {
      print("hasil Line ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        MyDialog(context, "Sukses", res["message"], Status.SUCCESS).build(() {
          Navigator.pop(context);
          Navigator.pop(context);
          print("result id : ${res['resultdata']}");
        });
      } else {
        MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
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
      var response = await http.post(url, body: {
        "movementdate": mrParam.movementDate.toString(),
        "c_bpartner_id": mrParam.partnerID.toString(),
        "m_warehouse_id": mrParam.warehouseID.toString(),
        "issotrx": mrParam.isSoTrx
      }, headers: {
        "Forca-Token": user.token,
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
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
            minOutId = res['resultdata'][0]['m_inout_id'];//ToDO: this item still null
            Navigator.pop(context);
            //Navigator.pop(context);
            //ToDO: cara cek line item masuk atau tidak gimana
            isSave = true;
            print("result id : $minOutId");
          });
        } else {
          MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
            Navigator.pop(context);
          });
        }
      }
    }
  }

  @override
  void initState() {
    var now = DateTime.now();
    mrParam.movementDate = "${now.year}-${now.month}-${now.day}";
    super.initState();
  }

}
