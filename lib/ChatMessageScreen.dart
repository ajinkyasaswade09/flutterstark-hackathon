import 'package:flutter/material.dart';

import 'Utils/CustomPainter.dart';
import 'Utils/text_style.dart';

class ChatMessageScreen extends StatefulWidget {
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMessageScreen> {
  TextEditingController emailController = new TextEditingController();

  List<String> messages = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Container(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomPaint(
          painter: ChatPainter(),
          child: Container(
            height: 100,
          ),
        ),
        Expanded(
            child: new ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        elevation: 4,
                        margin: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(messages[index],
                              style: Style.mediumTextStyle),
                        )),
                  );
                })),
        Padding(
          padding: EdgeInsets.only(bottom: 50.0, left: 10.0, right: 10.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
                prefixIcon: IconButton(
              icon: Icon(Icons.send),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                setState(() {
                  messages.add(emailController.text);
                  emailController.clear();
                });
              },
            )),
          ),
        ),
      ],
    ))));
  }
}
