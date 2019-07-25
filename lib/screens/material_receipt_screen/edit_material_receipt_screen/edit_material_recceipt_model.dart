import 'dart:convert';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/screens/material_receipt_screen/add_material_receipt_screen/create_mr_line.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/material_receipt/MR_param/create_mr_param.dart';
import 'package:forca_so/models/material_receipt/detail_material_receipt/detail_material_receipt.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/screens/material_receipt_screen/edit_material_receipt_screen/edit_material_receipt_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class EditReceiptViewModel extends State<EditReceiptScreen> {
  DetailMaterialReceipt docNumer;
  List<Line> poLines = List();
  List<Widget> linesWidget = List();
  CreateMrParam mrParam = CreateMrParam();
  Warehouse warehouse;
  BPartner bPartner;
  int minOutId;
  bool isSave = false;
  bool lineInserted = false;
  bool warehouseChange = false;
  bool bPartnerChange = false;

  getWarehouse() async {
    selectWarehouse(context, (warehouse) {
      setState(() {
        warehouseChange = true;
        this.warehouse = warehouse;
      });
      Navigator.pop(context);
    });
  }

  initialize(){
    mrParam.m_warehouse_id = docNumer.warehouseID;
    mrParam.c_bpartner_id = docNumer.bPartnerID;
    mrParam.movementdate = docNumer.movementDate;
    mrParam.issotrx = "N";
  }

  setParam() {
    warehouseChange ? mrParam.m_warehouse_id = int.parse(warehouse.warehouseID) : mrParam.m_warehouse_id = docNumer.warehouseID;
    bPartnerChange ? mrParam.c_bpartner_id = int.parse(bPartner.bPartnerID) : mrParam.c_bpartner_id = docNumer.bPartnerID;
    mrParam.issotrx = "N";
  }

  getBPartner() {
    selectBPartner(context, (bPartner) {
      setState(() {
        bPartnerChange = true;
        this.bPartner = bPartner;
      });
      Navigator.pop(context);
    });
  }

  bool isNotEmptyHeader() {
    if (mrParam.m_warehouse_id == null && warehouse == null) {
      MyDialog(context, "Error", "Warehouse required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (mrParam.c_bpartner_id == null && bPartner == null ) {
      MyDialog(context, "Error", "Business Partner required", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return false;
    }
    return true;
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
      await reqLocator(warehouseID:warehouse.warehouseID).then((locatorList) {
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
              mrParam.list_line.add(line);
            });
          }, bPartner, warehouse, minOutId, lineInserted));
      print(lineInserted);
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
        "m_inout_id": widget.inOutID,
        "movementdate": mrParam.movementdate.toString(),
        "c_bpartner_id": mrParam.c_bpartner_id.toString(),
        "m_warehouse_id": mrParam.m_warehouse_id.toString(),
        "issotrx": mrParam.issotrx
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
            minOutId = res['resultdata'][0]['m_inout_id'];
            Navigator.pop(context);
            Navigator.pop(context);
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

  addLine(Line line) {
    setState(() {
      poLines.add(line);
    });
  }

  @override
  void initState() {
    //_detailReceipt();
    docNumer = widget.docNumer;
    initialize();
    super.initState();
  }

}
