import 'package:dsc_akgec/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DSC_home();
      }));
    }
        //     () async {
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        //   var email = prefs.getString('email');
        //   print(email);
        //   if (email == null) {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return LoginPage();
        //     }));
        //   } else {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return HomePage();
        //     }));
        //   }
        // },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05dbf2),
      body: Stack(
        children: [
          Image(
            image: AssetImage('images/bg2.png'),
            height: double.maxFinite,
          ),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 150.0,
                    backgroundImage: AssetImage('images/dsc.jpg'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
