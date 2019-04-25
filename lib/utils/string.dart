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
const LIST_BPARTNER = "/api/ws/master/v1/getBPartner";


const TITLE_STYLE = TextStyle(
    color: Colors.black,

  fontFamily: "Title",
  fontSize: 15.0
);

const SUBTITLE_STYLE = TextStyle(
  color: Colors.black,
  fontFamily: "Subtitle",
  fontSize: 12.0
);

// const BUTTON_THEME =   