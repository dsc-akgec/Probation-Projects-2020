import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/formDeco.dart';
import 'package:dsc_app/pages/home/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _fbkey = GlobalKey<FormBuilderState>();

  String name;
  String domain;
  String photo;
  String branch;
  String year;
  String bio;
  String phoneno;
  String githubprofile;

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        if (_fbkey.currentState.saveAndValidate() &&
            phoneno != null &&
            domain != null &&
            branch != null &&
            bio != null &&
            year != null &&
            githubprofile != null) {
          User user = FirebaseAuth.instance.currentUser;
          final CollectionReference dataCollection =
              FirebaseFirestore.instance.collection(Constants.USERCOLLECTION);
          dataCollection.doc(user.uid).set({
            Constants.NAME: user.displayName,
            Constants.MAIL: user.email,
            Constants.PHOTO: user.photoURL,
            Constants.DOMAIN: domain,
            Constants.BRANCH: branch,
            Constants.YEAR: year,
            Constants.BIO: bio,
            Constants.PHONENUMBER: phoneno,
            Constants.GITHUBPROFILE: githubprofile,
            Constants.ATTENDANCE: '100',
            Constants.ACTIVEPROJECTS: '0',
            Constants.COMPLETEPROJECTS: '0',
          }, SetOptions(merge: true));
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => UserHome()));
        } else {
          print("wrong data");
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: CustomColor.PALE_AMBER,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          'Register',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("You cant back from here");
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: FormBuilder(
                key: _fbkey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    FormBuilderDropdown(
                      attribute: "domain",
                      decoration: dropDown.copyWith(labelText: 'Domain'),
                      validators: [FormBuilderValidators.required()],
                      items: [
                        'App Development',
                        'Web Development',
                        'Machine Learning',
                        'Management'
                      ]
                          .map((domain) => DropdownMenuItem(
                              value: domain, child: Text("$domain")))
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
                      //initialValue: branch,
                      decoration: dropDown.copyWith(labelText: 'Branch'),
                      validators: [FormBuilderValidators.required()],
                      items: ['CSE', 'IT', 'CS', 'CS&IT', 'ECE']
                          .map((branch) => DropdownMenuItem(
                              value: branch, child: Text("$branch")))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          branch = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    FormBuilderDropdown(
                      style: TextStyle(color: Colors.black),
                      attribute: "year",
                      //initialValue: year,
                      decoration: dropDown.copyWith(labelText: 'Year'),
                      validators: [FormBuilderValidators.required()],
                      items: ['2nd Year', '3rd Year', '4th Year']
                          .map((year) => DropdownMenuItem(
                              value: year, child: Text("$year")))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          year = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    textInput(null, (val) {
                      setState(() {
                        bio = val;
                      });
                    }, 'Bio'),
                    SizedBox(height: 20),
                    // textInput(null, (val) {
                    //   setState(() {
                    //     phoneno = val;
                    //   });
                    // }, 'Phone Number'),
                    FormBuilderPhoneField(
                      attribute: 'phone',
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.minLength(13),
                        FormBuilderValidators.maxLength(13)
                        // FormBuilderValidators.required(),
                      ],
                      decoration: dropDown.copyWith(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.grey)
                          //prefixText: '+91',
                          ),
                      onChanged: (val) {
                        setState(() {
                          phoneno = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    FormBuilderTextField(
                      attribute: 'link',
                      validators: [
                        FormBuilderValidators.url(),
                        FormBuilderValidators.required()
                      ],
                      decoration: dropDown.copyWith(
                        labelText: 'Github Profile Link',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (val) {
                        setState(() {
                          githubprofile = val;
                        });
                      },
                    ),
                    // textInput(null, (val) {
                    //   setState(() {
                    //     githubprofile = val;
                    //   });
                    // }, 'Github Profile Link'),
                    saveButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
