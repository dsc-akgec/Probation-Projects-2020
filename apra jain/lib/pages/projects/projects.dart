import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/appbar.dart';
import 'package:dsc_app/pages/loading.dart';
import 'package:dsc_app/pages/projects/addProject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isLoggedin = false;
  bool linkIsPresent = true;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    isLoggedin = user != null ? true : false;
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

  Widget addButton() {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => AddProject())),
      child: Icon(
        Icons.add,
        size: 35,
      ),
      backgroundColor: CustomColor.BURGANDY,
      highlightElevation: 2,
    );
  }

  Widget project({projectname, description, name, link}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.PALE_AMBER,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                projectname,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                name,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          link == null
              ? SizedBox()
              : Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () => _urllaunch(link),
                    child: Text(
                      'Github link',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
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
        floatingActionButton: isLoggedin ? addButton() : SizedBox(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pageTitle('Projects'),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 40),
                    //   child: Icon(FontAwesomeIcons.search),
                    // ),
                  ],
                ),
                //Text('gdvg'),
                StreamBuilder(
                  // link to the post database
                  stream: FirebaseFirestore.instance
                      .collection(Constants.PROJECTCOLLECTION)
                      .snapshots(),
                  // one card/list builder
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          // to avoid RenderBox Not Laid out error
                          // scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot mypost =
                                snapshot.data.documents[index];
                            String name = mypost.get(Constants.NAME);
                            String projectName =
                                mypost.get(Constants.PROJECTNAME);
                            String description =
                                mypost.get(Constants.DESCRIPTION);
                            String link = mypost.get(Constants.LINK);
                            // String docID = mypost.id;
                            return project(
                              projectname: projectName,
                              description: description,
                              name: name,
                              link: link,
                            );
                          });
                    } else {
                      // return Text(
                      //   'No projects yet',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 16,
                      //   ),
                      // );
                      print('no projects');
                      return Loading();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
