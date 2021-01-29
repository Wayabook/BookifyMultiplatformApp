import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Design/SizeConfig.dart';

class DialogWithInputText extends StatelessWidget {
  static const int ACCEPT_TAP = 0;
  static const int CANCEL_TAP = 1;
  String title;
  String description;
  String entryTextDescription;

  DialogWithInputText(this.title, this.description, this.entryTextDescription);

  AlertDialog alertDialog;
  bool _firstTime = true;

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    alertDialog = new AlertDialog(
      title: Text(
        this.title,
        style: TextStyle(
          fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          TextField(
            decoration: InputDecoration(
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.greenAccent,
                    width:
                        (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier)), //2
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red,
                    width:
                        (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier)), //2
              ),
              labelText: this.entryTextDescription,
              errorText: validateListTitle(inputController.text),
            ),
            style: TextStyle(
              fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
            ),
            controller: inputController,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(ACCEPT_OPTION,
              style: TextStyle(
                color: Colors.blue,
                fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
              )),
          onPressed: () async {
            String listTitle = "";
            if (inputController.text.isNotEmpty &&
                inputController.text.toString() != this.entryTextDescription) {
              listTitle = inputController.text.toString();
            } else {
              listTitle = "Custom list";
            }
            Navigator.of(context).pop(listTitle);
          },
        ),
        FlatButton(
          child: Text(CANCEL_OPTION,
              style: TextStyle(
                color: Colors.red,
                fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
              )),
          onPressed: () {
            Navigator.of(context).pop(CANCEL_TAP);
          },
        ),
      ],
    );
    return alertDialog;
  }

  String validateListTitle(String value) {
    if ((value.length == 0) && !_firstTime && value != "List Title") {
      return "List Title must be introduced";
    }
    _firstTime = false;
    return null;
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: this.description,
        style: TextStyle(
          color: Colors.black87,
          fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
        ),
      ),
    );
  }
}
