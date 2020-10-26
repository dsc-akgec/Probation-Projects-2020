import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/explore_pages/profile_display_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchedProfileBox extends StatelessWidget {
  final String name;
  final String photo;
  final String section;
  final String year;
  final String uid;
  SearchedProfileBox({@required this.name, this.photo, this.section, this.uid, this.year})
      : assert(name != null && uid != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(photo),
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            name,
                            style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (_) => ProfileDisplayPage(uid : uid)));
                          },
                          child: Text(
                            'view profile',
                            style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        '$section, $year Year',
                        style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          CustomDivider.zeroPaddingDivider()
        ],
      ),
    );
  }
}
