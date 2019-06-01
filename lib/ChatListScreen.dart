import 'package:flutter/material.dart';

import 'ListItemContainer.dart';
import 'ProfileScreen.dart';
import 'Utils/Constants.dart';
import 'Utils/CustomPainter.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/text_style.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            topStackView(context),
            Expanded(child: ChatListContainer())
          ],
        ),
      ),
    );
  }
}

Widget topStackView(BuildContext context) {
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
            chatListScreen,
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
          right: SizeConfig.blockSizeHorizontal * 6,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileScreen();
              }));
            },
            child: Image.asset(
              "assets/images/user.png",
              width: 30.0,
              height: 30.0,
              color: white,
            ),
          )),
      /* Positioned(
         top: SizeConfig.blockSizeVertical * 6,
         right: SizeConfig.blockSizeHorizontal * 3,
         child: Container(
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
         ),
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
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            padding: EdgeInsets.only(top: 30.0),
            itemBuilder: (context, index) => ListItemContainer(),
            itemCount: 16));
  }
}
