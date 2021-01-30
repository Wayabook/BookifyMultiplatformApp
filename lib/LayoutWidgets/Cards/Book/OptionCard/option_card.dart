import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Design/SizeConfig.dart';

class OptionCard extends StatelessWidget {
  static const double BORDER_RADIUS = 1.7;
  static const double DEFAULT_WIDTH = 29.19;
  static const String discover_text = 'Discover Books';
  static const String view_all_text = 'View All';
  static const String add_custom_list_text = 'Add Custom List';
  static const String recommend_book_text = 'Recommend Book';
  static const String settings_text = 'Settings';

  IconData _icon;
  String _optionText;
  BookCardType _type;

  OptionCard(this._type);

  @override
  Widget build(BuildContext context) {
    _getOptionTextAndText();
    return Card(
      key: UniqueKey(),
      margin: EdgeInsets.all(
          (PADDING_FACTOR_10 * SizeConfig.imageSizeMultiplier)), // 10
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            (BORDER_RADIUS * SizeConfig.imageSizeMultiplier)),
      ),
      elevation: (PADDING_FACTOR_10 * SizeConfig.imageSizeMultiplier), // 10
      child: Container(
          width: (29.19 * SizeConfig.widthMultiplier), // 120
          color: kPrimaryLightColor,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                this._icon,
                color: kPrimaryDarkColor,
                size: (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier),
              ),
              Text(
                this._optionText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), // 14
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ))),
    );
  }

  _getOptionTextAndText() {
    switch (this._type) {
      case BookCardType.disover:
        this._icon = Icons.add;
        this._optionText = OptionCard.discover_text;
        break;
      case BookCardType.view_all:
        this._icon = Icons.remove_red_eye;
        this._optionText = OptionCard.view_all_text;
        break;
      case BookCardType.add_custom_list:
        this._icon = Icons.add;
        this._optionText = OptionCard.add_custom_list_text;
        break;
      case BookCardType.recommend_book:
        this._icon = Icons.card_giftcard;
        this._optionText = OptionCard.recommend_book_text;
        break;
      case BookCardType.settings:
        this._icon = Icons.settings;
        this._optionText = OptionCard.settings_text;
        break;
      case BookCardType.add_option:
        // TODO: Handle this case.
        break;
      case BookCardType.without_add_option:
        // TODO: Handle this case.
        break;
      case BookCardType.without_add_option_and_progress_bar:
        // TODO: Handle this case.
        break;
      case BookCardType.book_card_in_grid:
        // TODO: Handle this case.
        break;
      case BookCardType.book_card_in_vertical_list:
        break;
      case BookCardType.book_card_in_vertical_search_list:
        break;
    }
  }
}