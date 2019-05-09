import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:forca_so/utils/forca_assets.dart';

selectDate(BuildContext context, ValueChanged<String> onDateSelected) {
  var now = new DateTime.now();
  DatePicker.showDatePicker(
    context,
    showTitleActions: true,
    locale: 'i18n',
    minYear: now.year - 10,
    maxYear: now.year,
    initialYear: now.year,
    initialMonth: now.month,
    initialDate: now.day,
    cancel: forcaText("Cancel",
        color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17.0),
    confirm: forcaText("Done",
        color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17.0),
    dateFormat: 'yyyy-mm-dd',
    onChanged: (year, month, date) {},
    onConfirm: (year, month, date) {
      onDateSelected("$year-$month-$date");
    },
    onCancel: () {},
  );
}
