import 'package:flutter/material.dart';
import 'package:flutter_hackathon/Utils/Constants.dart';
import 'package:flutter_hackathon/Utils/CustomPainter.dart';
import 'package:flutter_hackathon/Utils/SizeConfig.dart';
import 'package:flutter_hackathon/Utils/text_style.dart';

class ChatMainScreen extends StatefulWidget {
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Container(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        topProfileView(),
        Expanded(child: ListView()),
        Padding(
          padding: EdgeInsets.only(bottom: 50.0, left: 10.0, right: 10.0),
          child: TextFormField(
            style: TextStyle(
              fontSize: 18,
              color: purpleDark,
              fontFamily: 'Montserrat',
            ),
            decoration: new InputDecoration(
              hintText: "Type here",
              suffixIcon: GestureDetector(
                onTap: () {
//                  _onSendClick();
                },
                child: Icon(
                  Icons.send,
                  color: purpleDark,
                ),
              ),
              filled: true,
              fillColor: purpleLighter,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 15.0, top: 15.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: white),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
          ),
        ),
      ],
    ))));
  }

  Widget topProfileView() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        CustomPaint(
          painter: ChatPainter(),
          child: Container(
            height: 120,
          ),
        ),
        Positioned(
            top: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 44,
            child: Text(
              "User",
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
            )),
        Positioned(
            top: SizeConfig.blockSizeVertical * 4,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.account_circle,
                color: white,
                size: 40.0,
              ),
            )),
        /* Positioned(
        top: 150.0,
        left: 30.0,
        child: searchBar(),
      )*/
      ],
    );
  }

  void _onSendClick(String content) {
    /*  // type: 0 = text, 1 = image, 2 = sticker
      if (content.trim() != '') {
        textEditingController.clear();

        var documentReference = Firestore.instance
            .collection('messages')
            .document(groupChatId)
            .collection(groupChatId)
            .document(DateTime.now().millisecondsSinceEpoch.toString());

        Firestore.instance.runTransaction((transaction) async {
          await transaction.set(
            documentReference,
            {
              'idFrom': id,
              'idTo': peerId,
              'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
              'content': content,
              'type': type
            },
          );
        });
        listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      } else {
        Fluttertoast.showToast(msg: 'Nothing to send');
      }*/
    }
}
