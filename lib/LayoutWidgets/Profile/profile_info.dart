import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';

class ProfileInfo extends StatelessWidget {

  static const POSTER_RATIO = 0.7;
  final double height;
  final double circleRadius = 120.0;
  final double circleBorderWidth = 8.0;

  User user;
  Color nameColor;

  ProfileInfo(
      this.user, {
        this.height = 100.0,
        this.nameColor = kPrimaryLightColor,
      });

  @override
  Widget build(BuildContext context) {
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
                color: this.nameColor
              ),
            ),
          ),
        ),
      ],
    );
  }
}