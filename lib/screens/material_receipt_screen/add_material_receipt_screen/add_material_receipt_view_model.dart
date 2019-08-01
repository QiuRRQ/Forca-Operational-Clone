import 'dart:convert';
import 'package:forca_so/master/select_order.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
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
  SalesOrder selectedOrder;

  CreateMrParam mrParam = CreateMrParam();

  setParam() {
    mrParam.m_warehouse_id = int.parse(warehouse.warehouseID);
    mrParam.c_bpartner_id = int.parse(bPartner.bPartnerID);
    mrParam.c_bpartner_location_id = int.parse(bPartner.c_bpartner_location_id);
    mrParam.c_order_id = int.parse(selectedOrder.orderID);
    mrParam.issotrx = "N";
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

      showModalBottomSheet(
          context: context,
          builder: (_) => CreateMRLine(listLocator, selectedOrder.orderID, (line) {
            setState(() {
              mrParam.list_line.add(line);
              Navigator.pop(context);
            });
          }, warehouse));
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
  }

  @override
  void initState() {
    var now = DateTime.now();
    mrParam.list_line= List();
    mrParam.movementdate = "${now.year}-${now.month}-${now.day}";
    super.initState();
  }

}
