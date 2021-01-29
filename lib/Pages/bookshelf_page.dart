import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/bookself_list_grid.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';

class BookshelfPage extends StatelessWidget {
  User user;
  bool scrollToLastPosition;

  BookshelfPage(this.user, {this.scrollToLastPosition = false});

  @override
  Widget build(BuildContext context) {
    if (!scrollToLastPosition) _addReadListToLastPosition();

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      body: BooskelfGridList(user, scrollToLastPosition: scrollToLastPosition),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: Text(
          "Bookshelf " +
              "(" +
              user.lectures.length.toString() +
              BOOKSHELF_LIST +
              ")",
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  _addReadListToLastPosition() {
    List<Lecture> read = user.lectures[READ_LIST];
    user.lectures.remove(READ_LIST);
    user.lectures[READ_LIST] = read;
  }
}
