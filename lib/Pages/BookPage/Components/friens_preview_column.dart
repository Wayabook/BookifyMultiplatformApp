import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/friends_preview.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';

class FriendsPreviewColumn extends StatelessWidget {
  User user;
  Book book;
  bool isARecommendation;

  FriendsPreviewColumn(this.user, this.book, this.isARecommendation);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
              (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
              (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
              (PADDING_FACTOR_0)),
          child: Text(
            isARecommendation ? RECOMMENDED_BY : ADDED_BY,
            style: TextStyle(
                fontSize: (TEXT_FACTOR_30 * SizeConfig.textMultiplier), //30
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        SizedBox(height: (PADDING_FACTOR_8 * SizeConfig.heightMultiplier)), // 8

        FriendsPreview(isARecommendation
            ? user.getBookRecommenders(book)
            : book.friendsReading)
      ],
    );
  }
}
