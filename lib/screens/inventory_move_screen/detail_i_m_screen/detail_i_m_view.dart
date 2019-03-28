import 'package:flutter/material.dart';
import 'package:forca_so/screens/inventory_move_screen/detail_i_m_screen/detail_i_m_view_model.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/utils/forca.dart';

class DetailIMView extends DetailIMViewModel{
//  _body(){
//    return Container(
//      margin: EdgeInsets.all(16.0),
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Image.asset(LOGO,
//            width: 110,),
//          Padding(padding: EdgeInsets.only(top: 20.0)),
//          Container(
//            margin: EdgeInsets.only(top: 16.0),
//          ),
//          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                DOC_NUMBER, style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 15.0,
//                  fontFamily: "Title"
//              ),
//              ),
//              Text(
//                "133456", style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 15.0,
//                  fontFamily: "Subtitle",
//                  fontWeight: FontWeight.bold
//              ),
//              )
//            ],),Divider(),
//          Padding(padding: EdgeInsets.only(top: 10.0)),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Movement Date",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Title"
//                ),
//              ),
//              Text(
//                "01/08/2019",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Subtitle",
//                    fontWeight: FontWeight.bold
//                ),)
//            ],
//          ),Divider(),
//          Padding(padding: EdgeInsets.only(top: 10.0)),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Business Partner",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 15.0,
//                  fontFamily: "Title",
//                ),
//              ),
//              Text(
//                "PT. sahabat glmvn",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Subtitle",
//                    fontWeight: FontWeight.bold
//                ),
//              )
//            ],
//          ),Divider(),
//          Padding(padding: EdgeInsets.only(top: 10.0)),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Document Type",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15,
//                    fontFamily: "Title"
//                ),
//              ),
//              Text(
//                "",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Subtitile",
//                    fontWeight: FontWeight.bold
//                ),
//              )
//            ],
//          ),Divider(),
//          Padding(padding: EdgeInsets.only(top: 10.0)),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Sale Ref",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Title"
//                ),
//              ),Text(
//                "",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Subtitle",
//                    fontWeight: FontWeight.bold
//                ),
//              )
//            ],
//          ),Divider(),
//          Padding(padding: EdgeInsets.only(top: 10.0)),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Shipper",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Title"
//                ),
//              ),
//              Text(
//                "",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Subtitle",
//                    fontWeight: FontWeight.bold
//                ),
//              )
//            ],
//          ),Divider(),
//          Padding(padding: EdgeInsets.only(top:10.0)),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Delivery Via",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Title"
//                ),
//              ),Text(
//                "",
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 15.0,
//                    fontFamily: "Subtitle",
//                    fontWeight: FontWeight.bold
//                ),)
//            ],
//          ),Divider(),
//          Padding(padding: EdgeInsets.only(top:20.0)),
//          Text("Inventory Move LINE",
//              style: TextStyle(
//                  fontFamily: "Title",
//                  fontSize: 15.0,
//                  fontWeight: FontWeight.bold
//              )),
//          Container(
//            height: 170,
//            child: Card(
//              child: Container(padding: EdgeInsets.all(8.0),
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                            "Product",
//                            style: TextStyle(
//                                fontFamily: "Title",
//                                fontSize: 15.0
//                            ),
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                            "Sement Gresik 5Kg",
//                            style: TextStyle(
//                                fontFamily: "Subtitle",
//                                fontSize: 15.0,
//                                fontWeight: FontWeight.bold
//                            ),
//                            textAlign: TextAlign.end,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ), Padding(padding: EdgeInsets.only(top: 10.0)),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                              "Locator From",
//                              style: TextStyle(
//                                  fontFamily: "Title",
//                                  fontSize: 15.0
//                              ),
//                              overflow: TextOverflow.ellipsis),
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                            "tubanan",
//                            style: TextStyle(
//                                fontFamily: "Subtitle",
//                                fontSize: 15.0,
//                                fontWeight: FontWeight.bold
//                            ),
//                            textAlign: TextAlign.end,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ),
//                    Padding(padding: EdgeInsets.only(top: 10.0)),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                              "Locator To",
//                              style: TextStyle(
//                                  fontFamily: "Title",
//                                  fontSize: 15.0
//                              ),
//                              overflow: TextOverflow.ellipsis),
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                            "giri",
//                            style: TextStyle(
//                                fontFamily: "Subtitle",
//                                fontSize: 15.0,
//                                fontWeight: FontWeight.bold
//                            ),textAlign: TextAlign.end,
//                            overflow: TextOverflow.ellipsis,),
//                        )
//                      ],
//                    ), Padding(padding: EdgeInsets.only(top: 10.0)),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                              "Movement QTY",
//                              style: TextStyle(
//                                  fontFamily: "Title",
//                                  fontSize: 15.0
//                              ),
//                              overflow: TextOverflow.ellipsis),
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width / 2 - 30,
//                          child: Text(
//                            "10",
//                            style: TextStyle(
//                                fontFamily: "Subtitle",
//                                fontSize: 15.0,
//                                fontWeight: FontWeight.bold
//                            ),textAlign: TextAlign.end,
//                            overflow: TextOverflow.ellipsis,),
//                        )
//                      ],
//                    ), Padding(padding: EdgeInsets.only(top: 10.0)),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Container(
//                          height: 30.0,
//                          child: OutlineButton(
//                            onPressed: (){
//                              _detail();
//                            },child: Text(
//                            "Detail",
//                            style: TextStyle(fontFamily: "Title"),
//                          ),),
//                        )
//                      ],
//                    )
//                  ],
//                ),),
//            ),
//          )
//        ],
//      ),
//    );
//  }
  _body(){
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(title:
        Forca.forcaTitle("Inventory Move",color: Colors.white,weight: FontWeight.bold, size: 20.0),),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(margin: EdgeInsets.all(30.0),
            child: Column(mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(LOGO,width: 110,),
              Padding(padding: EdgeInsets.only(top:20.0),),
              Container(margin: EdgeInsets.only(top: 16.0),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 Forca.forcaTitle("Doc number",size: 15.0,color: Colors.black),
                  Forca.forcaSubtitle("123456",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],),Divider(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Forca.forcaTitle("Movement Date",size: 15.0,color: Colors.black),
                 Forca.forcaSubtitle("01/08/2019",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],
              ),Divider(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 Forca.forcaTitle("Business Partner",size: 15.0,color: Colors.black),
                  Forca.forcaSubtitle("Pt. kawan kawanan",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],
              ),Divider(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Forca.forcaTitle("Document Type",size: 15.0,color: Colors.black),
                Forca.forcaSubtitle("",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],
              ),Divider(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Forca.forcaTitle("Sale Ref",size: 15.0,color: Colors.black),
                  Forca.forcaSubtitle("",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],
              ),Divider(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 Forca.forcaTitle("Shipper",size: 15.0,color: Colors.black),
                  Forca.forcaSubtitle("",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],
              ),Divider(),
              Padding(padding: EdgeInsets.only(top:10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 Forca.forcaTitle("Delivery Via",size: 15.0,color: Colors.black),
                 Forca.forcaSubtitle("",size: 15.0,color: Colors.black,weight: FontWeight.bold)
                ],
              ),Divider(),
              Padding(padding: EdgeInsets.only(top:20.0)),
              Forca.forcaTitle("Inventory Move Line",size: 15.0,color: Colors.black,weight: FontWeight.bold,),
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
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child:
                              Forca.forcaTitle("Product",size: 15.0,color: Colors.black,textoverflow: TextOverflow.ellipsis),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child: 
                              Forca.forcaSubtitle("Semen Gresik 5Kg",size: 15.0,weight: FontWeight.bold,color: Colors.black,align: TextAlign.end),
                            )
                          ],
                        ), Padding(padding: EdgeInsets.only(top: 10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child: 
                              Forca.forcaTitle("Locator From",size: 15.0,color: Colors.black,textoverflow: TextOverflow.ellipsis),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child:
                              Forca.forcaSubtitle("tubanan",size: 15.0,color: Colors.black,weight: FontWeight.bold,align: TextAlign.end),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child:
                              Forca.forcaTitle("Locator To",size: 15.0,color: Colors.black,textoverflow: TextOverflow.ellipsis),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child: 
                              Forca.forcaSubtitle("giri",size: 15.0,color: Colors.black,weight: FontWeight.bold,align: TextAlign.end),
                            )
                          ],
                        ), Padding(padding: EdgeInsets.only(top: 10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 100,
                              child: 
                              Forca.forcaTitle("Movement QTY",size: 15.0,color: Colors.black,textoverflow: TextOverflow.ellipsis),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 80,
                              child: 
                              Forca.forcaSubtitle("10",size: 15.0,color: Colors.black,weight: FontWeight.bold,align: TextAlign.end),
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
                                },child:
                              Forca.forcaTitle("Detail",color: Colors.black,size: 12.0),),
                            )
                          ],
                        )
                      ],
                    ),),
                ),
              )
            ],),)
          ]),
        )
      ],
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
                    child:
                    Forca.forcaTitle("Detail Line",color: Colors.white,size: 18.0,weight: FontWeight.bold),
                  ),),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Forca.forcaTitle("Product",color: Colors.black,size: 14.0),
                          Forca.forcaSubtitle("Semen Gresik 5Kg", color: Colors.black,size: 14.0,weight: FontWeight.bold,align: TextAlign.end)
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Forca.forcaTitle("Locator From",color: Colors.black,size: 14.0),
                          Forca.forcaSubtitle("tubanan", color: Colors.black,size: 14.0,weight: FontWeight.bold,align: TextAlign.end
                          )],
                      ),Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Forca.forcaTitle("Locator To",color: Colors.black,size: 14.0),
                          Forca.forcaSubtitle("giri", color: Colors.black,size: 14.0,weight: FontWeight.bold,align: TextAlign.end)
                        ],),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Forca.forcaTitle("Movemenet QTY",color: Colors.black,size: 14.0),
                          Forca.forcaSubtitle("10", color: Colors.black,size: 14.0,weight: FontWeight.bold,align: TextAlign.end)
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
    body: _body(),
    );
  }


}