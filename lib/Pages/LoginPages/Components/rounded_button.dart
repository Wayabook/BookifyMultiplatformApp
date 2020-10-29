import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {

  static const kPrimaryColor = Color(0xFF6F35A5);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);
  final String text;
  final Function press;
  final Color color, textColor;


  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = kPrimaryLightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
