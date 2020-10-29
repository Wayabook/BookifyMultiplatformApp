import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {

  //static const kPrimaryColor = Color(0xFF6F35A5);
  //static const kPrimaryLightColor = Color(0xFFF1E6FF);
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
        onChanged: onChanged,
        cursorColor: kPrimaryLightColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryDarkColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
