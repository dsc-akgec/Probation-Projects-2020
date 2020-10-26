import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _formkey = GlobalKey<FormBuilderState>();

  String name, description, link;

  Widget inputDeco(labeltext, Function change) {
    return TextFormField(
      // maxLength: 25,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColor.NUDE)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColor.BURGANDY)),
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
      onChanged: change,
    );
  }

  Widget addButton() {
    return GestureDetector(
      onTap: () {
        if (_formkey.currentState.saveAndValidate() &&
            name != null &&
            description != null) {
          User user = FirebaseAuth.instance.currentUser;
          final CollectionReference dataCollection = FirebaseFirestore.instance
              .collection(Constants.PROJECTCOLLECTION);

          dataCollection.doc().set({
            Constants.NAME: user.displayName,
            Constants.PROJECTNAME: name,
            Constants.DESCRIPTION: description,
            Constants.LINK: link,
          });
          Navigator.pop(context);
        } else {
          print("wrong data");
        }
      },
      child: Center(
        child: Container(
          //alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: CustomColor.PALE_AMBER,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            'Add',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageTitle('Add Project'),
              inputDeco('Project Name', (val) {
                setState(() {
                  name = val;
                });
              }),
              SizedBox(height: 8),
              inputDeco('Description', (val) {
                setState(() {
                  description = val;
                });
              }),
              SizedBox(height: 8),
              // inputDeco('Github link', (val) {
              //   setState(() {
              //     link = val;
              //   });
              // }),
              FormBuilder(
                key: _formkey,
                child: FormBuilderTextField(
                  attribute: 'link',
                  validators: [
                    FormBuilderValidators.url(),
                  ],
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColor.NUDE)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomColor.BURGANDY)),
                      labelText: 'Github Link (Optional)',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
                  onChanged: (val) {
                    setState(() {
                      link = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              addButton(),
            ],
          ),
        ),
      ),
    );
  }
}
