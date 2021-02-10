import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Interfaces/RemoveCommentInterface.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/summary_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/user_preview_card.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../Design/SizeConfig.dart';
import '../../Abstracts/abstract_comment.dart';

class SubCommentCard extends StatelessWidget with AbstractComment {
  static const String AT_SYMBOL = '@';
  Comment comment;
  TextEditingController textEditingController;

  SubCommentCard(
    this.comment, {
    this.textEditingController,
    Function(int) removeCommentFunction,
    int positionKey,
  }) {
    this.positionKey = positionKey;
    this.removeCommentFunction = removeCommentFunction;
  }

  removeComment(int position) {
    removeCommentFunction(this.positionKey);
  }

  @override
  Widget build(BuildContext context) {
    return this.getCard(this.comment, getButtonsRow(), isMainComment: false);
  }

  Row getButtonsRow() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[getLikeButton(this.comment.likes)],
          ),
        ),
        Flexible(
          flex: 3,
          child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  textEditingController.text =
                      AT_SYMBOL + this.comment.author.name;
                },
                child: Text(
                  ANSWER_OPTION,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kThirdDarkColor,
                    fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
