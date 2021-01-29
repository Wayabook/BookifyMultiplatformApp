import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';

class EditableListTitle extends StatelessWidget {
  String title;
  TextEditingController textEditingController = new TextEditingController();

  EditableListTitle(
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                (PADDING_FACTOR_10 * SizeConfig.heightMultiplier),
                (PADDING_FACTOR_10 * SizeConfig.heightMultiplier),
                (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier),
                (PADDING_FACTOR_0)),
            child: _getTextField(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (PADDING_FACTOR_15 * SizeConfig.widthMultiplier),
              vertical: (PADDING_FACTOR_10 * SizeConfig.heightMultiplier),
            ),
            child:
                Container(color: kPrimaryLightColor, height: 2, width: width),
          ),
        ],
      ),
    );
  }

  _getTextField() {
    TextField textField = TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
            (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
            (PADDING_FACTOR_0),
            (PADDING_FACTOR_0),
            (PADDING_FACTOR_0)),
        hintText: this.title,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      onChanged: (value) {
        this.title = value;
      },
    );
    return textField;
  }
}
