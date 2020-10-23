import 'package:dsc_app/auth/sign_in.dart';
import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/models/appbar.dart';
import 'package:dsc_app/models/eventposts.dart';
import 'package:dsc_app/models/theme.dart';
import 'package:dsc_app/pages/aboutus/aboutdsc.dart';
import 'package:dsc_app/pages/projects/projects.dart';
import 'package:dsc_app/pages/team/team.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: Icon(FontAwesomeIcons.infoCircle),
                    ),
                  ],
                ),
              ),
              LoginPage(),
              SizedBox(height: 20),
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
              SizedBox(height: 10),

              // customContainer('ABOUT US', CustomColor.BEIGE,
              //     Icons.info_outline, context),
              event('Recruitment Drive', 'Coming Soon', 'dscrecruit.jpg'),
              event('Recruitment Drive', 'Coming Soon', 'dscrecruit.jpg'),
              event('Recruitment Drive', 'Coming Soon', 'dscrecruit.jpg')
            ],
          ),
        ),
      ),
    );
  }
}
