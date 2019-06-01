import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ChatMainScreen.dart';
import 'package:flutter_hackathon/Utils/Constants.dart';
import 'package:flutter_hackathon/Utils/text_style.dart';

class ListItemContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListItemContainer();
  }
}

class _ListItemContainer extends State {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatMainScreen();
        }));
      },
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: purple, child: Icon(Icons.add_a_photo)),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "chat",
                        style: Style.mediumTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("message", style: Style.smallTextStyle),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
