import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/bookself_list_grid.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';


class GenresPage extends StatelessWidget {

  GenresPage();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      body: Container(),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: Text("Genres"),
      ),
    );
  }
}