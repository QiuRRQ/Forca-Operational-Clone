import 'package:flutter/material.dart';
import 'package:forca_so/models/im_line/im_line.dart';

class WidgetIMLine{
 static lineItem(BuildContext context,IMLine line){
   return Container(
     height: 180.0,
     child: Card(
       child: Container(
         padding: EdgeInsets.all(8.0),
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
                         fontWeight: FontWeight.bold),
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width / 2 - 30,
                   child: Text(
                     "Rp. 50.000",
                     style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     textAlign: TextAlign.end,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
               ],
             ),
             Padding(padding: EdgeInsets.only(top: 10.0)),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: MediaQuery.of(context).size.width / 2 - 30,
                   child: Text(
                     "Locator From",
                     style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width / 2 - 30,
                   child: Text(
                     "tubanan",
                     style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     textAlign: TextAlign.end,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
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
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width / 2 - 30,
                   child: Text(
                     "giri",
                     style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     textAlign: TextAlign.end,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
               ],
             ),
             Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: MediaQuery.of(context).size.width / 2 - 30,
                   child: Text(
                     "Movement QTY",
                     style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width / 2 - 30,
                   child: Text(
                     "10",
                     style: TextStyle(
                         fontFamily: "Title",
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold),
                     textAlign: TextAlign.end,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
               ],
             ),
             Padding(padding: EdgeInsets.only(top: 10.0)),
           ],
         ),
       ),
     ),
   );
 }
 static addLine(BuildContext context, ValueChanged<IMLine> addLine) {
   showModalBottomSheet(
     context: context,
     builder: (c) => Container(
       padding: EdgeInsets.only(bottom: 20.0),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           Container(
             padding: EdgeInsets.only(left: 16.0),
             height: 40.0,
             color: Colors.blue,
             child: Center(
               child: Text(
                 "Add IM Line",
                 style: TextStyle(
                     color: Colors.white,
                     fontFamily: "Title",
                     fontWeight: FontWeight.bold,
                     fontSize: 17.0),
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
             child: Column(
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width / 2 - 30,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(
                             "Product",
                             style: TextStyle(
                                 fontFamily: "Title",
                                 fontSize: 15.0,
                                 fontWeight: FontWeight.bold),
                           ),
                           Row(
                             mainAxisAlignment:
                             MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Text(
                                 'Select Product',
                                 style: TextStyle(
                                   fontFamily: "Title",
                                   fontSize: 14.0,
                                 ),
                               ),
                               IconButton(
                                   icon: Icon(Icons.expand_more),
                                   onPressed: () {}),
                             ],
                           ),
                           Container(
                             height: 1.0,
                             color: Colors.grey[600],
                           ),
                         ],
                       ),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width / 2 - 30,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,
                         children: <Widget>[
                           Text(
                             "Locator From",
                             style: TextStyle(
                                 fontFamily: "Title",
                                 fontSize: 15.0,
                                 fontWeight: FontWeight.bold),
                           ),
                           Row(
                             mainAxisAlignment:
                             MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Text(
                                 'Select Locator From',
                                 style: TextStyle(
                                   fontFamily: "Title",
                                   fontSize: 14.0,
                                 ),
                               ),
                               IconButton(
                                   icon: Icon(Icons.expand_more),
                                   onPressed: () {}),
                             ],
                           ),
                           Container(
                             height: 1.0,
                             color: Colors.grey[600],
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
           Padding(padding: EdgeInsets.only(top: 20.0)),
           Container(
             margin: EdgeInsets.only(right: 16.0, left: 16.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Text(
                       "Locator To",
                       style: TextStyle(
                           fontFamily: "Title",
                           fontWeight: FontWeight.bold,
                           fontSize: 14.0),
                     ),
                     Container(
                         width: MediaQuery.of(context).size.width / 2 - 30,
                         child: TextField(
                           style: TextStyle(
                               fontFamily: "Title",
                               color: Colors.black,
                               fontSize: 14.0),
                           decoration: InputDecoration(
                               hintText: 'Enter Locator To'),
                         ))
                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Text(
                       "Movement QTY",
                       style: TextStyle(
                           fontFamily: "Title",
                           fontWeight: FontWeight.bold,
                           fontSize: 14.0),
                     ),
                     Container(
                         width: MediaQuery.of(context).size.width / 2 - 30,
                         child: TextField(
                           style: TextStyle(
                               fontFamily: "Title",
                               color: Colors.black,
                               fontSize: 14.0),
                           decoration: InputDecoration(
                               hintText: 'Enter Movement QTY of product'),
                         ))
                   ],
                 ),
               ],
             ),
           ),
           Padding(padding: EdgeInsets.only(top: 20.0)),
           Container(
               width: MediaQuery.of(context).size.width / 2,
               child: RaisedButton(
                 onPressed: () {
                   addLine(IMLine());
                 },
                 child: Text(
                   "Save",
                   style: TextStyle(
                       fontFamily: "Title",
                       color: Colors.white,
                       fontSize: 17.0),
                 ),
                 color: Colors.green,
               )),
         ],
       ),
     ),
   );
 }
}