import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Pages/profile_page.dart';



class VerticalUserList extends StatefulWidget {

  VerticalUserList(this.users); // : super(key: key);

  final List<User> users;

  @override
  _VerticalUserList createState() => _VerticalUserList();
}

class _VerticalUserList extends State<VerticalUserList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: _makeBody(),
    );
  }

  _makeCard(int index) {
    return  GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage(widget.users[index], ProfileType.friend_profile)));
      },
      //child: UserPreviewCard(widget.users[index]),
      child: UserPreviewCard(widget.users[index], padding: 5, fontSize: 26,),
    );
  }

  _makeBody() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.users.length,
        itemBuilder: (BuildContext context, int index) {
          return _makeCard(index);
        },
      ),
    );
  }
}