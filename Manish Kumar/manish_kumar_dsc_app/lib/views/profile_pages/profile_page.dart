import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/components/project_user.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/faqs_pages/report_form.dart';
import 'package:dsc_app/views/profile_pages/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/color_palatte.dart';
import '../root_loggedout_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name;
  String bio;
  String section;
  String year;
  String photo;
  String email;
  String uid;
  bool isLoadingProfile;

  @override
  void initState() {
    super.initState();
    isLoadingProfile = true;
    loadProfileData();
  }

  loadProfileData() async {
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.USER_COLLECTION);
    DocumentSnapshot userData = await dataCollection.doc(user.uid).get();
    setState(() {
      uid = user.uid;
      name = userData.get(Config.NAME);
      bio = userData.get(Config.BIO);
      section = userData.get(Config.SECTION);
      year = userData.get(Config.YEAR);
      photo = userData.get(Config.PHOTO);
      email = userData.get(Config.MAIL);
      isLoadingProfile = false;
    });
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

  Widget logoutContainer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Log Out',
            style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
          ),
          GestureDetector(
            onTap: () async {
              final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
              try {
                await _firebaseAuth.signOut();
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(MaterialPageRoute(builder: (_) => RootLoggedOut()));
              } catch (e) {
                print("Error in logging out $e");
              }
            },
            child: Text(
              'LOGOUT',
              style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
            ),
          ),
        ],
      ),
    );
  }

  Widget reportContainer() {
    return isLoadingProfile
        ? SizedBox()
        : GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReportForm(
                    name: name,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Have some query?',
                    style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
                  ),
                  Text(
                    'ASK US',
                    style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
                  ),
                ],
              ),
            ),
          );
  }

  Widget userDataContainer() {
    return isLoadingProfile
        ? SizedBox()
        : Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGER),
                    ),
                    Text(
                      bio,
                      style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
                    ),
                    Text(
                      "$section, $year year",
                      style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
                    ),
                    SizedBox(
                      height: 30,
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
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => EditProfile(
                                        initalBio: bio,
                                        initalYear: year,
                                        initialSection: section,
                                      )));
                          loadProfileData();
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(color: ColorPalette.GREEN, fontSize: Unit.FONT_MEDIUM),
                        ),
                      ),
                    ]),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.editAppBar(title: 'Profile', context: context),
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
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
              reportContainer(),
              CustomDivider.zeroPaddingDividerGrey(),
              // SizedBox(height: 20),
              logoutContainer(),
              CustomDivider.zeroPaddingDividerGrey(),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  'Your Projects',
                  style: TextStyle(fontSize: Unit.FONT_HEADING, color: Colors.white),
                ),
              ),
              isLoadingProfile
                  ? SizedBox()
                  : StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(Config.PROJECT_COLLECTION)
                          .where(Config.UID, isEqualTo: uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot mypost = snapshot.data.documents[index];
                                String docID = mypost.id;
                                String projectName = mypost.get(Config.PROJECT_NAME);
                                String description = mypost.get(Config.PROJECT_DESCRIPTION);
                                String link = mypost.get(Config.PROJECT_LINK);
                                String tag = mypost.get(Config.PROJECT_TAG);

                                return ProjectUser(
                                  projectName: projectName,
                                  description: description,
                                  link: link,
                                  tag: tag,
                                  docID: docID,
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
