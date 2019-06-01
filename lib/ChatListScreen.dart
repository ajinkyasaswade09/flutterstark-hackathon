import 'package:flutter/material.dart';
import 'package:flutter_stark_hackathon/model/users.dart';

import 'ListItemContainer.dart';
import 'Utils/Constants.dart';
import 'Utils/CustomPainter.dart';
import 'Utils/text_style.dart';



/*List<Users> users = [
  Users('Neha','assets/images/american.png','abcd'),
  Users('Neha','assets/images/american.png','abcd'),
  user('Neha','assets/images/american.png','abcd'),
  user('Neha','assets/images/american.png','abcd')

];*/

class ChatListScreen extends StatelessWidget {
  List<Users> users;

  ChatListScreen(this.users);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            topStackView(),
            Expanded(child: ChatListContainer(users))
          ],
        ),
      ),
    );
  }
}

Widget topStackView() {
  return Stack(
    overflow: Overflow.visible,
    children: <Widget>[
      CustomPaint(
        painter: ChatPainter(),
        child: Container(
          height: 150,
        ),
      ),
      Positioned(
          top: 50.0,
          left: 200.0,
          child: Text(
            chatListScreen,
            style: Style.appBarTitleBoldStyle,
          )),
      Positioned(
          top: 40.0,
          left: 20.0,
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios,
              color: white,
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

Widget searchBar() {
  return Container(
    child: TextFormField(
      style: TextStyle(
        fontSize: 18,
        color: white,
        fontFamily: 'Raleway',
      ),
      decoration: new InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: white,
        ),
        filled: true,
        fillColor: Colors.white,
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
  );
}

class ChatListContainer extends StatelessWidget {
  List<Users> users;
  ChatListContainer(this.users);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            padding: EdgeInsets.only(top: 30.0),
            itemBuilder: (context, index) => ListItemContainer(users[index]),
            itemCount: users.length));
  }
}
