import 'package:dsc_app/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget textInput(String initialValue, Function change, labelText) {
  return TextFormField(
    //maxLength: 200,

    style: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    keyboardType: TextInputType.text,
    initialValue: initialValue,
    validator: (val) => (val.isEmpty) ? 'Field cannot be empty' : null,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.NUDE, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.BURGANDY, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      // errorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.red, width: 2),
      //   borderRadius: BorderRadius.all(Radius.circular(30)),
      // ),
    ),
    onChanged: change,
  );
}

var dropDown = InputDecoration(
  //labelText: "Year",
  labelStyle: TextStyle(color: Colors.grey),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: CustomColor.NUDE, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: CustomColor.BURGANDY, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);
