import 'package:dsc_akgec/screens/about_page.dart';
import 'package:dsc_akgec/screens/events_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dsc_akgec/screens/team_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DSC_home extends StatefulWidget {
  @override
  _DSC_homeState createState() => _DSC_homeState();
}

class _DSC_homeState extends State<DSC_home> {
  String contactmessage;
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image(
                image: AssetImage('images/google.png'),
              ),
            ),
            Text(
              'Developer Student Club AKGEC',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/try1.png'),
                    fit: BoxFit.fill,
                    repeat: ImageRepeat.noRepeat,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20.0)),
                ),
                child: Stack(
                  children: [
                    // Image(
                    //   image: AssetImage('images/try1.png'),
                    //   height: double.infinity,
                    //   fit: BoxFit.fill,
                    // ),
                    Positioned(
                      top: 15.0,
                      left: 100.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.calendarAlt,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Events();
                              }));
                            },
                            iconSize: 50.0,
                          ),
                          Text('Events'),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90.0,
                      left: 20.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.supervisor_account),
                            color: Colors.blueAccent,
                            iconSize: 60.0,
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Team();
                            })),
                          ),
                          Text(
                            'Team',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 160.0,
                      left: 100.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.account_box_outlined),
                            color: Colors.blueGrey,
                            iconSize: 60.0,
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return About();
                            })),
                          ),
                          Text(
                            'About Us',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 15.0,
                      right: 100.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.green[700],
                            ),
                            iconSize: 50.0,
                            onPressed: () {
                              launchURL('https://dsc.community.dev/');
                            },
                          ),
                          Text(
                            ' DSC',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90.0,
                      right: 20.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.addressCard,
                              color: Colors.blue[700],
                            ),
                            iconSize: 50.0,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Container(
                                        height: 260.0,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          140, 148, 251, 0.2),
                                                      blurRadius: 20.0,
                                                    ),
                                                  ],
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                                ),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Message :-',
                                                  ),
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  style: TextStyle(
                                                    backgroundColor:
                                                        Colors.grey[200],
                                                    fontSize: 19.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLength: 150,
                                                  maxLines: 6,
                                                  maxLengthEnforced: true,
                                                  onChanged: (value) {
                                                    contactmessage = value;
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                iconSize: 30.0,
                                                padding: EdgeInsets.only(
                                                    left: 250.0),
                                                icon: Icon(
                                                  Icons.send,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: () async {
                                                  var url =
                                                      'mailto:dscakgec@gmail.com?subject=Contact&body=$contactmessage';
                                                  if (await canLaunch(url)) {
                                                    await launch(url);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                          Text(
                            'Contact Us',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 166.0,
                      right: 100.0,
                      child: Column(
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.book,
                              color: Colors.yellow[700],
                            ),
                            iconSize: 50.0,
                            onPressed: () {
                              launchURL('https://github.com/dsc-akgec');
                            },
                          ),
                          Text(
                            'Projects',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5.0,
                      left: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.black,
                            ),
                            iconSize: 40.0,
                            onPressed: () {
                              launchURL('https://github.com/dsc-akgec');
                            },
                          ),
                          SizedBox(
                            width: 35.0,
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              launchURL('https://www.instagram.com/dsc_akgec/');
                            },
                            iconSize: 40.0,
                          ),
                          SizedBox(
                            width: 35.0,
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.youtube,
                              color: Colors.red,
                            ),
                            iconSize: 40.0,
                            onPressed: () => launchURL(
                                'https://www.youtube.com/channel/UCZvNkM_UNgR4_2fQpBqvWUw'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
