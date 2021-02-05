import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/row_type.dart';
import 'package:bookifyapp/LayoutWidgets/info_row.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LectureInfoRow extends StatelessWidget {
  User user;
  double widthPerChild;
  LectureInfoRow(this.user, this.widthPerChild);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Row contents vertically,
        children: <Widget>[
          InfoRow.withIcon(
              RowType.icon_image,
              BOOKS_READ_TITLE,
              Icons.book,
              user.booksRead.toString(),
              widthPerChild,
              (CONTAINER_FACTOR_115 *
                  SizeConfig.heightMultiplier), //height = 115
              kThirdDarkColor),
          _getContainerSeparator(),
          InfoRow.withIcon(
              RowType.icon_image,
              CHAPS_READ_TITLE,
              Icons.collections_bookmark,
              user.chaptersRead.toString(),
              widthPerChild,
              (CONTAINER_FACTOR_115 *
                  SizeConfig.heightMultiplier), //height = 115
              kThirdDarkColor),
          _getContainerSeparator(),
          InfoRow.withIcon(
              RowType.icon_image,
              PAGES_READ_TITLE,
              Icons.description,
              user.pagesRead.toString(),
              widthPerChild,
              (CONTAINER_FACTOR_115 *
                  SizeConfig.heightMultiplier), //height = 115
              kThirdDarkColor),
        ],
      ),
    );
  }

  _getContainerSeparator() {
    return Container(
      color: kThirdDarkColor,
      height:
          (CONTAINER_FACTOR_115 * SizeConfig.heightMultiplier), //height = 115
      width: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
    );
  }
}
