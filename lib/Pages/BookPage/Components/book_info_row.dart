import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/row_type.dart';
import 'package:bookifyapp/LayoutWidgets/info_row.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookInfoRow extends StatelessWidget {
  Book book;
  double widthPerChild;
  BookInfoRow(this.book, this.widthPerChild);

  @override
  Widget build(BuildContext context) {
    return Center(
      key: UniqueKey(),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Row contents vertically,
        children: <Widget>[
          InfoRow(
              RowType.image,
              "GÉNERO",
              "images/" + book.mainGenre.picture,
              book.mainGenre.name,
              widthPerChild,
              (CONTAINER_FACTOR_115 * SizeConfig.heightMultiplier)), //115

          _getLineSeparator(),

          InfoRow(RowType.text, "PUBLICACIÓN", "2017", "Año", widthPerChild,
              (CONTAINER_FACTOR_115 * SizeConfig.heightMultiplier)), //115

          _getLineSeparator(),

          InfoRow(RowType.text, "EXTENSIÓN", "128", "Páginas", widthPerChild,
              (CONTAINER_FACTOR_115 * SizeConfig.heightMultiplier) //115
              ),
        ],
      ),
    );
  }

  _getLineSeparator() {
    return Container(
      color: kThirdDarkColor,
      height: (CONTAINER_FACTOR_115 * SizeConfig.heightMultiplier), //115
      width: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
    );
  }
}
