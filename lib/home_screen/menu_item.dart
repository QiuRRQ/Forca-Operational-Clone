import 'package:flutter/material.dart';
import 'package:forca_so/utils/text_widget.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final navigator;

  MenuItem(this.title, this.description, this.icon, this.navigator);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.navigator,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 100,
        height: MediaQuery.of(context).size.width / 2 - 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(widget.icon),
            subTitle(widget.title),
            subTitle(widget.description)
          ],
        ),
      ),
    );
  }
}
