import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/summary_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/user_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:like_button/like_button.dart';

abstract class AbstractComment {
  int positionKey;
  Function(int) removeCommentFunction;

  void removeComment(int key);
  Row getButtonsRow();

  Card getCard(Comment comment, Widget buttonsRow, {isMainComment = true}) {
    return Card(
        color: kPrimaryDarkColor,
        elevation: (20 * SizeConfig.widthMultiplier), //10
        child: Column(
          children: <Widget>[
            UserPreviewCard(comment.author,
                height: (12.16 * SizeConfig.imageSizeMultiplier), //50
                fontSize: (3.64 * SizeConfig.widthMultiplier), //15
                card: false,
                backGroundColor: kPrimaryDarkColor,
                removeComment: removeComment),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: SummaryTextWidget(
                text: comment.comment,
                backgroundColor: kPrimaryDarkColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  (3.64 * SizeConfig.widthMultiplier), //15
                  0,
                  (3.64 * SizeConfig.widthMultiplier), //15
                  0),
              child: Container(
                  color: kPrimaryDarkColor,
                  height: (0.081 * SizeConfig.heightMultiplier), //0.5
                  width: double.infinity),
            ),
            Container(
              color: kPrimaryDarkColor,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      (1.21 * SizeConfig.widthMultiplier), //5
                      0,
                      (1.21 * SizeConfig.widthMultiplier), //5
                      0),
                  child: buttonsRow),
            ),
            /*isMainComment
                ? _getSpace()
                : Padding(
                    padding: EdgeInsets.all(PADDING_FACTOR_0),
                  )*/
          ],
        ));
  }

  Widget getLikeButton(int likes) {
    return LikeButton(
      size: (4.39 * SizeConfig.heightMultiplier), //30
      likeCount: likes,
      bubblesColor: BubblesColor(
        dotPrimaryColor: kSecondaryDarkColor,
        dotSecondaryColor: kSecondaryDarkColor,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? kSecondaryDarkColor : kThirdDarkColor,
          size: (4.39 * SizeConfig.heightMultiplier), //30
        );
      },
      countBuilder: (int count, bool isLiked, String text) {
        Widget result;
        if (count > 0) {
          result = Text(
            count >= 1000 ? (count / 1000).toStringAsFixed(1) + 'k' : text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: kThirdDarkColor,
              fontSize: (2.05 * SizeConfig.textMultiplier), //14
            ),
          );
        }
        return result;
      },
    );
  }

  _getSpace() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          (3.64 * SizeConfig.widthMultiplier), //15
          0,
          (3.64 * SizeConfig.widthMultiplier), //15
          0),
      child: Container(
          color: kPrimaryLightColor,
          height: (0.081 * SizeConfig.heightMultiplier), //0.5
          width: double.infinity),
    );
  }
}
