import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';


class GenresPage extends StatelessWidget {
  User user;
  GenresPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: Text(
                  "Select or unselect your genres of interest.",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kPrimaryLightColor
                  )
                ),
              ),
              GenresGrid(Genre.getMockGenres())
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: Text("Genres"),
      ),
    );
  }
}