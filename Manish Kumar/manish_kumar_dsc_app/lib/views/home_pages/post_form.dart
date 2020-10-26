import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_appbar.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostForm extends StatefulWidget {
  final name;
  final uid;
  PostForm({@required this.name, @required this.uid});
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  String date;
  bool isPublic = true;
  String title;
  String message;

  Widget headerText(title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: Unit.FONT_LARGER, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget isPublicContainer() {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Is the post public for non-DSC Members?",
              style: TextStyle(fontSize: Unit.FONT_LARGER, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 15),
          CupertinoSwitch(
            value: isPublic,
            onChanged: (val) {
              print("setting ispublic to $val");
              setState(() {
                isPublic = val;
              });
            },
            activeColor: ColorPalette.BLUE,
          ),
        ],
      ),
    );
  }

  Widget sendButton() {
    return GestureDetector(
      onTap: () async {
        if (message != null &&
            message.isNotEmpty &&
            title != null &&
            title.isNotEmpty &&
            date != null &&
            date.isNotEmpty) {
          final CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.POSTS);
          await dataCollection.doc().set({
            Config.NAME: widget.name,
            Config.UID: widget.uid,
            Config.POSTS_ISPUBLIC: isPublic,
            Config.POST_DATE: date,
            Config.POST_TITLE: title,
            Config.POST_MESSAGE: message,
          });
          Navigator.pop(context);
        } else {
          print("wrong data");
        }
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Send',
          style: TextStyle(fontSize: Unit.FONT_LARGER, color: ColorPalette.BLUE, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textInput({String initialValue, Function change, String hintText, bool readOnly, bool isMultiLine}) {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        enabled: !readOnly,
        maxLength: isMultiLine ? 1000 : 200,
        minLines: 1,
        maxLines: isMultiLine ? 5 : 1,
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
        appBar: CustomAppBar.editAppBar(context: context, title: 'Reprot/Submit Query'),
        backgroundColor: ColorPalette.PRIMARY_BG,
        body: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: Unit.V_MARGIN),
                headerText('Name'),
                textInput(
                  initialValue: widget.name,
                  change: (val) {},
                  hintText: 'Your Name',
                  readOnly: true,
                  isMultiLine: false,
                ),
                SizedBox(height: 20),
                headerText('Date'),
                textInput(
                  change: (val) {
                    setState(() {
                      date = val;
                    });
                  },
                  hintText: 'Date in fromat 12th Nov, 2020',
                  readOnly: false,
                  isMultiLine: false,
                ),
                SizedBox(height: 20),
                headerText('Title'),
                textInput(
                  change: (val) {
                    setState(() {
                      title = val;
                    });
                  },
                  hintText: 'Post title',
                  readOnly: false,
                  isMultiLine: true,
                ),
                SizedBox(height: 20),
                headerText('Description'),
                textInput(
                  change: (val) {
                    setState(() {
                      message = val;
                    });
                  },
                  hintText: 'Post description',
                  readOnly: false,
                  isMultiLine: true,
                ),
                SizedBox(height: 20),
                isPublicContainer(),
                SizedBox(height: 30),
                sendButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
