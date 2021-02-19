import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/abstract_markable_card.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenreContainer extends StatelessWidget with AbstractMarkableCard {
  static const double DEFAULT_WIDTH_FACTOR = 16.17;
  static const double DEFAULT_BORDER_FACTOR = 4.86;
  static const double IMAGE_HEIGHT_FACTOR = 7.32;
  static const double PADDING_FACTOR = 0.97;

  Genre genre;
  bool tapped;
  double width;
  double height;
  double containerWidth;
  double containerHeight;

  GenreContainer(this.genre, this.tapped,
      {this.width = 0,
      this.height = double.infinity,
      this.containerWidth = double.infinity,
      this.containerHeight = double.infinity});

  @override
  Widget build(BuildContext context) {
    this.width = (this.width == 0)
        ? (DEFAULT_WIDTH_FACTOR * SizeConfig.widthMultiplier)
        : this.width;

    return getCard(
        tapped,
        kGreenLightColor,
        kSecondaryLightColor,
        genre.name,
        "images/" + genre.picture,
        (TEXT_FACTOR_14 * SizeConfig.textMultiplier),
        (IMAGE_HEIGHT_FACTOR * SizeConfig.heightMultiplier),
        (TEXT_FACTOR_50 * SizeConfig.widthMultiplier),
        fontWeight: FontWeight.bold,
        containerWidth: containerWidth,
        containerHeight: containerHeight,
        subContainerWidth: width,
        subContainerHeight: height);
  }
}
