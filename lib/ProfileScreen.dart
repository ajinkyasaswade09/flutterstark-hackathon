import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'Utils/Constants.dart';
import 'Utils/CustomPainter.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/text_style.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  //save the result camera or gallery file
  File imageFile;

//  User user;

  _ProfileState();

  @override
  void initState() {
//    user = sharedUser;
  }

  @override
  Widget build(BuildContext context) {
    //user =  getUserDetailQuerySnapShot() as User;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            profileView(context),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: ListView(
                    padding: const EdgeInsets.all(20.0),
                    children: <Widget>[
                      new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[],
                      )),
                      //Todo enable this when DB storage integration is done
                      //displaySelectedFile(imageFile),
                      new Container(
                          margin: const EdgeInsets.only(top: 40.0),
                          child: Text("User Name: User",
                              style: Style.mediumTextStyle)),

                      new Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Text("Email: email",
                              style: Style.mediumTextStyle)),
                      new Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Text("Phone: 9876543211",
                              style: Style.mediumTextStyle)),
                    ],
                  )),
            ),
          ],
        )));
  }

  ///Display selected image file
  Widget displaySelectedFile(File file) {
    return GestureDetector(
        onTap: _showDialog,
        child: Center(
            child: Container(
                margin: const EdgeInsets.only(top: 40.0),
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: file == null
                          ? AssetImage('assets/images/user_profile.png')
                          : FileImage(file),
                    )))));
  }

  // function to show dialog
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(selectImage),
          content: new Text(selectImageMessage),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text(
                galleryText,
                style: Style.mediumTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _imageSelectorGallery();
              },
            ),
            new FlatButton(
              child: Text(cameraText, style: Style.mediumTextStyle),
              onPressed: () {
                Navigator.of(context).pop();
                _imageSelectorCamera();
              },
            ),
          ],
        );
      },
    );
  }

  //display image selected from gallery
  _imageSelectorGallery() async {
    imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      // maxHeight: 50.0,
      // maxWidth: 50.0,
    );
    setState(() {});
  }

  //display image selected from camera
  _imageSelectorCamera() async {
    imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      //maxHeight: 50.0,
      //maxWidth: 50.0,
    );
    setState(() {});
  }

  profileView(BuildContext context) {
    return Stack(overflow: Overflow.visible, children: <Widget>[
      CustomPaint(
        painter: ChatPainter(),
        child: Container(
          height: 120,
        ),
      ),
      Positioned(
          top: SizeConfig.blockSizeVertical * 5,
          left: SizeConfig.blockSizeHorizontal * 42,
          child: Text(
            profileScreen,
            style: Style.appBarTitleBoldStyle,
          )),
      Positioned(
          top: SizeConfig.blockSizeVertical * 4,
          left: SizeConfig.blockSizeHorizontal * 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
          ))
    ]);
  }

//  String validateName(String value) {
//    String patttern = r'(^[a-zA-Z ]*$)';
//    RegExp regExp = new RegExp(patttern);
//    if (value.length == 0) {
//      return "Name is Required";
//    } else if (!regExp.hasMatch(value)) {
//      return "Name must be a-z and A-Z";
//    }
//    return null;
//  }
//
//  String saveName(String val) {
//    mname = isFromMore ? user.name : val;
//    return val;
//  }
//
//  String validateEmail(String value) {
//    String pattern =
//        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//    RegExp regExp = new RegExp(pattern);
//    if (value.length == 0) {
//      return "Email is Required";
//    } else if (!regExp.hasMatch(value)) {
//      return "Invalid Email";
//    } else {
//      return null;
//    }
//  }
//
//  String saveEmail(String val) {
//    memail = isFromMore ? user.email : val;
//    return val;
//  }
//
//  String validatePassword(String value) {
//    String patttern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
//    RegExp regExp = new RegExp(patttern);
//    if (value.length == 0) {
//      return "Password is Required";
//    } else if (!regExp.hasMatch(value)) {
//      return "Password must contain alphanumeric value";
//    }
//    return null;
//  }
//
//  String savePassword(String val) {
//    mpassword = val;
//    return val;
//  }
//
//  String validateConfirmPassword(String value) {
//    print(passWordController.text);
//    print(compiltpassWordController.text);
//    if (value.length == 0) {
//      return "Password is Required";
//    } else if (passWordController.text != compiltpassWordController.text) {
//      return "Password not match";
//    }
//    return null;
//  }
//
//  String saveConfirmPassword(String val) {
//    mconfirmPassword = val;
//    return val;
//  }
//
//  String validateMobile(String value) {
//    String patttern = r'(^[0-9]*$)';
//    RegExp regExp = new RegExp(patttern);
//    if (value.length == 0) {
//      return "Mobile is Required";
//    } else if (value.length != 10) {
//      return "Mobile number must 10 digits";
//    } else if (!regExp.hasMatch(value)) {
//      return "Mobile Number must be digits";
//    }
//    return null;
//  }
//
//  String saveMobileNUmber(String val) {
//    mMobileNumber = val;
//    return val;
//  }
}
