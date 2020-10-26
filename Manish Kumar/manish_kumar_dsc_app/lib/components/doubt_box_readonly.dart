import 'package:flutter/material.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';

class DoubtBoxReadOnly extends StatelessWidget {
  String name;
  String title;
  List answers;
  DoubtBoxReadOnly({@required this.name, @required this.answers, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25,
              color: ColorPalette.BLUE_NORMAL,
              width: 5,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            name,
            style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        for (int i = 0; i < answers.length; i++)
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  color: ColorPalette.YELLOW,
                  width: 5,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    answers[i],
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(height: 10),
      ],
    ));
  }
}
