import 'package:dsc_app/constants/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bgTheme(body) {
  return Container(
    //constraints: BoxConstraints.expand(),
    // width: double.infinity,
    height: double.infinity,
    color: CustomColor.BURGANDY,
    child: body,
  );
}

Widget customContainer(data, IconData icon, context) {
  return Container(
    //margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    height: MediaQuery.of(context).size.height * 0.22,
    width: MediaQuery.of(context).size.width * 0.42,
    decoration: BoxDecoration(
      color: CustomColor.NUDE,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35),
          SizedBox(height: 10),
          Text(
            data,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
