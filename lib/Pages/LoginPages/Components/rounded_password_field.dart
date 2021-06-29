import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/text_field_container.dart';

import '../../../Design/SizeConfig.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        //obscureText: true,
        maxLines: null,
        minLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.center,
        //obscureText: true,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: (2.05 * SizeConfig.textMultiplier),
        ),
        onChanged: onChanged,
        cursorColor: kPrimaryDarkColor,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: kPrimaryDarkColor,
            size: (7 * SizeConfig.imageSizeMultiplier),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryDarkColor,
            size: (7 * SizeConfig.imageSizeMultiplier),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
