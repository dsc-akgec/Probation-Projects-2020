import 'package:dsc_app/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceSliverBar extends StatelessWidget {
  final double sliverHeight = 220;
  final int viewType;
  AttendanceSliverBar({@required this.viewType});

  @override
  Widget build(BuildContext context) {
    print("new viewtype : $viewType");
    return SliverAppBar(
      backgroundColor: ColorPalette.PRIMARY_BG,
      pinned: true,
      expandedHeight: sliverHeight,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              constraints: BoxConstraints.expand(),
              child: CircularPercentIndicator(
                radius: sliverHeight * 0.5,
                lineWidth: 15,
                backgroundColor: viewType == 1 ? ColorPalette.PRIMARY_BG : ColorPalette.RED,
                animation: true,
                startAngle: 0.0,
                animationDuration: Duration.millisecondsPerSecond,
                percent: 0.8,
                progressColor: viewType == 2 ? ColorPalette.PRIMARY_BG : ColorPalette.BLUE,
                center: FittedBox(
                  child: Text(
                    viewType == 0 ? "75%" : viewType == 1 ? "12/16" : "2/16",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          centerTitle: true,
          title: Text('ATTENDANCE')),
    );
  }
}
