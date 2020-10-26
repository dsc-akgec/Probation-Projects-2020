import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/bottombar.dart';
import 'package:dsc_app/models/theme.dart';
import 'package:dsc_app/pages/loading.dart';
import 'package:dsc_app/pages/profile/customWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name,
      email,
      branch,
      domain,
      photo,
      uid,
      year,
      bio,
      phoneno,
      githubprofile,
      attendance;
  //activeProjects = '3',
  //completedProjects = '5';
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    loadProfileData();
  }

  loadProfileData() async {
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference dataCollection =
        FirebaseFirestore.instance.collection(Constants.USERCOLLECTION);
    DocumentSnapshot userData = await dataCollection.doc(user.uid).get();
    setState(() {
      uid = user.uid;
      name = userData.get(Constants.NAME);
      domain = userData.get(Constants.DOMAIN);
      bio = userData.get(Constants.BIO);
      branch = userData.get(Constants.BRANCH);
      year = userData.get(Constants.YEAR);
      photo = userData.get(Constants.PHOTO);
      email = userData.get(Constants.MAIL);
      phoneno = userData.get(Constants.PHONENUMBER);
      githubprofile = userData.get(Constants.GITHUBPROFILE);
      attendance = userData.get(Constants.ATTENDANCE);
      isLoading = false;
    });
  }

  Future _urllaunch(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.solidEdit,
            ),
            onPressed: () async {
              //Navigator.pop(context);
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Edit(
                            iName: name,
                            iDomain: domain,
                            iBranch: branch,
                            iYear: year,
                            iBio: bio,
                          )));
              loadProfileData();
              setState(() {
                print("something");
              });
            },
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
      body: isLoading
          ? Loading()
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(photo),
                          radius: 60,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    info(domain),
                    SizedBox(height: 5),
                    info('$year, $branch'),
                    divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _urllaunch('mailto: $email');
                          },
                          child: customRow(Icons.mail, 'Email'),
                        ),
                        GestureDetector(
                            onTap: () {
                              _urllaunch('tel: $phoneno');
                            },
                            child: customRow(Icons.phone_android, 'Call')),
                        GestureDetector(
                          onTap: () {
                            _urllaunch('$githubprofile');
                          },
                          child: customRow(
                            FontAwesomeIcons.github,
                            'Github',
                          ),
                        ),
                      ],
                    ),
                    divider(),
                    element(Align(
                        alignment: Alignment.centerLeft,
                        child: elementText(bio))),
                    element(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          elementText('Attendance Percentage'),
                          elementText('$attendance%')
                        ],
                      ),
                    ),
                    element(Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            elementText('Active Projects'),
                            elementText('3')
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            elementText('Projects Completed'),
                            elementText('5'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            elementText('For more information visit '),
                            GestureDetector(
                              onTap: () {
                                _urllaunch('$githubprofile');
                              },
                              child: elementText('Github.'),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
    );
  }
}
