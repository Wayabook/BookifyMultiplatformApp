import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/SizeConfig.dart';

class SmallButtonUnderlined extends StatelessWidget {

  String text;
  double fontSize;
  Color textColor;

  SmallButtonUnderlined(
      this.text,
      {
        this.fontSize = 15,
        this.textColor = Colors.blue
      }
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: this.fontSize == 15 ? (2.20 * SizeConfig.textMultiplier) : this.fontSize,
        fontWeight: FontWeight.bold,
        color: this.textColor,
        decoration: TextDecoration.underline,
      ),
    );
  }


}