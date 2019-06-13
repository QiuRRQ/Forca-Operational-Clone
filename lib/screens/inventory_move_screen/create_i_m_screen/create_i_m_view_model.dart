import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/create_iventory_move_param.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_line.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/create_i_m_screen.dart';
import 'package:forca_so/models/im_line/im_line.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/widget_i_m_line.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';
import 'package:forca_so/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class CreateIMViewModel extends State<CreateIMScreen> {
  // Add your state and logic here
  List<IMLine> imLine = List();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  SaleRep saleRep;
  BPartner bpartner;
  CreateIventoryMoveParam imParam = CreateIventoryMoveParam();

  setParam() {
    imParam.salerep_name = saleRep.name;
    imParam.c_bpartner_id = int.parse(bpartner.bPartnerID);
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
        MyDialog(context, "TAX Empty", "TAX is Empty", Status.ERROR).build(() {
          Navigator.pop(context);
        });
        return;
      }
      showModalBottomSheet(
          context: context,
          builder: (_) =>
              CreateIMLine(
                listLocator,
                    (line) {
                  setState(() {
                    Navigator.pop(context);
                    imParam.list_line.add(line);
                  });
                },
              ));
    }
  }

  createIm() async {
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
      // TODO: implement initState
      var now = DateTime.now();
      imParam.list_line = List();
      imParam.movementdate = "${now.year}-${now.month}-${now.day}";
      super.initState();
    }
  }

