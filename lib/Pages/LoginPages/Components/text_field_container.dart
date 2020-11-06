import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class TextFieldContainer extends StatelessWidget {

  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: (8.8 * SizeConfig.heightMultiplier),
      margin: EdgeInsets.symmetric(vertical: (1.47 * SizeConfig.heightMultiplier)),
      padding: EdgeInsets.symmetric(
          horizontal: (4.8 * SizeConfig.widthMultiplier),
          vertical: (0.73 * SizeConfig.heightMultiplier),
      ),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kSecondaryDarkColor,
        borderRadius: BorderRadius.circular((7.05 * SizeConfig.imageSizeMultiplier)),
      ),
      child: child,
    );
  }
}
