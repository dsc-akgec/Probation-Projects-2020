import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final initalBio;
  final initialSection;
  final initalYear;
  EditProfile({@required this.initalBio, @required this.initalYear, this.initialSection});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String bio;
  String section;
  String year;

  @override
  void initState() {
    super.initState();
    bio = widget.initalBio;
    section = widget.initialSection;
    year = widget.initalYear;
  }

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
            Config.NAME: user.displayName,
            Config.MAIL: user.email,
            Config.PHOTO: user.photoURL,
            Config.BIO: bio,
            Config.SECTION: section,
            Config.YEAR: year
          });
          Navigator.pop(context);
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar.editAppBar(context: context, title: 'Edit Profile'),
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
                textInput(bio, (val) {
                  setState(() {
                    bio = val;
                  });
                }, 'Enter Your Bio'),
                SizedBox(height: 20),
                headerText('Branch and Section'),
                textInput(section, (val) {
                  setState(() {
                    section = val;
                  });
                }, 'Enter your Branch and Section e.g. IT-2'),
                SizedBox(height: 20),
                headerText('Year'),
                textInput(year, (val) {
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
    );
  }
}
