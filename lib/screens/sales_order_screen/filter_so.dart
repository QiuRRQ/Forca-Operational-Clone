import 'package:flutter/material.dart';
import 'package:forca_so/master/select_date.dart';
import 'package:forca_so/utils/document_status.dart';
import 'package:forca_so/utils/forca_assets.dart';

class FilterSO extends StatefulWidget {
  final ValueChanged<FilterParam> onSelected;
  DocumentStatus documentStatus;
  String startDate = "Select Date";
  String endDate = "Select Date";

  FilterSO(this.documentStatus, this.startDate, this.endDate, this.onSelected);

  @override
  _FilterSOState createState() => _FilterSOState(onSelected);
}

class _FilterSOState extends State<FilterSO> {
  final ValueChanged<FilterParam> onSelected;

  _FilterSOState(this.onSelected);

  FilterParam filterParam = FilterParam();

  @override
  void initState() {
    filterParam.documentStatus = widget.documentStatus;
    filterParam.startDate = widget.startDate;
    filterParam.endDate = widget.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 40.0,
            color: Colors.blue,
            child: Center(
              child: forcaText("Filter",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  width: MediaQuery.of(context).size.width,
                  child: forcaText("Date Document", align: TextAlign.left),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      forcaText(filterParam.startDate,
                          color: Colors.black, fontWeight: FontWeight.bold),
                      IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            selectDate(context, (date) {
                              setState(() {
                                filterParam.startDate = date;
                              });
                            });
                          })
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  width: MediaQuery.of(context).size.width,
                  child: forcaText("End Date Document", align: TextAlign.left),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      forcaText(filterParam.endDate,
                          color: Colors.black, fontWeight: FontWeight.bold),
                      IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            selectDate(context, (date) {
                              setState(() {
                                filterParam.endDate = date;
                              });
                            });
                          })
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: forcaText("Document Status", align: TextAlign.left),
                ),
                Container(
                  child: DropdownButton<DocumentStatus>(
                    isExpanded: true,
                    value: filterParam.documentStatus,
                    items: DocumentStatus.values.map((docStatus) {
                      return DropdownMenuItem<DocumentStatus>(
                        value: docStatus,
                        child: forcaText(
                            docStatus
                                .toString()
                                .replaceAll("DocumentStatus.", ""),
                            fontSize: 12.0,
                            align: TextAlign.center,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      );
                    }).toList(),
                    onChanged: (status) {
                      setState(() {
                        filterParam.documentStatus = status;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          forcaButton(forcaText("Search Document", color: Colors.white), () {
            onSelected(
              filterParam,
            );
          },
              height: 45.0,
              margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
              color: Colors.blue)
        ],
      ),
    );
  }
}

class FilterParam{
  DocumentStatus documentStatus;
  String startDate;
  String endDate;
}