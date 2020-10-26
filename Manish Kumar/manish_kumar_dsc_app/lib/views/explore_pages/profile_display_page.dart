import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/components/project_others.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDisplayPage extends StatefulWidget {
  final uid;
  ProfileDisplayPage({@required this.uid});

  @override
  _ProfileDisplayPageState createState() => _ProfileDisplayPageState();
}

class _ProfileDisplayPageState extends State<ProfileDisplayPage> {
  String name;
  String bio;
  String section;
  String year;
  String photo;
  String email;
  bool isLoadingProfile;

  @override
  void initState() {
    super.initState();
    isLoadingProfile = true;
    loadProfileData();
  }

  loadProfileData() async {
    CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.USER_COLLECTION);
    DocumentSnapshot userData = await dataCollection.doc(widget.uid).get();
    setState(() {
      name = userData.get(Config.NAME);
      bio = userData.get(Config.BIO);
      section = userData.get(Config.SECTION);
      year = userData.get(Config.YEAR);
      photo = userData.get(Config.PHOTO);
      email = userData.get(Config.MAIL);
      isLoadingProfile = false;
    });
  }

  Widget userDataContainer() {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGER),
              ),
              Text(
                bio,
                style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
              ),
              Text(
                "$section, $year Year",
                style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
              ),
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(photo),
                  backgroundColor: ColorPalette.BLUE,
                ),
                SizedBox(),
              ]),
        ],
      ),
    );
  }

  Widget detTemplate(String title, String ans) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: Unit.FONT_MEDIUM),
          ),
          Text(
            ans,
            style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.backOnlyAppBar(context: context),
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: Stack(
          children: <Widget>[
            isLoadingProfile
                ? SizedBox()
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: Unit.V_MARGIN),
                        userDataContainer(),
                        SizedBox(height: 20),
                        CustomDivider.zeroPaddingDividerGrey(),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Text(
                            'Details',
                            style: TextStyle(fontSize: Unit.FONT_HEADING, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        detTemplate('Projects Completed', '15'),
                        detTemplate('Attendance Percentage', '9'),
                        detTemplate('Ongoing Projects', '3'),
                        SizedBox(height: 20),
                        CustomDivider.zeroPaddingDividerGrey(),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Text(
                            'Projects',
                            style: TextStyle(fontSize: Unit.FONT_HEADING, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                        // ProjectOthers(showDP: false),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection(Config.PROJECT_COLLECTION)
                              .where(Config.UID, isEqualTo: widget.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot mypost = snapshot.data.documents[index];
                                    String projectName = mypost.get(Config.PROJECT_NAME);
                                    String userName = mypost.get(Config.NAME);
                                    String description = mypost.get(Config.PROJECT_DESCRIPTION);
                                    String link = mypost.get(Config.PROJECT_LINK);
                                    String tag = mypost.get(Config.PROJECT_TAG);

                                    return ProjectOthers(
                                      userName: userName,
                                      projectName: projectName,
                                      description: description,
                                      link: link,
                                      tag: tag,
                                      showDP: false,
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
            isLoadingProfile
                ? Container(
                    constraints: BoxConstraints.expand(),
                    color: ColorPalette.PRIMARY_BG,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: ColorPalette.PRIMARY_BG,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
