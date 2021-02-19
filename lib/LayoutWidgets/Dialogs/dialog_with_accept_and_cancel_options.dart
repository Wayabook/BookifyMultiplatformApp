import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class DialogWithAcceptAndCancelOptions extends StatelessWidget {
  static const int ACCEPT_TAP = 0;
  static const int CANCEL_TAP = 1;
  String title;
  String description;
  TextStyle acceptButtonTextStyle;
  TextStyle cancelButtonTextStyle;

  DialogWithAcceptAndCancelOptions(this.title, this.description,
      this.acceptButtonTextStyle, this.cancelButtonTextStyle);

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text(CANCEL_OPTION, style: this.cancelButtonTextStyle),
      onPressed: () {
        Navigator.of(context).pop(CANCEL_TAP);
      },
    );

    Widget continueButton = FlatButton(
      child: Text(ACCEPT_OPTION, style: this.acceptButtonTextStyle),
      onPressed: () {
        Navigator.of(context).pop(ACCEPT_TAP);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        this.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
        ),
      ),
      content: Text(
        this.description,
        style: TextStyle(
          fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
        ),
      ),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    return alert;
  }
}
