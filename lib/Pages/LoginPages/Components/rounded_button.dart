import 'package:bookifyapp/Design/SizeConfig.dart';
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
      margin: EdgeInsets.symmetric(vertical: (1.47 * SizeConfig.heightMultiplier)),
      width: size.width * 0.8,
      height: (8.8 * SizeConfig.heightMultiplier),
      child: ClipRRect(
        borderRadius: BorderRadius.circular((7.05 * SizeConfig.imageSizeMultiplier)),
        child: FlatButton(
          padding: EdgeInsets.symmetric(
              vertical: (2.9 * SizeConfig.heightMultiplier),
              horizontal: (9.73 * SizeConfig.widthMultiplier)),
          color: color,
          onPressed: press,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: textColor,
                fontSize: (2.05 * SizeConfig.textMultiplier)
            ),
          ),
        ),
      ),
    );

    /*
    * return Container(
      margin: EdgeInsets.symmetric(vertical: (1.47 * SizeConfig.widthMultiplier)),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(
              vertical: (9.73 * SizeConfig.heightMultiplier),
              horizontal: (9.73 * SizeConfig.widthMultiplier)
          ),
          color: color,
          onPressed: press,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );*/
  }
}
