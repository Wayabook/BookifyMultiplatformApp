
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {

  CommentCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      //margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Column(
        children: <Widget>[
          UserPreviewCard(new User(
              "1",
              "Bill Gates",
              "\"Not as good as Steve Jobs\"",
              null,
              null,
              21,
              198,
              345,
              "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4"
          ), height: 50, fontSize: 15, card: false,),
        ],
      )
    );
    /*return Container(
        height: 70,
        child: UserPreviewCard(new User(
            "1",
            "Bill Gates",
            "\"Not as good as Steve Jobs\"",
            null,
            null,
            21,
            198,
            345,
            "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4"
        ), height: 70, fontSize: 10,),
        //child:
    );*/
  }
}