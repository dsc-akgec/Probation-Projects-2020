import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAnswer extends StatefulWidget {
  final title;
  final name;
  final reason;
  final answers;
  final docID;
  AddAnswer({@required this.title, this.answers, this.docID, this.name, this.reason});
  @override
  _AddAnswerState createState() => _AddAnswerState();
}

class _AddAnswerState extends State<AddAnswer> {
  String answer;

  void saveButton() async {
    if (answer != null && answer.isNotEmpty) {
      List tempList = widget.answers;
      tempList.add(answer);
      print(tempList);
      final CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.REPORT_COLLECTION);
      await dataCollection
          .doc(widget.docID)
          .update({Config.ANSWERS: tempList, Config.NAME: widget.name, Config.REASON: widget.title});
      Navigator.pop(context);
    } else {
      print("wrong data");
    }
  }

  Widget textInput({String initialValue, Function change, String hintText}) {
    return Container(
      height: 120,
      child: Theme(
        data: new ThemeData(
          primaryColor: Colors.grey,
          primaryColorDark: Colors.red,
        ),
        child: TextFormField(
          maxLength: 1000,
          minLines: 1,
          maxLines: 5,
          style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
          keyboardType: TextInputType.text,
          initialValue: initialValue,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: -15),
            counterText: "",
            hintText: hintText,
            hintStyle: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.grey),
          ),
          onChanged: change,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: SizedBox()),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN, vertical: Unit.V_MARGIN),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorPalette.PRIMARY_BG,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGE),
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomDivider.zeroPaddingDividerGrey(),
                    SizedBox(height: 5),
                    textInput(
                      change: (val) {
                        setState(() {
                          answer = val;
                        });
                      },
                      hintText: 'Answer here',
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ColorPalette.RED,
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: saveButton,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ColorPalette.YELLOW,
                            ),
                            child: Text(
                              'Answer',
                              style: TextStyle(
                                  fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
