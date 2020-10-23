import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/models/appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDsc extends StatelessWidget {
  double iconSize = 25;
  String aboutdsc =
      'Developer Student Clubs (DSC) are community groups for students from any academic background in their undergraduate or graduate term. By joining a DSC, students build their professional and personal network, get access to Google developer resources, and work together to build solutions for local problems in a peer-to-peer learning environment.';

  Future _urllaunch(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'could not launch $url';
    }
  }

  Widget techs(data, IconData icon, context) {
    return Container(
      //margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.width * 0.4,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: CustomColor.NUDE,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35),
          SizedBox(height: 10),
          Text(
            data,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageTitle('About DSC'),
              Image(
                image: AssetImage('assets/dschome.png'),
                width: double.infinity,
              ),
              SizedBox(height: 30),
              Text(
                aboutdsc,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  techs('App Development', Icons.android, context),
                  techs('Web Development', FontAwesomeIcons.laptopCode, context)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  techs('Machine Learning', FontAwesomeIcons.connectdevelop,
                      context),
                  techs('Management', FontAwesomeIcons.fileSignature, context)
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _urllaunch('mailto: connect2dsc.akgec@gmail.com'),
                      child: Icon(
                        FontAwesomeIcons.solidEnvelope,
                        size: iconSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _urllaunch('https://www.facebook.com/dscAKGEC/');
                      },
                      child: Icon(
                        FontAwesomeIcons.facebookSquare,
                        size: iconSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _urllaunch('https://twitter.com/dsc_akgec?lang=en');
                      },
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        size: iconSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _urllaunch(
                            'https://www.instagram.com/dsc_akgec/?hl=en');
                      },
                      child: Icon(
                        FontAwesomeIcons.instagram,
                        size: iconSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _urllaunch(
                          'https://www.linkedin.com/company/developer-student-club-akgec/'),
                      child: Icon(
                        FontAwesomeIcons.linkedin,
                        size: iconSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
