import 'dart:ui';

import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'Utils/Constants.dart';
import 'Utils/CustomPainter.dart';
import 'Utils/text_style.dart';

class SplashScreen extends StatelessWidget {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                CustomPaint(
                  painter: CustomBackgroundPainter(),
                  child: Container(
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 200.0,
                  right: 100.0,
                  left: 100.0,
                  bottom: constraints.maxHeight - 550.0,
                  child: splashGif(),
                ),
                Positioned(
                  top: constraints.maxHeight - 50.0,
                  right: 50.0,
                  child: RaisedButton(
                    color: purple,
                    child: Text(
                      "Login",
                      style: Style.largeTextBoldStyle,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }

  splashGif() {
    AssetImage assetImage = AssetImage('assets/images/splash_chat.gif');
    Image image = Image(
      height: 25.0,
      width: 25.0,
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}

class SplashScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/chat_splash_img.jpg'),
          repeat: ImageRepeat.repeat,
          fit: BoxFit.scaleDown,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1))),
      ),
    );
  }
}
