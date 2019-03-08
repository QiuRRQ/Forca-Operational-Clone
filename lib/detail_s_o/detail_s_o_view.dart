import 'package:flutter/material.dart';
import './detail_s_o_view_model.dart';
import 'package:forca_so/utils/string.dart';
class DetailSOView extends DetailSOViewModel {
  _body() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        Image.asset(LOGO,
          width: 110,),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            margin: EdgeInsets.only(top: 16.0),
          ),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            DOC_NUMBER, style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontFamily: "Title"
          ),
          ),
          Text(
            "133456", style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontFamily: "Subtitle",
              fontWeight: FontWeight.bold
          ),
          )
        ],),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Nominal",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title"
                ),
              ),
              Text(
                "Rp. 300.000.00",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontFamily: "Subtitle",
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Business Partner",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title",
                ),
              ),
              Text(
                "PT. Cong Fandi",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitle",
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "WareHouse",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Title"
                ),
              ),
              Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitile",
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Sale Ref",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title"
                ),
              ),Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitle",
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Price List",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title"
                ),
              ),
              Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitle",
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top:10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Payment Rule",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title"
                ),
              ),Text(
                  "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontFamily: "Subtitle",
                fontWeight: FontWeight.bold
              ),)
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Product",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title"
                ),
              ),Text(
                "Semen Gresik 5Kg",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitle",
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Qty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title"
                ),
              ),Text(
                "10",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitle",
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),Divider(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Discount",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Title",
                ),
              ),Text(
                "10.000",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Subtitle",
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail SO",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }
}
