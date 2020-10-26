import 'package:flutter/material.dart';

Widget pageTitle(title) {
  return Container(
    margin: EdgeInsets.only(top: 60, bottom: 20),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
