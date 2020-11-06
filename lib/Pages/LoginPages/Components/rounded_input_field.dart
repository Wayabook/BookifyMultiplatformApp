import 'dart:ui';

import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        maxLines: null,
        minLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.center,
        selectionHeightStyle: BoxHeightStyle.max,
        onChanged: onChanged,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: (2.05 * SizeConfig.textMultiplier),
        ),
        cursorColor: kPrimaryLightColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryDarkColor,
            size: (7 * SizeConfig.imageSizeMultiplier),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
