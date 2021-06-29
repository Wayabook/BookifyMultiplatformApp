import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:flutter/material.dart';

import '../../../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class OptionCard extends StatelessWidget {
  static const double BORDER_RADIUS = 1.7;
  static const double DEFAULT_WIDTH = 29.19;
  static const String discover_text = 'Discover Books';
  static const String view_all_text = 'Ver Todo';
  static const String add_custom_list_text = 'Crear Lista Personal';
  static const String recommend_book_text = 'Recommendar Libros';
  static const String settings_text = 'Settings';

  static const IconData discover_icon = Icons.add;
  static const IconData view_all_icon = Icons.remove_red_eye;
  static const IconData add_custom_list_icon = Icons.add;
  static const IconData recommend_book_icon = Icons.card_giftcard;
  static const IconData settings_icon = Icons.settings;

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
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
              width: (CONTAINER_FACTOR_120 * SizeConfig.widthMultiplier), // 120
              color: kPrimaryLightColor,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    this._icon,
                    color: kThirdDarkColor,
                    size: (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier),
                  ),
                  Text(
                    this._optionText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize:
                          (TEXT_FACTOR_14 * SizeConfig.textMultiplier), // 14
                      color: kThirdDarkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ))),
        ));
  }

  _getOptionTextAndText() {
    switch (this._type) {
      case BookCardType.disover:
        this._icon = discover_icon;
        this._optionText = OptionCard.discover_text;
        break;
      case BookCardType.view_all:
        this._icon = view_all_icon;
        this._optionText = OptionCard.view_all_text;
        break;
      case BookCardType.add_custom_list:
        this._icon = add_custom_list_icon;
        this._optionText = OptionCard.add_custom_list_text;
        break;
      case BookCardType.recommend_book:
        this._icon = recommend_book_icon;
        this._optionText = OptionCard.recommend_book_text;
        break;
      case BookCardType.settings:
        this._icon = settings_icon;
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
