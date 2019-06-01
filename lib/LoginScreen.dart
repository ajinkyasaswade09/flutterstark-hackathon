import 'package:flutter/material.dart';

import 'ChatListScreen.dart';
import 'Utils/Constants.dart';
import 'Utils/CustomPainter.dart';
import 'data/users_repo.dart';
import 'model/users.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool _validate = false;
  String mpassword, mMobileNumber;
  List<Users> userList;

  TextEditingController passWordController = TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();

  @override
  void initState() {
    super.initState();
    userList= UsersRepo().getUserList();
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
                  onPressed: _onLoginButtonClicked,
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
      return ChatListScreen(userList);
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
