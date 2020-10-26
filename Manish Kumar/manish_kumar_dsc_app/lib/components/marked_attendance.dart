import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/material.dart';

class MarkedAttendance extends StatelessWidget {
  final bool isPresent;
  final date;
  MarkedAttendance({@required this.isPresent, this.date}) : assert(isPresent != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(Unit.V_MARGIN),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorPalette.UNSELECTED_NAV_BAR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                date,
                style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
              ),
              SizedBox(height: 5),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.access_time, color: Colors.white),
                    ),
                    SizedBox(width: 7),
                    Text(
                      '6.00 - 6.30 PM',
                      style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isPresent ? ColorPalette.GREEN : ColorPalette.RED,
            ),
            child: Text(
              isPresent ? 'P' : 'A',
              style: TextStyle(fontSize: Unit.FONT_HEADING, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
