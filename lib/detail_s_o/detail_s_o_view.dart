import 'package:flutter/material.dart';
import './detail_s_o_view_model.dart';
import 'package:forca_so/utils/string.dart';
import 'package:forca_so/create_s_o/widget_so.dart';
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
          Padding(padding: EdgeInsets.only(top:20.0)),
         Text("SO LINE",
         style: TextStyle(
           fontFamily: "Title",
           fontSize: 15.0,
           fontWeight: FontWeight.bold
         )),
         Container(
           height: 135,
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
                         "Semen Gresik 5Kg",
                         style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
                           fontWeight: FontWeight.bold
                         ),
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width / 2 - 30,
                       child: Text(
                           "Rp.50.000",
                       style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
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
                           "QTY",
                       style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold
                       ),
                       overflow: TextOverflow.ellipsis),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width / 2 - 30,
                       child: Text(
                         "10",
                         style: TextStyle(
                           fontFamily: "Title",
                           fontSize: 14.0,
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
                           "Discount",
                       style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold
                       ),
                       overflow: TextOverflow.ellipsis),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width / 2 - 30,
                       child: Text(
                           "10.000",
                       style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
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
                             //TODO: untuk handle press detail
                             showModalBottomSheet(context: context,
                                 builder: (context){
                               return Container(
                                 height: 270.0,
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
                                               Text("Price",
                                               style: TextStyle(
                                                 fontFamily: "Title"
                                               ),),
                                               Text("Rp.50.000",
                                               style: TextStyle(
                                                 fontFamily: "Title",
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.bold
                                               ),)
                                             ],
                                           ),Padding(padding: EdgeInsets.only(top: 10.0)),
                                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                                             Text("QTY",
                                             style: TextStyle(
                                               fontFamily: "Title"
                                             ),),
                                             Text("10",
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
                                               Text("Discount",
                                               style: TextStyle(
                                                 fontFamily: "Title"
                                               ),),
                                               Text("10.000",
                                               style: TextStyle(
                                                 fontFamily: "Title",
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.bold
                                               ),)
                                             ],
                                           ),Padding(padding: EdgeInsets.only(top: 10.0)),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: <Widget>[
                                               Text("UOM",
                                                 style: TextStyle(
                                                     fontFamily: "Title"
                                                 ),),
                                               Text("SAK",
                                                 style: TextStyle(
                                                     fontFamily: "Title",
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold
                                                 ),)
                                             ],
                                           ),Padding(padding: EdgeInsets.only(top: 10.0)),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: <Widget>[
                                               Text("TAX",
                                                 style: TextStyle(
                                                     fontFamily: "Title"
                                                 ),),
                                               Text("10.000",
                                                 style: TextStyle(
                                                     fontFamily: "Title",
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold
                                                 ),)
                                             ],
                                           ),Padding(padding: EdgeInsets.only(top: 10.0)),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: <Widget>[
                                               Text("Total",
                                                 style: TextStyle(
                                                     fontFamily: "Title"
                                                 ),),
                                               Text("Rp.500.000",
                                                 style: TextStyle(
                                                     fontFamily: "Title",
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold
                                                 ),)
                                             ],
                                           )
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               );});
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
