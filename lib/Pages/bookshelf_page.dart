import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/bookself_list_grid.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';


class BookshelfPage extends StatelessWidget {

  User user;
  bool scrollToLastPosition;

  BookshelfPage(
      this.user,

      {
        this.scrollToLastPosition = false }
      );

  @override
  Widget build(BuildContext context) {

    if(! scrollToLastPosition)
      _addReadListToLastPosition();

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      body: BooskelfGridList(user, scrollToLastPosition: scrollToLastPosition),//_getListView(),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: Text(
            "Bookshelf (" + user.lectures.length.toString() + " lists)",
            overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  _addReadListToLastPosition(){
    List<Lecture> read = user.lectures['Read'];
    user.lectures.remove('Read');
    user.lectures['Read'] = read;
  }

}