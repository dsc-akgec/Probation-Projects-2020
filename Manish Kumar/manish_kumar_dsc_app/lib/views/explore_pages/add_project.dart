import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  bool isLoadingProfile;
  List tags = ['published', 'working', 'in review'];
  int selectedTag = -1;

  String uid;
  String userName;
  String userPhoto;
  String projectName = '';
  String description = '';
  String githubLink = '';

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
      userName = userData.get(Config.NAME);
      userPhoto = userData.get(Config.PHOTO);
      isLoadingProfile = false;
    });
  }

  Widget headerText(title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: Unit.FONT_LARGER, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () async {
        if (projectName.isNotEmpty && description.isNotEmpty) {
          String tag = '';
          if (selectedTag >= 0 && selectedTag < tags.length) {
            tag = tags[selectedTag];
          }
          final CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.PROJECT_COLLECTION);
          await dataCollection.doc().set({
            Config.UID: uid,
            Config.NAME: userName,
            Config.PHOTO: userPhoto,
            Config.PROJECT_NAME: projectName,
            Config.PROJECT_DESCRIPTION: description,
            Config.PROJECT_LINK: githubLink,
            Config.PROJECT_TAG: tag,
          });
          Navigator.pop(context);
        } else {
          print('fill data');
        }
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Save',
          style: TextStyle(fontSize: Unit.FONT_LARGER, color: ColorPalette.GREEN, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textInput(String initialValue, Function change, String hintText) {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        maxLength: 200,
        style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
        keyboardType: TextInputType.text,
        initialValue: initialValue,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: -15),
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.grey),
        ),
        onChanged: change,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar.editAppBar(context: context, title: 'Add Project'),
        backgroundColor: ColorPalette.PRIMARY_BG,
        body: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: isLoadingProfile
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(height: Unit.V_MARGIN),
                      headerText('Project Name'),
                      textInput(null, (val) {
                        setState(() {
                          projectName = val;
                        });
                      }, 'Enter Project Name here'),
                      SizedBox(height: 20),
                      headerText('Description'),
                      textInput(null, (val) {
                        setState(() {
                          description = val;
                        });
                      }, 'Write a short project description'),
                      SizedBox(height: 20),
                      headerText('Github Link'),
                      textInput(null, (val) {
                        setState(() {
                          githubLink = val;
                        });
                      }, 'Paste your github repository link here'),
                      SizedBox(height: 20),
                      headerText('Choose A Tag'),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          for (int i = 0; i < tags.length; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTag = i;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: selectedTag == i ? ColorPalette.BLUE : Colors.grey, width: 3)),
                                child: Text(
                                  tags[i],
                                  style: TextStyle(color: Colors.white, fontSize: Unit.FONT_MEDIUM),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 30),
                      saveButton()
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
