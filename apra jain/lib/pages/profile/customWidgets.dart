import 'package:dsc_app/constants/color_palette.dart';
import 'package:flutter/material.dart';

Widget customRow(IconData icon, title) {
  return Row(
    children: [
      Icon(icon),
      SizedBox(width: 6),
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ],
  );
}

Widget divider() {
  return Divider(
    color: Colors.grey[400],
    height: 30,
  );
}

Widget info(value) {
  return Text(
    value,
    style: TextStyle(
      color: Colors.grey[700],
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget element(Widget body) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: CustomColor.NUDE.withOpacity(0.8),
    ),
    child: body,
  );
}

Widget elementText(value) {
  return Text(value,
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400));
}
