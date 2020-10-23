import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/root_loggedin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/root_loggedout_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: RootPage());
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool isLoggedin;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    isLoggedin = user == null ? false : true;
    change();
  }

  change() async {
    await Future.delayed(Duration(seconds: 3));
    if (isLoggedin) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootLoggedIn()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootLoggedOut()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.PRIMARY_DARK,
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/logo.png'),
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(height: 20),
            Text(
              'Developer\'s Student Club',
              style: TextStyle(fontSize: Unit.FONT_LARGER, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'AKGEC',
              style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white60),
            ),
            SizedBox(height: 100),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
