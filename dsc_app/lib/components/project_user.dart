import 'package:dsc_app/components/project_tag.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/profile_pages/edit_project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectUser extends StatelessWidget {
  final String projectName;
  final String description;
  final String link;
  final String tag;
  final String docID;
  ProjectUser({this.projectName, this.description, this.link, this.tag, this.docID});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                projectName,
                style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => EditProject(
                                projectName: projectName,
                                description: description,
                                link: link,
                                tag: tag,
                                docID: docID,
                              )));
                },
                child: Text(
                  'EDIT',
                  style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            child: Text(
              description,
              style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
            ),
          ),
          SizedBox(height: link.length > 0 ? 5 : 0),
          link.length > 0
              ? Container(
                  child: Text(
                    link,
                    style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
                  ),
                )
              : SizedBox(),
          SizedBox(height: 15),
          tag.length > 0 ? ProjectTag(status: tag) : SizedBox(),
          SizedBox(height: 20),
          // CustomDivider.zeroPaddingDivider()
        ],
      ),
    );
  }
}
