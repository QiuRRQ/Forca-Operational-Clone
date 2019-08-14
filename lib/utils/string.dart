import 'package:flutter/material.dart';

const String APP_NAME = "Forca SO";
const String APP_VERSION_NAME = "Alpha 1.0.0";
const String APP_VERSION_CODE = "1";
const String LOGO = 'assets/images/logo_forca.png';
const String DOC_NUMBER = "Doc Number";

//database
const USER = "USER";
const BASE_URL = "BASE_URL";

//API
const LOGIN = "/api/ws/authentication/v1/login";
const LIST_SO = "/api/ws/transaction/v1/getOrderList";
const LIST_WAREHOUSE = "/api/ws/master/v1/getWarehouse";
const LIST_B_PARTNER = "/api/ws/master/v1/getBPartner";
const LIST_PRODUCT = "/api/ws/master/v1/getProduct";
const LIST_UOM = "/api/ws/master/v1/getUom";
const LIST_TAX = "/api/ws/master/v1/getTax";
const LIST_LOCATOR = "/api/ws/master/v1/getLocator";
const DETAIL_SO = "/api/ws/transaction/v1/getOrder";
const ORDER_LINE = "/api/ws/transaction/v1/getOrderLine";
const LIST_SALES_REP = "/api/ws/master/v1/getUser";
const LIST_PAYMENT_RULE = "/api/ws/master/v1/getPaymentRule";
const LIST_PRICE_LIST = "/api/ws/master/v1/getPricelist";
const CREATE_ORDER = "/api/ws/transaction/v1/setOrder";
const UPDATE_SOLINE = "/api/ws/transaction/v1/setOrderLine";
const DEL_SOLINE = "/api/ws/transaction/v1/deleteOrderLine";
const SET_SOCOMPLETE = "/api/ws/transaction/v1/setOrderComplete";
const DEL_ORDER = "/api/ws/transaction/v1/deleteOrder";
const CREATE_INOUT = "/api/ws/transaction/v1/setInOut";
const CREATE_INOUTLINE = "/api/ws/transaction/v1/setInOutLine";
const DEL_INOUT = "/api/ws/transaction/v1/deleteInOut";
const DEL_INOUTLINE = "/api/ws/transaction/v1/deleteInOutLine";
const DOC_COMPLETED_MR ="/api/ws/transaction/v1/setInOutComplete";
const MATERIAL_RECEIPT = "/api/ws/transaction/v1/getInOutList";
const DETAIL_RECEIPT = "/api/ws/transaction/v1/getInOut";
const LIST_IM = "/api/ws/transaction/v1/getInventoryMoveList";
const DETAIL_IM = "/api/ws/transaction/v1/getInventoryMove";
const LOCATOR = "/api/ws/master/v1/getLocator";
const CREATE_IM ="/api/ws/transaction/v1/setInventoryMove";
const DOC_COMPLETED_IM ="/api/ws/transaction/v1/setInventoryMoveComplete";
const LINE_IM ="/api/ws/transaction/v1/getInventoryMoveLine";
const SET_IM_LINE ="/api/ws/transaction/v1/setInvetoryMoveLine";
const DELETE_IM ="/api/ws/transaction/v1/deleteInventoryMove";
const DELETE_IM_LINE ="/api/ws/transaction/v1/deleteInventoryMoveLine";
const TITLE_STYLE =
TextStyle(color: Colors.black, fontFamily: "Title", fontSize: 15.0);

const SUBTITLE_STYLE =
TextStyle(color: Colors.black, fontFamily: "Subtitle", fontSize: 12.0);

// const BUTTON_THEME =
