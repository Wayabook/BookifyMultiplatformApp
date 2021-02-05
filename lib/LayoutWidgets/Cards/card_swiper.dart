import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Pages/BookPage/book_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../Design/SizeConfig.dart';

class CardSwiper extends StatelessWidget {
  static const double DEFAULT_BORDER_RADIUS_FACTOR = 1.73;
  static const double DEFAULT_PADDING_10 = 1.46;
  final List<Book> books;

  CardSwiper(this.books);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: kPrimaryDarkColor,
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return _getSwiperCardContent(index, context);
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: false,
          itemCount: books.length,
          pagination: null,
          control: null,
          viewportFraction: 0.6,
          scale: 0.9,
        ));
  }

  _getSwiperCardContent(int index, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            (DEFAULT_BORDER_RADIUS_FACTOR * SizeConfig.imageSizeMultiplier)),
      ),
      elevation: (DEFAULT_PADDING_10 * SizeConfig.heightMultiplier), // 10
      color: kPrimaryLightColor,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  BookPage("title", this.books[index], this.books)));
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Image.network(
                  this.books[index].picture,
                ),
              ),
              flex: 6,
            ),
            Flexible(
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Text(
                      this.books[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize:
                              (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                          fontWeight: FontWeight.bold,
                          color: kThirdDarkColor),
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  this.books[index].author,
                  style: TextStyle(
                    fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                    color: kThirdDarkColor,
                  ),
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
