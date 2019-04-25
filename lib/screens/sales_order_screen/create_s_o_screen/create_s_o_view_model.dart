import 'package:flutter/material.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';

import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';

abstract class CreateSOViewModel extends State<CreateSOScreen> {
  // Add your state and logic here
  List<Line> poLines = List();
  Warehouse warehouse;
  BPartner bPartner;

  _addLine(Line line) {
    setState(() {
      poLines.add(line);
    });
  }

  getWarehouse() async {
    Loading(context).show();
    await reqWarehouse().then((warehouses) {
      Navigator.pop(context);
      selectWarehouse(context, warehouses, (warehouse) {
        setState(() {
          this.warehouse = warehouse;
        });
        Navigator.pop(context);
      });
    });
  }

  getBpartner() async {
    Loading(context).show();
    await reqBPartner().then((bPartners) {
      Navigator.pop(context);
      selectBPartner(context, bPartners, (bPartner){
        setState(() {
          this.bPartner = bPartner;
        });
        Navigator.pop(context);
      });
    });
  }
}
