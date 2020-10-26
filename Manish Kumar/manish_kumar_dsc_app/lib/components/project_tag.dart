import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/material.dart';

class ProjectTag extends StatelessWidget {
  final status;
  Color color;
  ProjectTag({@required this.status}) {
    if (status == 'published') {
      color = ColorPalette.GREEN;
    } else if (status == 'working') {
      color = ColorPalette.BLUE;
    } else if (status == 'in review') {
      color = ColorPalette.YELLOW;
    } else {
      color = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: color,
      ),
      child: Text(
        status,
        style: TextStyle(color: Colors.white, fontSize: Unit.FONT_SMALL),
      ),
    );
  }
}
