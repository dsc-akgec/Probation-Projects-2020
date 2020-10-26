import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/root_loggedin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String bio;
  String section;
  String year;

  Widget headerText(title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: Unit.FONT_LARGER, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () {
        if (bio != null && section != null && year != null) {
          User user = FirebaseAuth.instance.currentUser;
          final CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.USER_COLLECTION);
          dataCollection.doc(user.uid).set({
            'name': user.displayName,
            'mail': user.email,
            'photo': user.photoURL,
            'bio': bio,
            'section': section,
            'year': year
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootLoggedIn()));
        } else {
          print("wrong data");
        }
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Save',
          style: TextStyle(fontSize: Unit.FONT_LARGER, color: ColorPalette.GREEN, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textInput(String initialValue, Function change, hintText) {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        maxLength: 200,
        style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
        keyboardType: TextInputType.text,
        initialValue: initialValue,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: -15),
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.grey),
        ),
        onChanged: change,
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
          appBar: CustomAppBar.appBar(context: context, title: 'Edit Profile'),
          backgroundColor: ColorPalette.PRIMARY_BG,
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: Unit.V_MARGIN),
                  headerText('Your Bio'),
                  textInput(null, (val) {
                    setState(() {
                      bio = val;
                    });
                  }, 'Enter Your Bio'),
                  SizedBox(height: 20),
                  headerText('Branch and Section'),
                  textInput(null, (val) {
                    setState(() {
                      section = val;
                    });
                  }, 'Enter your Branch and Section e.g. IT-2'),
                  SizedBox(height: 20),
                  headerText('Year'),
                  textInput(null, (val) {
                    setState(() {
                      year = val;
                    });
                  }, 'Enter your Year e.g. 1st, 2nd Year'),
                  SizedBox(height: 30),
                  saveButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
