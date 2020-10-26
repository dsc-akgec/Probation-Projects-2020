import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/components/project_others.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/explore_pages/add_project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Widget addProject() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (_) => AddProject()));
      },
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Working on something?',
              style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
            ),
            Text(
              'ADD HERE',
              style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: 'Explore', canSearch: true, context: context),
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: Unit.V_MARGIN),
              addProject(),
              SizedBox(height: 20),
              CustomDivider.zeroPaddingDividerGrey(),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Projects by other members',
                  style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGE),
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection(Config.PROJECT_COLLECTION).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot mypost = snapshot.data.documents[index];
                          String userPhoto = mypost.get(Config.PHOTO);
                          String projectName = mypost.get(Config.PROJECT_NAME);
                          String userName = mypost.get(Config.NAME);
                          String description = mypost.get(Config.PROJECT_DESCRIPTION);
                          String link = mypost.get(Config.PROJECT_LINK);
                          String tag = mypost.get(Config.PROJECT_TAG);

                          return ProjectOthers(
                            userPhoto: userPhoto,
                            projectName: projectName,
                            userName: userName,
                            description: description,
                            link: link,
                            tag: tag,
                            showDP: true,
                          );
                        });
                  } else {
                    return Text(
                      'No Posts yet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Unit.FONT_LARGE,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
