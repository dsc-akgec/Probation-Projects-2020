import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/appbar.dart';
import 'package:dsc_app/models/formDeco.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Edit extends StatefulWidget {
  final iName, iDomain, iBranch, iYear, iBio;
  Edit({
    @required this.iName,
    @required this.iDomain,
    @required this.iBranch,
    @required this.iYear,
    @required this.iBio,
  });

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  String name;
  String domain;
  String branch;
  String year;
  String bio;

  @override
  void initState() {
    super.initState();
    name = widget.iName;
    domain = widget.iDomain;
    branch = widget.iBranch;
    year = widget.iYear;
    bio = widget.iBio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          GestureDetector(
            onTap: () {
              if (bio != null && branch != null && year != null) {
                User user = FirebaseAuth.instance.currentUser;
                final CollectionReference dataCollection = FirebaseFirestore
                    .instance
                    .collection(Constants.USERCOLLECTION);
                dataCollection.doc(user.uid).set(
                  {
                    Constants.NAME: name,
                    // Constants.MAIL: user.email,
                    //Constants.PHOTO: user.photoURL,
                    Constants.BIO: bio,
                    Constants.DOMAIN: domain,
                    Constants.BRANCH: branch,
                    Constants.YEAR: year
                  },
                  SetOptions(merge: true),
                );
                Navigator.pop(context);
              } else {
                print("wrong data");
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(FontAwesomeIcons.check),
            ),
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //pageTitle('Edit Profile'),
              // SizedBox(height: 10),
              // Container(
              //   margin: EdgeInsets.all(10),
              //   padding: EdgeInsets.all(3),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 4),
              //     shape: BoxShape.circle,
              //   ),
              //   child: Center(
              //     child: CircleAvatar(
              //       backgroundImage: AssetImage('assets/ethnic.jpg'),
              //       radius: 60,
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              //headerText('Your Name'),
              textInput(name, (val) {
                setState(() {
                  name = val;
                });
              }, 'Name'),

              SizedBox(height: 20),

              FormBuilderDropdown(
                attribute: "domain",
                initialValue: domain,
                decoration: dropDown.copyWith(labelText: 'Domain'),
                validators: [FormBuilderValidators.required()],
                items: [
                  'App Development',
                  'Web Development',
                  'Machine Learning',
                  'Management'
                ]
                    .map((domain) =>
                        DropdownMenuItem(value: domain, child: Text("$domain")))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    domain = val;
                  });
                },
              ),
              SizedBox(height: 20),

              FormBuilderDropdown(
                attribute: "branch",
                initialValue: branch,
                decoration: dropDown.copyWith(labelText: 'Branch'),
                validators: [FormBuilderValidators.required()],
                items: ['CSE', 'IT', 'CS', 'CS&IT', 'ECE']
                    .map((branch) =>
                        DropdownMenuItem(value: branch, child: Text("$branch")))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    branch = val;
                  });
                },
              ),

              SizedBox(height: 20),

              FormBuilderDropdown(
                attribute: "year",
                initialValue: year,
                decoration: dropDown.copyWith(labelText: 'Year'),
                validators: [FormBuilderValidators.required()],
                items: ['2nd Year', '3rd Year', '4th Year']
                    .map((year) =>
                        DropdownMenuItem(value: year, child: Text("$year")))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    year = val;
                  });
                },
              ),

              SizedBox(height: 20),

              textInput(bio, (val) {
                setState(() {
                  bio = val;
                });
              }, 'Bio'),
            ],
          ),
        ),
      ),
    );
  }
}
