import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {

  Genre genre;
  double width;
  double height;

  GenreContainer(this.genre, {this.width = 0, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    if(this.width == 0)
      this.width = (16.17 * SizeConfig.widthMultiplier);
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((4.86 * SizeConfig.imageSizeMultiplier)),
            color: kPrimaryLightColor
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/" + genre.picture,
                  height: (7.32 * SizeConfig.heightMultiplier),
                  width: (12.16 * SizeConfig.widthMultiplier),
                ),

                Text(genre.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kPrimaryDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: (2.04 * SizeConfig.textMultiplier)
                  ),
                )
              ],
            )
        )
    );
  }
}