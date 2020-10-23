import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4,
                  fontFamily: 'Comfortaa',
                  fontSize: 35.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Image(
                image: AssetImage(
                  'images/dscabout.png',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'A Developer Student Clubs is a Google recognized student body at a college which directly reports to Google for their activites and is supported by the tech giant\n\nA DSC conducts workshops,seminars and other fun activites which help the students conect with Google.\n\nDeveloper Student Club AKGEC is inspired by Google Developer Family.We try to engage student developers through our hacks events, codelabs and meetups.The motive is to create a local ecosystem of programmers & hackers in and around the Campus.The technology awareness is main goal for first few years of the group.',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
