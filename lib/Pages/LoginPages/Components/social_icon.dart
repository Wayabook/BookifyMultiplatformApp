import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {

  final String iconSrc;
  final Function press;

  const SocialIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: (2.43 * SizeConfig.widthMultiplier)),
        padding: EdgeInsets.all((4.86 * SizeConfig.widthMultiplier)),
        decoration: BoxDecoration(
          border: Border.all(
            width: (0.48 * SizeConfig.widthMultiplier),
            color: kPrimaryDarkColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: (2.94 * SizeConfig.heightMultiplier),
          width: (4.86 * SizeConfig.widthMultiplier),
        ),
      ),
    );
  }
}
