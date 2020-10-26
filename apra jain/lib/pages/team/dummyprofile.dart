import 'package:dsc_app/models/theme.dart';
import 'package:dsc_app/pages/profile/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DummyProfile extends StatelessWidget {
  String name, domain;
  DummyProfile({@required this.name, @required this.domain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.amber[300],
                    radius: 60,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              info(domain),
              SizedBox(height: 5),
              info('Year, Branch'),
              divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customRow(Icons.mail, 'Email'),
                  customRow(Icons.phone_android, 'Call'),
                  customRow(
                    FontAwesomeIcons.github,
                    'Github',
                  ),
                ],
              ),
              divider(),
              element(Align(
                  alignment: Alignment.centerLeft,
                  child: elementText('bio here'))),
              element(
                Row(
                  children: [
                    elementText('Attendance Percentage'),
                    Spacer(),
                    elementText('79%')
                  ],
                ),
              ),
              element(Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      elementText('Active Projects'),
                      elementText('5')
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      elementText('Projects Completed'),
                      elementText('13'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      elementText('For more information visit '),
                      elementText('Github.'),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
