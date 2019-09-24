import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_so/models/document_type/doctype.dart';
import 'package:forca_so/models/payment_rule/payment_rule.dart';
import 'package:forca_so/models/price_list/price_list.dart';
import 'package:forca_so/models/sales_order/sales_order.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/c_orderline.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order.dart';
import 'package:forca_so/models/sales_order/sales_order_detail/detail_sales_order_response.dart';
import 'package:forca_so/models/sales_order/sales_order_param/so_line.dart';
import 'package:forca_so/models/tax/tax.dart';
import 'package:forca_so/models/user/user.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_s_o_screen.dart';
import 'package:forca_so/models/po_line/line.dart';
import 'package:forca_so/master/master_presenter.dart';
import 'package:forca_so/screens/sales_order_screen/create_s_o_screen/create_so_line.dart';
import 'package:forca_so/screens/sales_order_screen/detail_s_o_screen/detail_s_o_screen.dart';
import 'package:forca_so/utils/my_dialog.dart';
import 'package:forca_so/utils/select_master.dart';

import 'package:forca_so/models/warehouse/warehouse.dart';
import 'package:forca_so/models/bpartner/bpartner.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/sale_rep/sale_rep.dart';
import 'package:forca_so/models/sales_order/sales_order_param/create_so_param.dart';
import 'package:forca_so/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateSOViewModel extends State<CreateSOScreen> {
  // Add your state and logic here

  List<Line> poLines = List();
  List<SoLine> temp = List();

  int lineNumber = 0; // this for MSC attribute
  int orderLineID = 0;
  String selectedDocStatus;
  int orderID = 0;//end of msc attribute

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Warehouse warehouse;
  BPartner bPartner;
  DocType docType;
  Product product;
  SaleRep saleRep;
  PaymentRule paymentRule;
  DetailSalesOrder editOrderInfo;
  PriceList priceList;
  CreateSoParam soParams = CreateSoParam();
  var descriptionController;

  @override
  void initState() {

    soParams.lines = List();

    if(widget.orderItem != null){
      print("masuk sini");
      getEditDetail(widget.orderItem);
    }

    var now = DateTime.now();
    descriptionController = TextEditingController();
    soParams.dateOrdered = "${now.year}-${now.month}-${now.day}";
    super.initState();

  }

  setParam() {
    if(soParams.warehouseID != int.parse(warehouse.warehouseID)){
      soParams.warehouseID = int.parse(warehouse.warehouseID);
    }
    if(soParams.partnerID != int.parse(bPartner.bPartnerID)){
      soParams.partnerID = int.parse(bPartner.bPartnerID);
    }
    if(saleRep != null){
      soParams.saleRepName = saleRep.name;
    }
    if(soParams.priceListID != int.parse(priceList.priceListID)){
      soParams.priceListID = int.parse(priceList.priceListID);
    }
    if(soParams.paymentRule != paymentRule.value){
      soParams.paymentRule = paymentRule.value;
    }
    soParams.isSoTrx = "Y";
    descriptionController.text.isNotEmpty ? soParams.description = descriptionController.text.toString() : "";
  }


  _getLine() {
    editOrderInfo.orderLine.forEach((c) => _initLine(c));
  }

  _initLine(OrderLine c){
    SoLine item = SoLine();

    item.lineNo = c.line_number;
    item.idLine = int.parse(c.c_orderline_id);
    item.taxName = c.taxName;
    item.taxID = int.parse(c.taxID);
    item.productID = int.parse(c.productID);
    item.productName = c.productName;
    item.uomID = int.parse(c.uomID);
    item.uomName = c.uomName;
    var _price = c.priceEntered.replaceAll(new RegExp(r"[^\s\w]"),'');
    item.priceDisplay = c.priceEntered;//for displaying user friendly
    List _temp = _price.split(" "); // take out currency
    item.price = _temp[1]; // just taking the number
    item.qty = int.parse(c.qty);
    item.total = c.total;

    setState(() {
      soParams.lines.add(item);
    });
  }

  _getWarehouse() async {
    //Loading(context).show();
    await reqWarehouse(keyWord: editOrderInfo.warehouse)
        .then((listWH) {
      setState(() {
        this.warehouse = listWH[0];
      });
    });
    //Navigator.pop(context);
  }

  _getBPartner() async {
    Loading(context).show();
    await reqBPartner(keyWord: editOrderInfo.partnerName)
        .then((listBp) {
      setState(() {
        this.bPartner = listBp[0];
      });
    });
    Navigator.pop(context);
  }

  _getSaleResp() async {
    //Loading(context).show();
    await reqSaleRep(keyword: editOrderInfo.salesRepName).then((saleReps) {
      //Navigator.pop(context);
      setState(() {
        this.saleRep = saleReps[0];
      });
    });
  }

  _getPriceList() async {
    //Loading(context).show();
    await reqPriceList(keyWord : editOrderInfo.priceList, isSoPriceList: "Y").then((price) {
      //Navigator.pop(context);
      setState(() {
        this.priceList = price[0];
      });
    });
  }

  _getPaymentRule() async {
    //Loading(context).show();
    await reqPaymentRule(editOrderInfo.paymentRule).then((paymentRules) {
      setState(() {
        this.paymentRule = paymentRules[0];
      });
    });
  }

  initialParam(){
    soParams.warehouseID = int.parse(warehouse.warehouseID);
    soParams.partnerID = editOrderInfo.bPartnerID;
    soParams.saleRepName = editOrderInfo.salesRepName;
    soParams.priceListID = int.parse(priceList.priceListID);
    soParams.paymentRule = paymentRule.value;
    soParams.dateOrdered = editOrderInfo.dateOrdered;
    soParams.orderID = editOrderInfo.orderID;
    soParams.documentNo = editOrderInfo.documentNo;
    soParams.isSoTrx = "Y";
    soParams.description = editOrderInfo.description;
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
    } else if (saleRep == null) {
      MyDialog(context, "Error", "Sales Rep required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (priceList == null) {
      MyDialog(context, "Error", "Price List required", Status.ERROR).build(() {
        Navigator.pop(context);
      });
      return false;
    } else if (paymentRule == null) {
      MyDialog(context, "Error", "Payment Rule required", Status.ERROR)
          .build(() {
        Navigator.pop(context);
      });
      return false;
    }
    return true;
  }


  getEditDetail(SalesOrder salesOrder) async {
    var ref = await SharedPreferences.getInstance();
    var usr = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = ref.getString(BASE_URL) ?? "";
    var response = await http.post("$url$DETAIL_SO",
        headers: {"Forca-Token": usr.token},
        body: {"c_order_id": salesOrder.orderID}).catchError((err) {});
    if (response != null) {
      print("response dapat");
      print(response.body);
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var detailResponse = DetailSalesOrderResponse.fromJsonMap(res);
        editOrderInfo = detailResponse.detail;

        print("dapat");
      } else {
        MyDialog(context, "Failur", res["message"], Status.ERROR).build(() {
          Navigator.pop(context);
        });
      }
    }

    //get default value from API for editing
    await _getWarehouse();
    await _getBPartner();
    await _getPriceList();
    await _getPaymentRule();
    await _getSaleResp();
    initialParam();
    await _getLine();
    //initialize end here
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

  getDocumentType() async {
    Loading(context).show();
    await reqDocType(docBaseType: "SOO", isSoTrx: "Y", docSubTypeSo: "N").then((listDocType) {
      Navigator.pop(context);
      selectDocType(context, listDocType, (docType) {
        setState(() {
          this.docType = docType;
        });
        Navigator.pop(context);
      });
    });
  }

  editMasterLine(SoLine lineItem, int index) async {
    if (isNotEmptyHeader()) {
      Loading(context).show();
      List<Product> listProduct = List();
      List<Tax> listTax = List();

      await reqProduct(priceListID: priceList.priceListID, dateFrom: soParams.dateOrdered).then((products) {
        listProduct.addAll(products);
      }).catchError((err) {
        print(err.toString());
      });
      print("data product ${listProduct.length}");
      await reqTax().then((taxList) {
        listTax.addAll(taxList);
      }).catchError((err) {
        print(err.toString());
      });
      print("data tax ${listTax.length}");
      Navigator.pop(context);
      if (listProduct.isEmpty) {
        MyDialog(
            context,
            "Wrong Price List",
            "There are no products for the pricelist you selected",
            Status.ERROR)
            .build(() {
          Navigator.pop(context);
        });
        return;
      }
      if (listTax.isEmpty) {
        MyDialog(context, "TAX Empty", "TAX is Empty", Status.ERROR).build(() {
          Navigator.pop(context);
        });
        return;
      }
      showModalBottomSheet(
          context: context,
          builder: (_) => CreateSOLine(listTax, (line) async {
            setState(() {
              Navigator.pop(context);
            });
            if(editOrderInfo != null){
              await _updateLine(line);
            }
            setState(() {
              line.lineNo = lineNumber.toString();
              line.idLine = orderLineID;
              soParams.lines[index] = line;
            });
          }, priceList, lineItem));
    }
  }


  getMasterLine() async {
    if (isNotEmptyHeader()) {
      Loading(context).show();
      List<Product> listProduct = List();
      List<Tax> listTax = List();

      await reqProduct(priceListID: priceList.priceListID, dateFrom: soParams.dateOrdered).then((products) {
        listProduct.addAll(products);
      }).catchError((err) {
        print(err.toString());
      });
      print("data product ${listProduct.length}");
      await reqTax().then((taxList) {
        listTax.addAll(taxList);
      }).catchError((err) {
        print(err.toString());
      });
      print("data tax ${listTax.length}");
      Navigator.pop(context);
      if (listProduct.isEmpty) {
        MyDialog(
            context,
            "Wrong Price List",
            "There are no products for the pricelist you selected",
            Status.ERROR)
            .build(() {
          Navigator.pop(context);
        });
        return;
      }
      if (listTax.isEmpty) {
        MyDialog(context, "TAX Empty", "TAX is Empty", Status.ERROR).build(() {
          Navigator.pop(context);
        });
        return;
      }
      await showModalBottomSheet(
          context: context,
          builder: (_) => CreateSOLine(listTax, (line) async {
            setState(() {
              Navigator.pop(context);
            });
            if(editOrderInfo != null){
              await _updateLine(line);
            }
            setState(() {
              line.lineNo = lineNumber.toString();
              line.idLine = orderLineID;
              soParams.lines.add(line);
            });
          }, priceList));
      //panggil get edit detail untuk refresh view sesudah menambahkan line(untuk mendapatkan line no)

      //tapi header akan kembali ke awal sebelum so di save
    }
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

  getPaymentRule() async {
    Loading(context).show();
    await reqPaymentRule().then((paymentRules) {
      Navigator.pop(context);
      selectPaymentRule(context, paymentRules, (paymentRule) {
        setState(() {
          this.paymentRule = paymentRule;
        });
        Navigator.pop(context);
      });
    });
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

  getPriceList() async {
    selectPriceList(context, (priceList) {
      setState(() {
        this.priceList = priceList;
      });
      Navigator.pop(context);
    }, "Y");
  }

  setComplete()async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$SET_SOCOMPLETE";
    var myBody = {
      "c_order_id": widget.orderItem == null ? orderID.toString() : soParams.orderID.toString()
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
      print("res complete ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        var message = res['resultdata'][0]['documentno'];
        MyDialog(context, "Succes",'Completed Documentno $message Succeeded ', Status.SUCCESS).build(() {
          Navigator.pop(context);
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

  createSO() async {
    if (isNotEmptyHeader()) {
      setParam();
      Loading(context).show();
      var ref = await SharedPreferences.getInstance();
      var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
      var url = "${ref.getString(BASE_URL)}$CREATE_ORDER";
      print("parameter ${jsonEncode(soParams)}");
      var response = await http.post(url, body: jsonEncode(soParams), headers: {
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
          this.orderID = res['resultdata']['c_order_id'];
          MyDialog(context, "Succes", 'Insert succeeded with documentno $message', Status.SUCCESS).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });
          if(selectedDocStatus == "Completed"){
            setComplete();
          }
        } else {
          MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
            Navigator.pop(context);
          });
        }
      }
    }
  }

  delete(SoLine line){
    setState(() {
      soParams.lines.remove(line);
    });
    if(editOrderInfo != null){
      _deleteLine(line);
    }
  }

  _deleteLine(SoLine c)async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$DEL_SOLINE";
    var myBody = {
      "c_orderline_id": c.idLine.toString()
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
        var message = res['resultdata']['line_number'];
        MyDialog(context, "Succes", "Deleted line number ${message.toString()}", Status.SUCCESS).build(() {
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


  updateSO() async {
    if (isNotEmptyHeader()) {
      await setParam();
      Loading(context).show();
      var ref = await SharedPreferences.getInstance();
      var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
      var url = "${ref.getString(BASE_URL)}$CREATE_ORDER";

      soParams.lines.forEach((c) => temp.add(c));
      soParams.lines.clear();
      print("parameter ${jsonEncode(soParams)}");
      var response = await http.post(url, body: jsonEncode(soParams), headers: {
        "Forca-Token": user.token,
        "Content-Type": "application/json"
      }).catchError((err) {
        MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
          Navigator.pop(context);
        });
      });
      soParams.lines = temp;
      Navigator.pop(context);
      if (response != null) {
        print("hasil ${response.body}");
        var res = jsonDecode(response.body);
        if (res["codestatus"] == "S") {
          print("param line length after edit ${soParams.lines.length}");
          var message = res['resultdata']['documentno'];
          MyDialog(context, "Succes", 'Update documentno $message succeeded', Status.SUCCESS).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });
          if(selectedDocStatus == "Completed"){
            setComplete();
          }
        } else {
          MyDialog(context, "Failed", res["message"], Status.ERROR).build(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });
        }
      }
    }
  }

  _updateLine(SoLine c)async{
    var ref = await SharedPreferences.getInstance();
    var user = User.fromJsonMap(jsonDecode(ref.getString(USER)));
    var url = "${ref.getString(BASE_URL)}$UPDATE_SOLINE";
    var myBody;
    if(c.idLine == null){
      myBody = {
        "crm_id": "0",
        "c_order_id": soParams.orderID.toString(),
        "ad_orgtrx_id": "0",
        "qty": c.qty.toString(),
        "priceentered": c.price.toString(),
        "m_product_id": c.productID.toString(),
        "c_uom_id": c.uomID.toString(),
        "c_tax_id": c.taxID.toString()
      };
    }else{
      myBody = {
        "crm_id": "0",
        "c_order_id": soParams.orderID.toString(),
        "ad_orgtrx_id": "0",
        "c_orderline_id": c.idLine.toString(),
        "qty": c.qty.toString(),
        "priceentered": c.price.toString(),
        "m_product_id": c.productID.toString(),
        "c_uom_id": c.uomID.toString(),
        "c_tax_id": c.taxID.toString()
      };
    }
    print("line param : $myBody");
    var response = await http.post(url, body: myBody, headers: {
      "Forca-Token": user.token
    }).catchError((err) {
      MyDialog(context, "Failed", err.toString(), Status.ERROR).build(() {
        Navigator.pop(context);
      });
    });
    if (response != null) {
      print("line result ${response.body}");
      var res = jsonDecode(response.body);
      if (res["codestatus"] == "S") {
        setState(() {
          lineNumber = res['resultdata']['line_number'];
          orderLineID = res['resultdata']['c_orderline_id'];
        });
        MyDialog(context, "Succes", res["message"], Status.SUCCESS).build(() {
          Navigator.pop(context);
          //Navigator.pop(context);
        });
      } else {
        if(res["message"] == "Error caused by : org.adempiere.exceptions.AdempiereException: Error: : NotAllowedZeroPrice"){
          MyDialog(context, "Failed", "check price at Line No ${c.lineNo}", Status.ERROR).build(() {
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

}
