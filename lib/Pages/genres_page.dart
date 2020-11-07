import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/SizeConfig.dart';
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
          padding: EdgeInsets.fromLTRB(
              (1.21 * SizeConfig.widthMultiplier),
              (1.46 * SizeConfig.heightMultiplier),
              (1.21 * SizeConfig.widthMultiplier),
              (1.46 * SizeConfig.heightMultiplier)
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    (1.21 * SizeConfig.widthMultiplier),
                    0,
                    (1.21 * SizeConfig.widthMultiplier),
                    (1.46 * SizeConfig.heightMultiplier)
                ),
                child: Text(
                  "Select or unselect your genres of interest.",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (2.92 * SizeConfig.textMultiplier),
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