import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';

class SmallButtonUnderlined extends StatelessWidget {

  String text;
  double fontSize;
  Color textColor;

  SmallButtonUnderlined(
      this.text,
      {
        this.fontSize = 15,
        this.textColor = smallUnderlinedButtonColor
      }
  );

  @override
  Widget build(BuildContext context) {
    if(this.fontSize == 15)
      this.fontSize = (2.19 * SizeConfig.textMultiplier);

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