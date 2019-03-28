import 'package:flutter/material.dart';
import 'package:forca_so/models/im_line/im_line.dart';

class WidgetIMLine{
 static lineItem(BuildContext context,IMLine line,ValueChanged<IMLine> detail,ValueChanged<IMLine> edit,
 ValueChanged<IMLine> delete){
   return Container(
     height: 170.0,
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
                     "Prooduct",
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
                     "Semen Gresik 5 Kg",
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
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   height: 30.0,
                   child: OutlineButton(onPressed: (){
                     detail(line);
                   },
                   child: Text(
                     "Detail",
                     style: TextStyle(fontFamily: "Title",),
                   ),),
                 ),
                 Row(
                   children: <Widget>[
                     Container(
                       width: 75.0,
                       height: 30.0,
                       child: OutlineButton(
                         onPressed: () {
                           edit(line);
                         },
                         child: Text(
                           "Edit",
                           style: TextStyle(fontFamily: "Title"),
                         ),
                       ),
                     ),
                     Padding(padding: EdgeInsets.only(right: 10.0)),
                     Container(
                       width: 75.0,
                       height: 30.0,
                       child: RaisedButton(
                         color: Colors.red,
                         onPressed: () {
                          delete(line);
                         },
                         child: Text(
                           "Delete",
                           style: TextStyle(
                               fontFamily: "Title", color: Colors.white),
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             )
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
 static detailLine(BuildContext context,IMLine line){
   showModalBottomSheet(context: context , builder: (c){
     return Container(
       height: 210.0,
       child: Column(
         children: <Widget>[
           Container(
             color: Colors.blue,
             height: 40.0,
             child: Center(
               child: Text(
                 "Detail Line",
                 style: TextStyle(
                     color: Colors.white,
                     fontFamily: "Title",
                     fontSize: 17.0,
                     fontWeight: FontWeight.bold),
               ),
             ),
           ),
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
                         fontFamily: "Title",
                       ),
                     ),
                     Text(
                       "Semen Gresik 5Kg",
                       style: TextStyle(
                           fontFamily: "Title",
                           color: Colors.black,
                           fontWeight: FontWeight.bold),
                     ),
                   ],
                 ),
                 Padding(padding: EdgeInsets.only(top: 10.0)),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       "Locator From",
                       style: TextStyle(
                         fontFamily: "Title",
                       ),
                     ),
                     Text(
                       "tubanan",
                       style: TextStyle(
                           fontFamily: "Title",
                           color: Colors.black,
                           fontWeight: FontWeight.bold),
                     ),
                   ],
                 ),
                 Padding(padding: EdgeInsets.only(top: 10.0)),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       "Locator To",
                       style: TextStyle(
                         fontFamily: "Title",
                       ),
                     ),
                     Text(
                       "giri",
                       style: TextStyle(
                           fontFamily: "Title",
                           color: Colors.black,
                           fontWeight: FontWeight.bold),
                     ),
                   ],
                 ),
                 Padding(padding: EdgeInsets.only(top: 10.0)),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       "Movement QTY",
                       style: TextStyle(
                         fontFamily: "Title",
                       ),
                     ),
                     Text(
                       "10",
                       style: TextStyle(
                           fontFamily: "Title",
                           color: Colors.black,
                           fontWeight: FontWeight.bold),
                     ),
                   ],
                 ),
                 Padding(padding: EdgeInsets.only(top: 10.0)),
               ],
             ),
           ),
         ],
       ),
     );
   });

 }
 static editLine(BuildContext context,ValueChanged<IMLine> addLine){
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
                 "Edit IM Line",
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