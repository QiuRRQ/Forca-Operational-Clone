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
const DETAIL_SO = "/api/ws/transaction/v1/getOrder";
const LIST_SALES_REP = "/api/ws/master/v1/getUser";
const LIST_PAYMENT_RULE = "/api/ws/master/v1/getPaymentRule";
const LIST_PRICE_LIST = "/api/ws/master/v1/getPricelist";
const CREATE_ORDER = "/api/ws/transaction/v1/setOrder";
const MATERIAL_RECEIPT = "/api/ws/transaction/v1/getInOutList";
const DETAIL_RECEIPT = "/api/ws/transaction/v1/getInOut";

const TITLE_STYLE =
    TextStyle(color: Colors.black, fontFamily: "Title", fontSize: 15.0);

const SUBTITLE_STYLE =
    TextStyle(color: Colors.black, fontFamily: "Subtitle", fontSize: 12.0);

// const BUTTON_THEME =
