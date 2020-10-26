import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/material.dart';

class BirthdayPost extends StatelessWidget {
  final String name;
  final String date;
  final String message;
  BirthdayPost({@required this.name, this.date, this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(Unit.V_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.cake,
                        color: ColorPalette.YELLOW,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Happy Birthday',
                        style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorPalette.BLUE,
                        // backgroundImage: NetworkImage(photo),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Random Name",
                        style: TextStyle(color: ColorPalette.UNSELECTED_NAV_BAR),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          height: 70,
                          color: ColorPalette.YELLOW,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "dsc wishes you a a very happy birthday may you achieve all your goals in future ",
                            style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            /*
            GestureDetector(
              onTap: () {
                /*
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => Attendance()));
                */
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: ColorPalette.YELLOW,
                  ),
                  child: Text(
                    'SHOW',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),*/
          ],
        ));
  }
}
