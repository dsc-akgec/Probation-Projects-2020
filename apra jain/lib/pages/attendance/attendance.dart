import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/models/appbar.dart';
import 'package:dsc_app/models/bottombar.dart';
import 'package:dsc_app/pages/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool present = false;
  bool isLoading, attended;

  int temp = 0;
  String attendancePercent = '100';
  double attendance = 1;

  var dateDay = DateTime.now().day;
  var month = DateTime.now().month;
  var year = DateTime.now().year;
  String date;

  int totalAttendance = 0, totalPresent = 0, totalAbsent = 0;

  User user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    loadAttendance();
  }

  loadAttendance() async {
    CollectionReference dataCollection = FirebaseFirestore.instance
        .collection(Constants.ATTENDANCECOLLECTION)
        .doc(user.email)
        .collection(Constants.USERATTENDANCE);
    //dataCollection.get().then((value) => null)
    if (dataCollection != null) {
      QuerySnapshot attendanceData = await dataCollection.get();

      List dataList = [true];
      int ispresent = 0, isabsent = 0;
      try {
        attendanceData.docs
            .forEach((f) => dataList.add(f.get(Constants.PRESENT)));

        for (int i = 1; i < dataList.length; i++) {
          attended = dataList[i];
          attended ? ispresent++ : isabsent++;
        }
        setState(() {
          isLoading = false;
          totalPresent = ispresent;
          totalAbsent = isabsent;
          if (ispresent > 0 || isabsent > 0) {
            totalAttendance = ispresent + isabsent;
            attendance = totalPresent / totalAttendance;
            temp = (attendance * 100).round();
            attendancePercent = temp.toString();
          }
        });
        print(attendancePercent);
      } catch (e) {
        print(e);
      }
      CollectionReference userCollection =
          FirebaseFirestore.instance.collection(Constants.USERCOLLECTION);
      userCollection.doc(user.uid).set(
        {
          Constants.ATTENDANCE: attendancePercent,
        },
        SetOptions(merge: true),
      );
    }
  }

  Widget day(date, bool present) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.8),
        // (present ? Colors.green
        //     : (absent ? Colors.redAccent : Colors.white)),
      ),
      child: Row(
        children: [
          present
              ? Icon(FontAwesomeIcons.solidCheckCircle, color: Colors.green)
              : Icon(FontAwesomeIcons.solidTimesCircle, color: Colors.red),
          SizedBox(width: 6),
          Text(
            date,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget data(value, title) {
    return Column(children: [
      Text(value,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          )),
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    ]);
  }

  Widget headerTheme(Widget body) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColor.BURGANDY,
      ),
      child: body,
    );
  }

  void markAttn(bool isPresent) {
    User user = FirebaseAuth.instance.currentUser;
    final CollectionReference dataCollection =
        FirebaseFirestore.instance.collection(Constants.ATTENDANCECOLLECTION);

    dataCollection
        .doc(user.email)
        .collection(Constants.USERATTENDANCE)
        .doc(date)
        .set({
      Constants.PRESENT: isPresent,
      Constants.DATE: date,
    });
  }

  Widget popUp() {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            date = '$dateDay-$month-$year',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    present = true;
                  });
                  markAttn(present);
                  Navigator.pop(context);
                  loadAttendance();
                  setState(() {
                    isLoading = true;
                    print('loading');
                  });
                },
                child: Container(
                  child: Text(
                    'Present',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    present = false;
                  });
                  markAttn(present);
                  Navigator.pop(context);
                  loadAttendance();
                  setState(() {
                    isLoading = true;
                    print('loading');
                  });
                },
                child: Container(
                  child: Text(
                    'Absent',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        bottomNavigationBar: BottomBar(),
        body: isLoading
            ? Loading()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pageTitle('Attendance'),
                      Center(
                        child: CircularPercentIndicator(
                          radius: 120.0,
                          backgroundColor: Colors.red.withOpacity(0.8),
                          lineWidth: 13.0,
                          animation: true,
                          percent: attendance,
                          center: Text(
                            "$attendancePercent%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          // footer: Text(
                          //   "Attendance",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 20.0),
                          // ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.green[600],
                        ),
                      ),
                      headerTheme(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          data('$totalAttendance', 'Total'),
                          data('$totalPresent', 'Attended'),
                          data('$totalAbsent', 'Missed')
                        ],
                      )),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => popUp());
                        },
                        child: headerTheme(Center(
                          child: Text(
                            'MARK ATTENDANCE HERE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection(Constants.ATTENDANCECOLLECTION)
                            .doc(user.email)
                            .collection(Constants.USERATTENDANCE)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot mypost =
                                      snapshot.data.documents[index];
                                  bool attendance =
                                      mypost.get(Constants.PRESENT);
                                  String date = mypost.get(Constants.DATE);

                                  return day(date, attendance);
                                });
                          } else {
                            return Loading();
                            // print('nothing');
                          }
                        },
                      ),

                      // day(true),
                      // day(true),
                      // day(false),
                    ],
                  ),
                ),
              ));
  }
}
