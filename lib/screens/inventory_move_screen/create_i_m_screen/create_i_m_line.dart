import 'package:flutter/material.dart';
import 'package:forca_so/models/inventory_move/create_inventory_move/list_line.dart';
import 'package:forca_so/models/locator/locator.dart';
import 'package:forca_so/models/product/product.dart';
import 'package:forca_so/models/uom/uom.dart';
import 'package:forca_so/screens/inventory_move_screen/create_i_m_screen/product.dart';
import 'package:forca_so/utils/forca_assets.dart';

class CreateIMLine extends StatefulWidget {
  final ValueChanged<ListLine> line;
  final List<Locator> listLocator;
  final ListLine lineItem;

  CreateIMLine(this.listLocator, this.line,[this.lineItem]);
  @override
  _CreateIMLineState createState() => _CreateIMLineState(listLocator,line,lineItem);
}

class _CreateIMLineState extends State<CreateIMLine> {
  Product selectedProduct = Product();
  Locator selectedLocatorFrom = Locator();
  Locator selectedLocatorTo = Locator();
  Uom selectedUOM = Uom();
  List<Uom> listUom = List();
  ListLine lineItem;
 final ValueChanged<ListLine> line;
 bool _onChangeProduct = false;
 bool _onChangeUom = false;

  final List<Locator> listLocator;
  ListLine myLine = ListLine();
  var productController, movementQtyController, uomController;

  _CreateIMLineState(this.listLocator, this.line,this.lineItem);

  setLine() {
    myLine.line_number = null ?? "";
    _onChangeProduct ? myLine.m_product_id = int.parse(selectedProduct.productID) :"";
    _onChangeProduct ? myLine.productName = selectedProduct.name : "";
    _onChangeUom ? myLine.UomName = selectedUOM.name : "";
    _onChangeUom ?  myLine.forca_c_uom_id = int.parse(selectedUOM.uomID) : "";
    myLine.locatorFrom = selectedLocatorFrom.locator_name;
    myLine.m_locator_id = int.parse(selectedLocatorFrom.m_locator_id);
    myLine.m_locatorto_id = int.parse(selectedLocatorTo.m_locator_id);
    myLine.locatorTo = selectedLocatorTo.locator_name;
    movementQtyController.text.isNotEmpty ? myLine.forca_qtyentered = int.parse(movementQtyController.text.toString()) :"";
  }

  _initEditLine(){
   myLine.idLine = lineItem.idLine;
   myLine.m_locator_id = lineItem.m_locator_id;
   myLine.m_locatorto_id = lineItem.m_locatorto_id;
   listLocator.forEach((g)=>int.parse(g.m_locator_id) == lineItem.m_locator_id ? selectedLocatorFrom = g : "");
   listLocator.forEach((t)=>int.parse(t.m_locator_id)== lineItem.m_locatorto_id ? selectedLocatorTo = t : "");
   myLine.locatorFrom = lineItem.locatorFrom;
   myLine.locatorTo = lineItem.locatorTo;
   myLine.productName = lineItem.productName;
   myLine.m_product_id = lineItem.m_product_id;
   myLine.forca_qtyentered = lineItem.forca_qtyentered;
//   myLine.movementqty = lineItem.movementqty;
   myLine.UomName = lineItem.UomName;
   myLine.forca_c_uom_id = lineItem.forca_c_uom_id;
  }

  @override
  void initState() {
    // TODO: implement initState

    if(lineItem != null){
      _initEditLine();
    } else{
      selectedLocatorFrom = listLocator[0];
      selectedLocatorTo = listLocator[0];
    }
    productController = TextEditingController();
    movementQtyController = TextEditingController();
    uomController = TextEditingController();
    super.initState();
  }

  _showProducts() {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              content: SelectProduct((product) {
                setState(() {
                  selectedProduct = product;
                  _onChangeProduct = true;
                  productController.text = selectedProduct.name;
                  print(selectedProduct.productID);
                  listUom.clear();
                  listUom.addAll(selectedProduct.uom);
                  listUom.addAll(selectedProduct.uomConversion);
                  uomController.text =
                      listUom.isEmpty ? '' : listUom[0].realName;
                  selectedUOM = listUom.isEmpty ? Uom() : listUom[0];
                  _onChangeUom = true;
                  Navigator.pop(context);
                });
              }),
            ));
  }

  _selectUOM() {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: forcaText("Select UOM",
                          color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, i) => InkWell(
                            onTap: () {
                              setState(() {
                                _onChangeUom = true;
                                uomController.text = listUom[i].realName;
                                selectedUOM = listUom[i];
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              height: 35.0,
                              color:
                                  i % 2 == 0 ? Colors.white : Colors.grey[300],
                              child: Center(
                                child: forcaText(listUom[i].realName),
                              ),
                            ),
                          ),
                      itemCount: listUom.length,
                    ),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    color: Colors.blue[600],
                    child: Center(
                      child: forcaText(widget.lineItem == null ?"Create IM Line" : "Edit IM Line", color: Colors.white),
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
                                  TextField(
                                    controller: productController,
                                    decoration: InputDecoration(
                                        hintText:lineItem == null ? "Select Product" : lineItem.productName,
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onPressed: () => _showProducts())),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Locator From",
                                    style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<Locator>(
                                    value: selectedLocatorFrom,
                                    hint: Text("Selected Locator From"),
                                    items: listLocator.map((locator) {
                                      return DropdownMenuItem(
                                        child: Text(locator.locator_name),
                                        value: locator,
                                      );
                                    }).toList(),
                                    onChanged: (newLocator) {
                                      setState(() {
                                        selectedLocatorFrom = newLocator;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
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
                                    "Locator To",
                                    style: TextStyle(
                                      fontFamily: "Title",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<Locator>(
                                    value: selectedLocatorTo,
                                    hint: Text("Selected Locator To"),
                                    items: listLocator.map((locator) {
                                      return DropdownMenuItem(
                                        child: Text(locator.locator_name),
                                        value: locator,
                                      );
                                    }).toList(),
                                    onChanged: (newLocator) {
                                      setState(() {
                                        selectedLocatorTo = newLocator;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Movement Qty",
                                    style: TextStyle(
                                        fontFamily: "Title",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: movementQtyController,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: "Title"),
                                      decoration: InputDecoration(
                                        hintText: lineItem ==  null ?"Enter movement qty" : lineItem.forca_qtyentered.toString(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Colors.grey[600],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "UOM",
                          style: TextStyle(
                              fontFamily: "Title",
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: TextField(
                            controller: uomController,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: "Title"),
                            decoration: InputDecoration(
                                hintText: lineItem == null ? "Select UOM" : lineItem.UomName,
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_drop_down),
                                    onPressed: () => _selectUOM())),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: 20.0,
                  )),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RaisedButton(
                      onPressed: () {
                        try {
                          setLine();
                          line(myLine);
                        } catch (exception) {
                          print("eception ${exception.toString()}");
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: "Title",
                            color: Colors.white,
                            fontSize: 17.0),
                      ),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
