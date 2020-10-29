import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

class DialogWithAcceptAndCancelOptions extends StatelessWidget{

  static const int ACCEPT_TAP = 0;
  static const int CANCEL_TAP = 1;
  String title;
  String description;
  TextStyle acceptButtonTextStyle;
  TextStyle cancelButtonTextStyle;


  DialogWithAcceptAndCancelOptions(
      this.title,
      this.description,
      this.acceptButtonTextStyle,
      this.cancelButtonTextStyle
      );



  @override
  Widget build(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text(
          "Cancel",
          style: this.cancelButtonTextStyle
      ),
      onPressed: () {
        Navigator.of(context).pop(CANCEL_TAP);
      },
    );

    Widget continueButton = FlatButton(
      child: Text(
          "Accept",
          style: this.acceptButtonTextStyle
      ),
      onPressed: () {
        Navigator.of(context).pop(ACCEPT_TAP);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(this.title, overflow: TextOverflow.ellipsis,),
      content: Text(this.description),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    return alert;
  }
}