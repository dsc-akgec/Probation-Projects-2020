import 'package:dsc_app/constants/color_palette.dart';
import 'package:dsc_app/constants/constants.dart';
import 'package:dsc_app/pages/home/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'register.dart';

class LoginPage extends StatelessWidget {
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
      final User user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      print(user.displayName);
      print("logged in");

      bool isRegistered = await checkExist(user.uid);
      if (isRegistered) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => UserHome()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Register()));
      }
    } catch (e) {
      print(e);
      // print("cant logggin");
    }
  }

  Future<bool> checkExist(String docID) async {
    bool exists = false;
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection(Constants.USERCOLLECTION)
        .doc(docID)
        .get();
    exists = ds.exists;
    return exists;
  }

  Widget googleButton(context) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        gsignin(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //color: CustomColor.BURGANDY,
        color: CustomColor.BGBLUE,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'DSC Member?',
            style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, // color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              gsignin(context);
            },
            child: Text(
              'Login here',
              style: TextStyle(
                  fontSize: 14,
                  color: CustomColor.BLUE,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     physics: BouncingScrollPhysics(),
    //     child: Container(
    //         margin: EdgeInsets.only(top: 30),
    //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //         child: Column(
    //           children: [
    //             Align(
    //               alignment: Alignment.topLeft,
    //               child: Text(
    //                 'Sign In',
    //                 style: TextStyle(color: Colors.black, fontSize: 25),
    //               ),
    //             ),
    //             SizedBox(height: 25),
    //             Image(
    //               image: AssetImage("assets/dschome.png"),
    //               width: double.infinity,
    //               //height: 50,
    //               //height: MediaQuery.of(context).size.height * 0.035,
    //             ),
    //             SizedBox(height: 20),
    //             Text(
    //               'Developer Student Club AKGEC',
    //               style: TextStyle(
    //                 color: Colors.blue[800],
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 20,
    //               ),
    //             ),
    //             SizedBox(height: 15),
    //             // Image(
    //             //   image: AssetImage('assets/dschome.png'),
    //             //   width: double.infinity,
    //             //   //height: MediaQuery.of(context).size.width * 0.5,
    //             // ),
    //             SizedBox(height: 40),
    //             googleButton(context),
    //           ],
    //         )),
    //   ),
    // );
  }
}
