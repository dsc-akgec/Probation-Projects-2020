import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/dsc_post.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/auth/login_button.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageLoggedOut extends StatefulWidget {
  @override
  _HomePageLoggedOutState createState() => _HomePageLoggedOutState();
}

class _HomePageLoggedOutState extends State<HomePageLoggedOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: 'Home Page'),
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  LoginButton(),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection(Config.POSTS).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot mypost = snapshot.data.documents[index];
                              bool isPublic = mypost.get(Config.POSTS_ISPUBLIC);
                              if (isPublic) {
                                String title = mypost.get(Config.POST_TITLE);
                                String message = mypost.get(Config.POST_MESSAGE);
                                String issueDate = mypost.get(Config.POST_DATE);
                                return DscPost(
                                  title: title,
                                  message: message,
                                  issueDate: issueDate,
                                );
                              } else {
                                return SizedBox();
                              }
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
            ],
          ),
        ),
      ),
    );
  }
}
