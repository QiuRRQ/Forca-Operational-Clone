
import 'package:forca_so/models/material_receipt/MR_param/mr_line.dart';

class CreateMrParam {
  String movementDate = "";
  List<MrLine> lines = List<MrLine>();
  int warehouseID = 0;
  int partnerID = 0;
  String isSoTrx = "";

  CreateMrParam();

  CreateMrParam.fromJsonMap(Map<String, dynamic> map)
      : movementDate = map["movementdate"],
        warehouseID = map["m_warehouse_id"],
        isSoTrx = map["issotrx"],
        partnerID = map["c_bpartner_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movementdate'] = movementDate;
    data['m_warehouse_id'] = warehouseID;
    data['c_bpartner_id'] = partnerID;
    data['issotrx'] = isSoTrx;
    return data;
  }
}
