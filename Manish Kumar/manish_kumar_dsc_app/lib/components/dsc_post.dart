import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/material.dart';

class DscPost extends StatelessWidget {
  final title;
  final message;
  final issueDate;
  DscPost({@required this.title, @required this.message, this.issueDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(Unit.V_MARGIN),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorPalette.BLUE,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              Text(
                issueDate,
                style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration:
                      new BoxDecoration(border: new Border(right: new BorderSide(width: 1.0, color: Colors.white))),
                  child: Icon(Icons.featured_video, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
