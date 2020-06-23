import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';

class ProfileInfo extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  /*final Book book;*/
  final double height;
  final double circleRadius = 120.0;
  final double circleBorderWidth = 8.0;

  ProfileInfo(
      /*this.book,*/ {
        this.height = 100.0,
      });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Column(
      children: <Widget>[
        ProfilePicture('https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg'),

        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              "Bill Gates",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Text(
            "\"Not as good as Steve Jobs\"",
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}