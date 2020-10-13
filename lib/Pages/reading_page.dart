import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list.dart';
import 'package:bookifyapp/Models/Book.dart';


class ReadingPage extends StatelessWidget {

  ReadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<User>(
          builder: (context, user, child) =>
              VerticalBookList(user.lectures["Reading"], user.lectures["Pending"])),
    );
  }
}