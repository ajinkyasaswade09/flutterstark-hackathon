import 'package:flutter/material.dart';

import 'ChatMessageScreen.dart';
import 'Utils/Constants.dart';
import 'Utils/text_style.dart';
import 'model/users.dart';

class ListItemContainer extends StatefulWidget {
  Users useritem;

  ListItemContainer(this.useritem);

  @override
  State<StatefulWidget> createState() {
    return _ListItemContainer(useritem);
  }
}

class _ListItemContainer extends State {
  Users useritem;

  _ListItemContainer(this.useritem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatMessageScreen();
        }));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [new BoxShadow(color: white)],
                borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0))),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: purple,
                    child: Image.asset(useritem.photoUrl)),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        useritem.name,
                        style: Style.mediumTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("", style: Style.smallTextStyle),
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
