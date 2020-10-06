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
      backgroundColor: Colors.blueGrey,
      body: BooskelfGridList(user, scrollToLastPosition: scrollToLastPosition),//_getListView(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Bookshelf (" + user.lectures.length.toString() + " lists)"),
      ),
    );
  }

  _addReadListToLastPosition(){
    List<Lecture> read = user.lectures['Read'];
    user.lectures.remove('Read');
    user.lectures['Read'] = read;
  }

}