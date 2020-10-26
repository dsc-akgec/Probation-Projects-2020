import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/components/searched_profile_box.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchBase extends StatefulWidget {
  @override
  _SearchBaseState createState() => _SearchBaseState();
}

class _SearchBaseState extends State<SearchBase> {
  String phrase = '';
  String userID;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    userID = user.uid;
  }

  void phraseSetter(val) {
    setState(() {
      phrase = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.searchAppBar(context: context, onSubmit: phraseSetter),
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: Unit.V_MARGIN),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search user:${phrase ?? 'user_name'}',
                  style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGE),
                ),
              ),
              SizedBox(height: 10),
              // SearchedProfileBox(name: 'Manish Kumar'),
              phrase.length > 0
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance.collection(Config.USER_COLLECTION).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot mypost = snapshot.data.documents[index];
                                String uid = mypost.id;
                                String name = mypost.get(Config.NAME);
                                if (name.toLowerCase().contains(phrase.toLowerCase()) && userID != uid) {
                                  String photo = mypost.get(Config.PHOTO);
                                  String section = mypost.get(Config.SECTION);
                                  String year = mypost.get(Config.YEAR);
                                  return SearchedProfileBox(
                                    name: name,
                                    photo: photo,
                                    section: section,
                                    year: year,
                                    uid: uid,
                                  );
                                } else {
                                  return SizedBox();
                                }
                              });
                        } else {
                          return Text(
                            'No Users Found',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Unit.FONT_LARGE,
                            ),
                          );
                        }
                      },
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
