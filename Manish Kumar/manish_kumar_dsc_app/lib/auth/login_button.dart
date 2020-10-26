import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/constants/color_palatte.dart';
import 'package:dsc_app/constants/config.dart';
import 'package:dsc_app/constants/units.dart';
import 'package:dsc_app/views/root_loggedin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'register.dart';

class LoginButton extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void gsignin(context) async {
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      final User user = (await _firebaseAuth.signInWithCredential(credential)).user;
      print(user.displayName);
      print("logged in");

      bool isRegistered = await checkExist(user.uid);
      if (isRegistered) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootLoggedIn()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Register()));
      }
    } catch (e) {
      print(e);
      // print("cant logggin");
    }
  }

  Future<bool> checkExist(String docID) async {
    bool exists = false;
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection(Config.USER_COLLECTION).doc(docID).get();
    exists = ds.exists;
    return exists;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gsignin(context),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: Unit.V_MARGIN, horizontal: Unit.H_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colors.black54,
          color: ColorPalette.RED
        ),
        child: Row(
          children: [
            Container(
              height: 15,
              width: 5,
              color: ColorPalette.GREEN,
            ),
            SizedBox(width: 5),
            Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Unit.FONT_MEDIUM, color: ColorPalette.SELECTED_NAV_BAR),
            ),
            Spacer(),
            Text(
              "DSC member login here",
              style: TextStyle(
                  fontSize: Unit.FONT_SMALL, color: ColorPalette.SELECTED_NAV_BAR, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
