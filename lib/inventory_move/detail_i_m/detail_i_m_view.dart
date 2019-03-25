import 'package:flutter/material.dart';
import './detail_i_m_view_model.dart';
import 'package:forca_so/utils/string.dart';

class DetailIMView extends DetailIMViewModel {
  _body(){
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
                "Movement Date",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: "Title"
                ),
              ),
              Text(
                "01/08/2019",
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
                "PT. sahabat glmvn",
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
                "Document Type",
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
                "Shipper",
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
                "Delivery Via",
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
          Padding(padding: EdgeInsets.only(top:20.0)),
          Text("Inventory Move LINE",
              style: TextStyle(
                  fontFamily: "Title",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              )),
          Container(
            height: 170,
            child: Card(
              child: Container(padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                            "Product",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 15.0
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                            "Sement Gresik 5Kg",
                            style: TextStyle(
                                fontFamily: "Subtitle",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ), Padding(padding: EdgeInsets.only(top: 10.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                              "Locator From",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 15.0
                              ),
                              overflow: TextOverflow.ellipsis),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                            "tubanan",
                            style: TextStyle(
                                fontFamily: "Subtitle",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                              "Locator To",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 15.0
                              ),
                              overflow: TextOverflow.ellipsis),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                            "giri",
                            style: TextStyle(
                                fontFamily: "Subtitle",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,),
                        )
                      ],
                    ), Padding(padding: EdgeInsets.only(top: 10.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                              "Movement QTY",
                              style: TextStyle(
                                  fontFamily: "Title",
                                  fontSize: 15.0
                              ),
                              overflow: TextOverflow.ellipsis),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(
                            "10",
                            style: TextStyle(
                                fontFamily: "Subtitle",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                            ),textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,),
                        )
                      ],
                    ), Padding(padding: EdgeInsets.only(top: 10.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          child: OutlineButton(
                            onPressed: (){
                              _detail();
                            },child: Text(
                            "Detail",
                            style: TextStyle(fontFamily: "Title"),
                          ),),
                        )
                      ],
                    )
                  ],
                ),),
            ),
          )
        ],
      ),
    );
  }

  _detail() {
    showModalBottomSheet(context: context,
        builder: (context){
          return Container(
            height: 210.0,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 40.0,
                  child:Center(
                    child: Text(
                      "Detail Line",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Title",
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Product",
                            style: TextStyle(
                                fontFamily: "Title"
                            ),
                          ),Text("Semen Gresik 5Kg",
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Locator From",
                            style: TextStyle(
                                fontFamily: "Title"
                            ),),
                          Text("tubanan",
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Locator To",
                            style: TextStyle(
                                fontFamily: "Title"
                            ),),
                          Text("giri",
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),)
                        ],),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Movement QTY",
                            style: TextStyle(
                                fontFamily: "Title"
                            ),),
                          Text("10",
                            style: TextStyle(
                                fontFamily: "Title",
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),Padding(padding: EdgeInsets.only(top: 10.0)),
                    ],
                  ),
                )
              ],
            ),
          );});

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Inventory Move",
          style: TextStyle(fontFamily: "Title", fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }

}