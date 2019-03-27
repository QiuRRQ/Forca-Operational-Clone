import 'package:flutter/material.dart';
import './material_reciept_view_model.dart';
import './material_receipt_widget.dart';
import 'package:forca_so/utils/document_status.dart';
import 'add_material_receipt_screen/add_material_receipt_screen.dart';

class MaterialRecieptView extends MaterialRecieptViewModel{
    

    _body(){
      return Container(
        child: ListView.builder(
          itemCount: materialReceipts.length,
          itemBuilder: (c,i)=>MaterialReceiptWidget().item(context, DocumentStatus.DRAFTED),
        ),
      );
    }

    @override
  void initState() {
    super.setData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    // Replace this with your build function
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Material Receipt",style:TextStyle(fontFamily: "Title")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (c)=>AddMaterialReceiptScreen())),
        tooltip: "Add New Document",
        child: Icon(Icons.add),
      ),
      body: _body(),
    );
  }
}

