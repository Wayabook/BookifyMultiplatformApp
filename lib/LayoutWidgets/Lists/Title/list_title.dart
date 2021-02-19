import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';

import '../../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class ListTitle extends StatelessWidget {
  static const double DEFAULT_PADDING_FACTOR = 1.46;
  static const double DEFAULT_FONT_SIZE = 0;
  static const double DEFAULT_HEIGHT_FACTOR = 0.29;
  User user;
  bool withButton;
  final String title;
  double fontSize;
  ButtonType buttonType;
  Color barAndTitleColor;
  bool withPadding;
  Function(ButtonType buttonType, BuildContext context, {String title})
      onListTitleButtonTapped;

  ListTitle(
    this.title, {
    this.withButton = false,
    this.buttonType = ButtonType.view_all,
    this.user,
    this.onListTitleButtonTapped,
    this.fontSize = DEFAULT_FONT_SIZE,
    this.barAndTitleColor = kThirdDarkColor,
    this.withPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (this.fontSize == DEFAULT_FONT_SIZE)
      this.fontSize = PADDING_FACTOR_30 * SizeConfig.textMultiplier; //30
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: withPadding
                ? EdgeInsets.fromLTRB(
                    (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                    (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                    (DEFAULT_HEIGHT_FACTOR * SizeConfig.heightMultiplier),
                    PADDING_FACTOR_0)
                : EdgeInsets.all(PADDING_FACTOR_0),
            child: withButton ? _getRowWithButton(context) : _getTitle(),
          ),
          Padding(
            padding: withPadding
                ? EdgeInsets.symmetric(
                    horizontal:
                        (PADDING_FACTOR_15 * SizeConfig.widthMultiplier), //15
                    vertical:
                        (DEFAULT_PADDING_FACTOR * SizeConfig.heightMultiplier))
                : EdgeInsets.all(PADDING_FACTOR_0),
            child: Container(
                color: this.barAndTitleColor,
                height:
                    (DEFAULT_HEIGHT_FACTOR * SizeConfig.heightMultiplier), // 2
                width: width),
          ),
        ],
      ),
    );
  }

  _getTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: this.fontSize,
            fontWeight: FontWeight.bold,
            color: this.barAndTitleColor),
      ),
    );
  }

  _getRowWithButton(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 8,
          child: _getTitle(),
        ),
        Flexible(
          flex: 3,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    (PADDING_FACTOR_0),
                    (PADDING_FACTOR_0),
                    (PADDING_FACTOR_15 * SizeConfig.widthMultiplier),
                    (PADDING_FACTOR_0)),
                child: (this.buttonType == ButtonType.edit_list ||
                        this.buttonType == ButtonType.copy_list)
                    ? _getEditListButton(context)
                    : _getViewAllButton(context),
              )),
        )
      ],
    );
  }

  _getViewAllButton(BuildContext context) {
    var buttonText =
        buttonType == ButtonType.edit_genres_list ? "Edit" : "View All";
    return GestureDetector(
        onTap: () {
          onListTitleButtonTapped(this.buttonType, context);
        },
        child: SmallButtonUnderlined(buttonText));
  }

  _getEditListButton(BuildContext context) {
    if (buttonType == ButtonType.copy_list) {
      return _getEditOrCopyButton(context);
    } else {
      return Row(
        children: [
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier)),
              child: _getEditOrCopyButton(context),
            ),
          ),
          Flexible(
            flex: 5,
            child: _getDeleteButton(context),
          )
        ],
      );
    }
  }

  _getDeleteButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onListTitleButtonTapped(ButtonType.delete_list, context, title: title);
        //this.goToPageFromParent2(title);
      },
      child: SmallButtonUnderlined(
        "Delete",
        textColor: Colors.red,
      ),
    );
  }

  _getEditOrCopyButton(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          onListTitleButtonTapped(buttonType, context, title: title);
        },
        child: buttonType == ButtonType.edit_list
            ? SmallButtonUnderlined("Edit")
            : SmallButtonUnderlined("Copy"));
  }

  //getED
}
