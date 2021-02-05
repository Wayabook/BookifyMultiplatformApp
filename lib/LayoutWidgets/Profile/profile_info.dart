import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';

class ProfileInfo extends StatelessWidget {
  static const double DEFAULT_HEIGHT = 100.0;
  static const POSTER_RATIO = 0.7;
  double height;
  double circleRadius;
  double circleBorderWidth;

  User user;
  Color nameColor;

  ProfileInfo(
    this.user, {
    this.height = DEFAULT_HEIGHT,
    this.nameColor = kThirdDarkColor,
  });

  _initializeDimensions() {
    if (this.height == DEFAULT_HEIGHT)
      this.height = CONTAINER_FACTOR_100 * SizeConfig.heightMultiplier;

    this.circleRadius = PADDING_FACTOR_120 * SizeConfig.heightMultiplier;
    this.circleRadius = PADDING_FACTOR_120 * SizeConfig.heightMultiplier;
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
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), // 14
                  fontWeight: FontWeight.bold,
                  color: this.nameColor),
            ),
          ),
        ),
      ],
    );
  }
}
