import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {


  final bool login;
  final Function press;
  static const kPrimaryColor = Color(0xFF6F35A5);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);

  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: (2.05 * SizeConfig.textMultiplier)
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: (2.05 * SizeConfig.textMultiplier)
            ),
          ),
        )
      ],
    );
  }
}
