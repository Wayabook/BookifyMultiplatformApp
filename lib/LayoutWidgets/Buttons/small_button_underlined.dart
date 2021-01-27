import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';

class SmallButtonUnderlined extends StatelessWidget {
  static const double DEFAULT_FONT_SIZE = 15;
  static const double FONT_SIZE_FACTOR = 2.19;

  String text;
  double fontSize;
  Color textColor;

  SmallButtonUnderlined(this.text,
      {this.fontSize = DEFAULT_FONT_SIZE,
      this.textColor = smallUnderlinedButtonColor});

  @override
  Widget build(BuildContext context) {
    if (this.fontSize == DEFAULT_FONT_SIZE)
      this.fontSize = (FONT_SIZE_FACTOR * SizeConfig.textMultiplier);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        text,
        style: TextStyle(
          fontSize: this.fontSize,
          fontWeight: FontWeight.bold,
          color: this.textColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
