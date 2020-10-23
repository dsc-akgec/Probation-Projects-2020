import 'package:dsc_app/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.black),
          appBarTheme: (AppBarTheme(
              textTheme:
                  GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.black)))),
      home: WrapperPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
