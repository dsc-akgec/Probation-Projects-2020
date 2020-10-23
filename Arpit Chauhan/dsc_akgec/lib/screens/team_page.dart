import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Our Team'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.crown,
                            color: Colors.yellow[700],
                          ),
                        ),
                        Text(
                          'Team Lead',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TeamList('Mansi Goel'),
                  SizedBox(
                    height: 22.0,
                  ),
                  Center(
                    child: Text(
                      'Cooridnators',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TeamList('Apoorv Jain'),
                  TeamList('Rishabh Singh'),
                  TeamList('Himani Chauhan'),
                  TeamList('Tarun Raghav'),
                  TeamList('Krishna Agarwal'),
                  TeamList('Shivan Bisht'),
                  TeamList('Pranjul Itondia'),
                  TeamList('Shatakshi Upadhyay'),
                  TeamList('Hitesh Tripathi'),
                  TeamList('Ayushi Bansal'),
                  TeamList('Vishesh kushwaha'),
                  TeamList('Anshika Bajpai'),
                  TeamList('Pranjal Maurya'),
                  TeamList('Vishesh Dhawan'),
                  TeamList('Nihal MB Choudhary'),
                  TeamList('Nirbhay Shukla'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamList extends StatelessWidget {
  TeamList(String name) {
    this.name = name;
  }
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 100, 100, 0.4),
            blurRadius: 10.0,
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: 5.0),
      child: ListTile(
          tileColor: Colors.grey[100],
          leading: Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('images/dummy_profile.jpg'),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceCodePro',
              letterSpacing: 1.2,
              fontSize: 18.0,
            ),
          )),
    );
  }
}
