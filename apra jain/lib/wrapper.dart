import 'package:dsc_app/pages/home/home.dart';
import 'package:dsc_app/pages/home/user_home.dart';
import 'package:dsc_app/pages/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'models/appbar.dart';

class WrapperPage extends StatefulWidget {
  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    isLoggedIn = user != null ? true : false;
    callHomePage();
  }

  callHomePage() async {
    await Future.delayed(Duration(seconds: 2));
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => UserHome()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }
  // Widget customBox(data, Color color) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  //     padding: EdgeInsets.all(15),
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(30),
  //       color: color,
  //     ),
  //     child: Center(
  //       child: Text(
  //         data,
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageTitle('Welcome'),
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Center(child: CircularProgressIndicator()),
                      Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Image(
                          //placeholder: kTransparentImage,
                          image: AssetImage('assets/dscdiversity.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/dsclogo.png'),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'DSC AKGEC',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Loading(),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.pushReplacement(context,
              //           MaterialPageRoute(builder: (_) => LoginPage()));
              //     },
              //     child: customBox('A Member', CustomColor.BEIGE)),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.pushReplacement(
              //           context, MaterialPageRoute(builder: (_) => HomePage()));
              //     },
              //     child: customBox('Not a Member', CustomColor.AMBER)),
            ],
          ),
        ),
      ),
    );
  }
}
