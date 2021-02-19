import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/abstract_comment.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Pages/CommentPage/comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class MainCommentCard extends StatelessWidget with AbstractComment {
  bool fromDialog;
  bool seeAllComments;
  String chapterTitle;
  int chapterNumber;
  int commentPosition;
  MainComment mainComment;
  //Function(int) removeCommentFunction;
  //int positionKey;

  MainCommentCard(
    this.mainComment, {
    this.fromDialog = false,
    this.seeAllComments = false,
    this.chapterTitle = "",
    this.chapterNumber = 0,
    Function(int) removeCommentFunction,
    int positionKey,
  }) {
    this.positionKey = positionKey;
    this.removeCommentFunction = removeCommentFunction;
  }

  @override
  Widget build(BuildContext context) {
    this.positionKey = 11;
    return GestureDetector(
      onTap: () {
        if (fromDialog || seeAllComments) _pushNewCommentPage(context);
      },
      child: this.getCard(this.mainComment, getButtonsRow(), context),
    );
  }

  _pushNewCommentPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CommentPage(
              this.mainComment,
              subCommentsPage: true,
              chapterTitle: this.chapterTitle,
              chapterNumber: this.chapterNumber,
              inactiveAddCommentOption: this.seeAllComments,
            )));
  }

  @override
  removeComment(int pos) {
    removeCommentFunction(this.positionKey);
  }

  _rowItemStructure(children) {
    return Flexible(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Row getButtonsRow() {
    return Row(
      children: <Widget>[
        _rowItemStructure(<Widget>[getLikeButton(mainComment.likes)]),
        _rowItemStructure(<Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.insert_comment,
              color: kThirdDarkColor,
              size: (4.39 * SizeConfig.heightMultiplier), //30
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Text(
                  mainComment.answers.length.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kThirdDarkColor,
                    fontSize: (2.05 * SizeConfig.textMultiplier), //14
                  ),
                )),
          ),
        ]),
        _rowItemStructure(<Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.share,
              color: kThirdDarkColor,
              size: (4.39 * SizeConfig.heightMultiplier), //30
            ),
          ),
        ]),
      ],
    );
  }
}
