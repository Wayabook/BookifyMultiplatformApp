import 'dart:async';

import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Interfaces/RemoveCommentInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/reaction_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_info.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RecommendationDialog extends StatefulWidget{

  Recommendation _recommendation;

  RecommendationDialog(this._recommendation);

  @override
  _RecommendationDialog createState() => _RecommendationDialog();
}

class _RecommendationDialog
    extends State<RecommendationDialog> /*with SingleTickerProviderStateMixin*/ {


  Dialog alertDialog;
  double width;
  double height;
  ScrollController scrollController;
  List<Widget> widgets;
  Color _backgroundColor;
  List<Lecture> recommendationsAccepted;


  final TextEditingController inputController = TextEditingController();

  @override
  void initState(){

    super.initState();

    recommendationsAccepted = new List();
    scrollController = new ScrollController();
    _backgroundColor = kPrimaryLightColor;


    widgets = new List();

    //readButtonColor = kPrimaryDarkColor;
    //visible = widget.book.finished ? true : false;
  }

  @override
  void dispose() {
    //animationController.dispose();
    super.dispose();
  }

  void addOrDeleteRecommendation(Book recommendedBook, bool add){
    if(add){
      if(!recommendationsAccepted.contains(recommendedBook.toLecture()))
        recommendationsAccepted.add(recommendedBook.toLecture());
    } else {
      if(recommendationsAccepted.contains(recommendedBook.toLecture()))
        recommendationsAccepted.remove(recommendedBook.toLecture());
    }
  }

  void onRecommendationsAccepted(){
    User user = Provider.of<User>(context, listen: false);
    setState(() {
      user.addListOfLecturesToLectureListByKey(recommendationsAccepted, 'Recommended');
      user.addListOfLecturesToLectureListByKey(recommendationsAccepted, 'Pending');
    });
    InfoToast.showRecommendationsSavedCorrectly();
    onRecommendationCanceled();
  }

  void onRecommendationCanceled(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    alertDialog = new Dialog(
      //title: const Text('Add List Title:'),
        backgroundColor: Colors.transparent,
        child: Container(
          height: height,
          width: width,
          //color: _backgroundColor,
          child: Stack(
            children: <Widget>[


              Positioned(
                  top: 70,
                  child: Container(
                      width: width,
                      height: height - 70,
                      color: _backgroundColor,
                      child:  Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: (){
                            //widget.callAnimation();
                            Navigator.pop(context);
                          },
                          icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black
                          ),
                        ),
                      )
                  )
              ),

              ProfileInfo(widget._recommendation.recommendedBy, nameColor: kPrimaryDarkColor,),

              Padding(
                padding: EdgeInsets.fromLTRB(7, 140, 7, 10),
                child: Container(color: kPrimaryDarkColor, height: 2, width: width),
              ),

              Positioned(
                top: 150,
                left: 7,
                right: 7,
                //left: Alignment.center,
                child: Container(
                  width: width,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child:  Text(
                      ("Just recommended you " + widget._recommendation.recommendedBooks.length.toString() + " books."),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryDarkColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ),

              Positioned(
                  top: 180,
                  left: 7,
                  right: 7,
                  //left: Alignment.center,
                  child: Container(
                    width: width,
                    height: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child:  Text(
                        ("Select the ones that you want to add to your Pending list!"),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  )
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 240, 0, 0),
                child: VerticalBookListSearch(
                  widget._recommendation.recommendedBooks,
                  ListType.recommendation_form,
                  backgroundColor: kPrimaryLightColor,
                  onAcceptButtonTapped: onRecommendationsAccepted,
                  onCancelButtonTapped: onRecommendationCanceled,
                  addOrRemoveBook: addOrDeleteRecommendation,
                )
              )
            ],
          ),
        )
    );

    return alertDialog;
  }

  /*_navigateToCommentsPage(BuildContext context) async {

    final String result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CommentPage(
      null,
      subCommentsPage: false,
      chapterTitle: this.currentChapter.title,
      chapterNumber: this.currentChapterNumber,
    )));


    if(result != null){
      if(result.length > 0){
        setState(() {
          var user = Provider.of<User>(context, listen: false);
          MainComment mainComment = new MainComment(user, result, answers: Comment.getMockComments());
          this.currentChapter.addComment(mainComment);


          widgets.add(MainCommentCard(
            mainComment,
            fromDialog: true,
            chapterTitle: this.currentChapter.title,
            chapterNumber: this.currentChapterNumber,
            removeCommentFunction: removeComment,
            positionKey: widgets.length,
          ));
          //listSize = mainComments.length + 5;
          //_scrollToLastPosition();
        });
      }
    }
  }*/

  /*@override
  void removeComment(int key){
    setState(() {
      widgets.removeAt(key);
      InfoToast.showCommentRemovedCorrectly(true);
    });
  }

  _scrollToLastPosition(){
    Timer(
      Duration(seconds: 1),
          () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
  }*/
}