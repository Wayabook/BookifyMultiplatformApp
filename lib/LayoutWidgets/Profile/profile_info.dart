import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';

class ProfileInfo extends StatelessWidget {

  static const POSTER_RATIO = 0.7;
  double height;
  double circleRadius;
  double circleBorderWidth;

  User user;
  Color nameColor;

  ProfileInfo(
      this.user, {
        this.height = 100.0,
        this.nameColor = kPrimaryLightColor,
      });

  _initializeDimensions(){
    if(this.height == 100.0)
      this.height = 14.64 * SizeConfig.heightMultiplier;

    this.circleRadius = 29.19 * SizeConfig.imageSizeMultiplier;
    this.circleRadius = 1.94 * SizeConfig.imageSizeMultiplier;
  }

  @override
  Widget build(BuildContext context) {
    _initializeDimensions();
    return Column(
      children: <Widget>[
        ProfilePicture(user.profilePictureUrl),

        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              user.name,
              style: TextStyle(
                fontSize: (2.05 * SizeConfig.textMultiplier), // 14
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