import 'package:flutter/material.dart';

import 'ChatListScreen.dart';
import 'Utils/Constants.dart';
import 'Utils/CustomPainter.dart';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool _validate = false;
  String mpassword, mMobileNumber;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences prefs;

  bool isLoading = false;
  bool isLoggedIn = false;
  FirebaseUser currentUser;

  TextEditingController passWordController = TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }


  void isSignedIn() async {
    this.setState(() {
      isLoading = true;
    });

    prefs = await SharedPreferences.getInstance();

    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      _onLoginButtonClicked();
    }

    this.setState(() {
      isLoading = false;
    });
  }

  Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser firebaseUser = await firebaseAuth.signInWithCredential(credential);

    if (firebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result =
      await Firestore.instance.collection('users').where('id', isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .setData({'nickname': firebaseUser.displayName, 'photoUrl': firebaseUser.photoUrl, 'id': firebaseUser.uid});


        // Write data to local
        currentUser = firebaseUser;
        print('name '+currentUser.displayName);
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('nickname', currentUser.displayName);
        await prefs.setString('photoUrl', currentUser.photoUrl);
      } else {
        // Write data to local
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('nickname', documents[0]['nickname']);
        await prefs.setString('photoUrl', documents[0]['photoUrl']);
        await prefs.setString('aboutMe', documents[0]['aboutMe']);
      }
      Fluttertoast.showToast(msg: "Sign in success");
      this.setState(() {
        isLoading = false;
      });

      _onLoginButtonClicked();
    } else {
      Fluttertoast.showToast(msg: "Sign in fail");
      this.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(overflow: Overflow.visible, children: <Widget>[
            CustomPaint(
              painter: CustomBackgroundPainter(),
              child: Container(
                height: double.infinity,
              ),
            ),
            TopView(),
            Positioned(
              top: 500.0,
              left: 50.0,
              child: new Row(children: <Widget>[
                Container(
                  child: Text(
                    "Sign In with Google",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: "Montserrat",
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                new Container(
                  height: 80.0,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: new RaisedButton(
                      color: purpleLight,
                      elevation: 5.0,
                      shape: new CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      onPressed: handleSignIn,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFffffff),
                        size: 30.0,
                      )),
                ),
              ]),
            )
          ]),
        ));
  }

  void _onLoginButtonClicked() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatListScreen();
    }));
//  Navigator.of(context).popAndPushNamed("/home");

    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}

class TopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180.0,
      left: 30.0,
      child: Text(
        "Welcome",
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: white,
            fontFamily: "Montserrat"),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final text;
  final IconData _prefixIcon;

  CustomTextFormField(this.text, this._prefixIcon);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 18,
        fontFamily: "Montserrat",
      ),
      decoration: new InputDecoration(
        hintText: text,
        prefixIcon: Icon(
          _prefixIcon,
          color: Colors.green,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.only(left: 14.0, bottom: 15.0, top: 15.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
    );
//    return Container(
//      height: 50.0,
//      child: ,
//    );
  }
}
