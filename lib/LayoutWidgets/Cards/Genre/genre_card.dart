import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Design/info_text.dart';

class GenreCard extends StatelessWidget {
  static const double DEFAULT_CARD_MARGIN_FACTOR = 1.46;
  static const double DEFAULT_BORDER_RADIUS_FACTOR = 4.86;
  static const double DEFAULT_CARD_WIDTH_FACTOR = 26.76;
  static const double DEFAULT_CARD_HEIGHT_FACTOR = 53.52;
  Genre genre;
  bool addGenreCard;
  int index;
  Function(ButtonType buttonType, BuildContext context, {String title})
      onAddGenrePressed;

  GenreCard(this.genre,
      {this.addGenreCard = false, this.index = 0, this.onAddGenrePressed});

  Card _getCard(Widget child) {
    return Card(
        color: (addGenreCard) ? Colors.white : kPrimaryDarkColor,
        margin: EdgeInsets.all(
            (DEFAULT_CARD_MARGIN_FACTOR * SizeConfig.heightMultiplier)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              (DEFAULT_BORDER_RADIUS_FACTOR * SizeConfig.imageSizeMultiplier)),
        ),
        elevation: (DEFAULT_CARD_MARGIN_FACTOR * SizeConfig.heightMultiplier),
        child: child);
  }

  _getAddGenreCard(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onAddGenrePressed(ButtonType.edit_genres_list, context);
        },
        child: _getCard(Container(
            width: (DEFAULT_CARD_WIDTH_FACTOR * SizeConfig.widthMultiplier),
            //height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    (DEFAULT_BORDER_RADIUS_FACTOR *
                        SizeConfig.imageSizeMultiplier)),
                color: kPrimaryLightColor),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: kPrimaryDarkColor,
                  size: (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier),
                ),
                Text(
                  ADD_GENRE,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kPrimaryDarkColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )))));
  }

  _getGenreContainerCard() {
    return _getCard(Row(
      children: <Widget>[
        Container(
            width: (TEXT_FACTOR_50 * SizeConfig.widthMultiplier),
            height: (DEFAULT_CARD_HEIGHT_FACTOR * SizeConfig.widthMultiplier),
            child: FittedBox(
              fit: BoxFit.contain,
              child: BorderedText(
                strokeWidth: 1.0,
                strokeColor: kPrimaryLightColor,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                      color: kPrimaryDarkColor,
                      decoration: TextDecoration.none,
                      //decorationColor: Colors.,
                      decorationThickness: 1),
                ),
              ),
            )),
        GenreContainer(this.genre)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return addGenreCard ? _getAddGenreCard(context) : _getGenreContainerCard();
  }
}
