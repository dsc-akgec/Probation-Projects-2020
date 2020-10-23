import 'package:dsc_app/models/appbar.dart';
import 'package:dsc_app/pages/team/dummyprofile.dart';
import 'package:flutter/material.dart';

import 'team-names.dart';

class Team extends StatelessWidget {
  //details[i]['name']
  Widget member(name, domain) {
    return Container(
      //margin: EdgeInsets.all(10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber[300],
            radius: 30,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            domain,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageTitle('Know our Team'),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DummyProfile(
                                name: 'Mansi Goel', domain: 'Management')));
                  },
                  child: Column(
                    children: [
                      Text(
                        'DSC Lead',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[700]),
                      ),
                      SizedBox(height: 12),
                      CircleAvatar(
                        backgroundColor: Colors.amber[400],
                        radius: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Mansi Goel',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Management',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  for (int i = 0; i < details.length; i++)
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DummyProfile(
                                      name: details[i]['name'],
                                      domain: details[i]['domain'])));
                        },
                        child:
                            member(details[i]['name'], details[i]['domain'])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
