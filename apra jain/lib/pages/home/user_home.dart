import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/models/bottombar.dart';

import 'package:dsc_app/models/eventposts.dart';
import 'package:dsc_app/models/theme.dart';
import 'package:dsc_app/pages/aboutus/aboutdsc.dart';
import 'package:dsc_app/pages/home/welcome.dart';
import 'package:dsc_app/pages/projects/projects.dart';
import 'package:dsc_app/pages/team/team.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class UserHome extends StatelessWidget {
  double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColor.BURGANDY,
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/dsclogo.png'),
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AboutDsc()));
                      },
                      child: GestureDetector(
                        onTap: () async {
                          final FirebaseAuth _firebaseAuth =
                              FirebaseAuth.instance;
                          try {
                            await _firebaseAuth.signOut();
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => HomePage()));
                          } catch (e) {
                            print("Error in logging out $e");
                          }
                        },
                        child: Icon(FontAwesomeIcons.signOutAlt),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Projects()));
                    },
                    child: customContainer(
                        'PROJECTS', Icons.collections_bookmark, context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Team()));
                    },
                    child: customContainer('TEAM', Icons.people, context),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColor.BURGANDY,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Column(children: [
                      Text('Meeting Reminder',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      SizedBox(height: 4),
                      Text('18 October,2020 ; 16:00',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[300],
                          )),
                    ]),
                  ],
                ),
              ),
              event('Recruitment Drive 2020', 'Coming Soon', 'dscrecruit.jpg'),
              event('Recruitment Drive', 'Coming Soon', 'dscrecruit.jpg'),
              event('Recruitment Drive', 'Coming Soon', 'dscrecruit.jpg')
            ],
          ),
        ),
      ),
    );
  }
}
