import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/card_swiper.dart';

// ignore: must_be_immutable
class CarouselCard extends StatelessWidget {
  static const double DEFAULT_HEIGHT_FACTOR = 43.92;
  List<Book> books;
  CarouselCard(this.books);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (DEFAULT_HEIGHT_FACTOR * SizeConfig.heightMultiplier),
      child: Center(
        child: Card(
          color: kPrimaryDarkColor,
          child: InkWell(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
              (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
              (PADDING_FACTOR_20 * SizeConfig.heightMultiplier), // 20
              (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
              (PADDING_FACTOR_20 * SizeConfig.heightMultiplier), // 20
            ),
            child: CardSwiper(this.books),
          )),
        ),
      ),
    );
  }
}
