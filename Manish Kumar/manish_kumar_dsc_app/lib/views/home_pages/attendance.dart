import 'package:dsc_app/components/attendance_sliverbar.dart';
import 'package:dsc_app/components/custom_divider.dart';
import 'package:dsc_app/components/marked_attendance.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool isPresent;
  int viewType = 0;
  List data = [
    ['12.09.2020', false],
    ['13.09.2020', true],
    ['14.09.2020', false],
    ['15.09.2020', true],
    ['16.09.2020', true],
    ['19.09.2020', true],
  ];
  static const TextStyle tabTextStyle = const TextStyle(fontSize: 18);
  final Map<int, Widget> tabBar = const <int, Widget>{
    0: Text(
      'Overall',
      style: tabTextStyle,
    ),
    1: Text(
      'Present',
      style: tabTextStyle,
    ),
    2: Text(
      'Absent',
      style: tabTextStyle,
    ),
  };

  Widget segmentedControl() {
    return Container(
      width: double.infinity,
      child: CupertinoSegmentedControl<int>(
          groupValue: viewType,
          borderColor: ColorPalette.BLUE,
          selectedColor: ColorPalette.BLUE,
          children: tabBar,
          onValueChanged: (int i) {
            setState(() {
              viewType = i;
            });
            print(tabBar[i]);
          }),
    );
  }

  Widget markAtt() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(Unit.V_MARGIN),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorPalette.BLUE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Mark Your Attendance',
                style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
              ),
              Text(
                '14.09.2020',
                style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            '6.00 - 6.30 PM',
            style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPresent = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.greenAccent,
                  ),
                  child: Text(
                    'PRESENT',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPresent = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.redAccent[100],
                  ),
                  child: Text(
                    'ABSENT',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          AttendanceSliverBar(viewType: viewType),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: ColorPalette.PRIMARY_BG,
                  padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      segmentedControl(),
                      SizedBox(height: 10),
                      isPresent == null ? markAtt() : SizedBox(),
                      SizedBox(height: 10),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: CustomDivider.zeroPaddingDivider()),
                      SizedBox(height: 10),
                      isPresent != null
                          ? MarkedAttendance(
                              date: '20.09.2020',
                              isPresent: isPresent,
                            )
                          : SizedBox(),
                      for (int i = 0; i < data.length; i++)
                        viewType == 0
                            ? MarkedAttendance(date: data[i][0],isPresent: data[i][1])
                            : viewType == 1 && data[i][1] == true
                                ? MarkedAttendance(date: data[i][0],isPresent: data[i][1])
                                : viewType == 2 && data[i][1] == false
                                    ? MarkedAttendance(date: data[i][0],isPresent: data[i][1])
                                    : SizedBox()
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
