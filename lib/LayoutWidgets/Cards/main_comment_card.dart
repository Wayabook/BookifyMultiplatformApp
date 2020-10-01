import 'package:bookifyapp/LayoutWidgets/BookWidgets/summary_text.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/sub_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MainCommentCard extends StatelessWidget {

  //bool subComments;
  //Lecture currentChapter;
  bool fromDialog;
  String chapterTitle;
  int chapterNumber;
  int commentPosition;
  MainComment mainComment;
  Function(int) removeCommentFunction;
  int positionKey;
  //List<SubCommentCard> subCommentsList;
  //_MainCommentCard __mainCommentCard;

  MainCommentCard(
      //this.lecture,
      this.mainComment,
      {
        this.fromDialog = false,
        this.chapterTitle = "",
        this.chapterNumber = 0,
        this.removeCommentFunction,
        this.positionKey,
        //this.commentPosition = -1,
      });

  @override
  Widget build(BuildContext context) {
    if (fromDialog) {
      return GestureDetector(
        onTap: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>
              CommentPage(
                this.mainComment,
                subCommentsPage: true,
                chapterTitle: this.chapterTitle,
                chapterNumber: this.chapterNumber,
                //bookTitleAndChapter: "Publicar sobre Titulo Libro | Cap 01",
              )
              /*CommentPage(this.mainComment)*/));
        },
        child: _getCard(),
      );
    } else {
      return _getCard();
    }
  }

  removeComment(){
    removeCommentFunction(this.positionKey);
  }

  _getCard(){
    return Card(
        elevation: 10,
        //margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserPreviewCard(mainComment.author, height: 50, fontSize: 15, card: false, fromDialog: fromDialog, removeComment: removeComment),

              SummaryTextWidget(
                text: mainComment.comment,
                backgroundColor: Colors.blueGrey,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(color: Colors.white, height: 0.5, width: double.infinity),
              ),

              Container(
                color: Colors.blueGrey,
                child:  Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            LikeButton(
                              size: 30,
                              likeCount: mainComment.likes,
                              countBuilder: (int count, bool isLiked, String text) {
                                final ColorSwatch<int> color =
                                isLiked ? Colors.pinkAccent : Colors.grey;
                                Widget result;
                                if (count > 0) {
                                  result = Text(
                                    count >= 1000
                                        ? (count / 1000).toStringAsFixed(1) +
                                        'k'
                                        : text,
                                    style: TextStyle(color: color),
                                  );
                                }
                                return result;
                              },
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.insert_comment,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                mainComment.answers.length.toString() + " respuestas",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.share,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(color: Colors.white, height: 0.5, width: double.infinity),
              ),
            ],
          ),
        )
    );
  }
}


