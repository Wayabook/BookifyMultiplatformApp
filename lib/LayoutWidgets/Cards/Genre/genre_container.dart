import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {
  static const double DEFAULT_WIDTH_FACTOR = 16.17;
  static const double DEFAULT_BORDER_FACTOR = 4.86;
  static const double IMAGE_HEIGHT_FACTOR = 7.32;

  Genre genre;
  double width;
  double height;

  GenreContainer(this.genre, {this.width = 0, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    this.width = (this.width == 0)
        ? (DEFAULT_WIDTH_FACTOR * SizeConfig.widthMultiplier)
        : this.width;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                (DEFAULT_BORDER_FACTOR * SizeConfig.imageSizeMultiplier)),
            color: kPrimaryLightColor),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/" + genre.picture,
              height: (IMAGE_HEIGHT_FACTOR * SizeConfig.heightMultiplier),
              width: (TEXT_FACTOR_50 * SizeConfig.widthMultiplier),
            ),
            Text(
              genre.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier)),
            )
          ],
        )));
  }
}
