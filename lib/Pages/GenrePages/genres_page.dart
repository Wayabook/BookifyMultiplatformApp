import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';

// ignore: must_be_immutable
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
            (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
            (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
                  (PADDING_FACTOR_0),
                  (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
                  (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                ),
                child: Text(SELECT_GENRE,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (TEXT_FACTOR_20 * SizeConfig.textMultiplier),
                        color: kThirdDarkColor)),
              ),
              GenresGrid(Genre.getMockGenres())
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        iconTheme: IconThemeData(
          color: kThirdDarkColor, //change your color here
        ),
        title: Text(
          GENRES_TITLE,
          style: TextStyle(color: kThirdDarkColor),
        ),
      ),
    );
  }
}
