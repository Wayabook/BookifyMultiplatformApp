import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {

  Genre genre;
  double width;
  double height;

  GenreContainer(this.genre, {this.width = 110, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryLightColor
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/" + genre.picture,
                  height: 50,
                  width: 50,
                ),

                Text(genre.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kPrimaryDarkColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
        )
    );
  }
}