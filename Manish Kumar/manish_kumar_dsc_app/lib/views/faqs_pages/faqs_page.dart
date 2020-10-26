import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/components/doubt_box_readonly.dart';
import 'package:dsc_app/views/faqs_pages/add_answer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'report_form.dart';
import 'report_form_nonuser.dart';

class FAQsPage extends StatefulWidget {
  @override
  _FAQsPageState createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> {
  @override
  void initState() {
    super.initState();
    // check if user is logged in then can add comment
  }

  Widget doubtBox({String title, List answers, String name, bool isLoggedin, docID}) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: Unit.V_MARGIN, horizontal: Unit.H_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DoubtBoxReadOnly(title: title, answers: answers, name: name),
            isLoggedin
                ? GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (_) => AddAnswer(
                                title: title,
                                answers: answers,
                                docID: docID,
                                name: name,
                              ));
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: ColorPalette.YELLOW,
                        ),
                        child: Text(
                          'Answer',
                          style:
                              TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        title: "FAQs and Doubts",
      ),
      backgroundColor: ColorPalette.PRIMARY_BG,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          User user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => ReportFormNonUser()));
          } else {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (_) => ReportForm(
                          name: user.displayName,
                        )));
          }
        },
        child: Icon(
          Icons.add,
          color: ColorPalette.SELECTED_NAV_BAR,
        ),
        backgroundColor: ColorPalette.GREEN,
        elevation: 5,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection(Config.REPORT_COLLECTION).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doubt = snapshot.data.documents[index];
                          // bool isPublic = mypost.get(Config.POSTS_ISPUBLIC);
                          String title = doubt.get(Config.REASON);
                          String name = doubt.get(Config.NAME);
                          List answers = doubt.get(Config.ANSWERS);
                          User user = FirebaseAuth.instance.currentUser;
                          bool isLoggedin = user == null ? false : true;
                          return doubtBox(
                              title: title, name: name, answers: answers, isLoggedin: isLoggedin, docID: doubt.id);
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
