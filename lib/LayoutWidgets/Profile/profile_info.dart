import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';

class ProfileInfo extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  /*final Book book;*/
  final double height;
  final double circleRadius = 120.0;
  final double circleBorderWidth = 8.0;

  User user;

  ProfileInfo(
      this.user, {
        this.height = 100.0,
      });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Column(
      children: <Widget>[
        ProfilePicture(user.profilePictureUrl),

        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}