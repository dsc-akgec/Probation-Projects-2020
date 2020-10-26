import 'package:dsc_app/constants/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget event(name, details, image) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
    padding: EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            color: Color(0xffd9d9d9),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-5, -5),
          )
        ],
        color: CustomColor.PALE_AMBER),
    child: Row(
      children: [
        Container(
          width: 130,
          height: 130,
          child: Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Image(
                image: AssetImage('assets/$image'),
                width: 130,
                height: 130,
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(details,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
