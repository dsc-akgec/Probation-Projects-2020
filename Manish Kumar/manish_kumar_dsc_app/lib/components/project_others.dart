import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/components/project_tag.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/material.dart';

class ProjectOthers extends StatelessWidget {
  final String userPhoto;
  final String projectName;
  final String userName;
  final String description;
  final String link;
  final String tag;
  final bool showDP;
  ProjectOthers({
    this.userPhoto,
    @required this.projectName,
    @required this.userName,
    @required this.description,
    this.link,
    this.tag,
    this.showDP = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                showDP
                    ? CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(userPhoto),
                        backgroundColor: Colors.red,
                      )
                    : SizedBox(),
                showDP ? SizedBox(width: 10) : SizedBox(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              projectName,
                              style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            link.length > 0 ? 'Github' : '',
                            style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description,
                          style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            tag.length > 0 ? ProjectTag(status: tag) : SizedBox(),
            showDP ? SizedBox(height: 20) : SizedBox(),
            showDP ? CustomDivider.zeroPaddingDivider() : SizedBox()
          ],
        ),
      ),
    );
  }
}
