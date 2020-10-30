import 'dart:async';

import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Interfaces/RemoveCommentInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/reaction_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
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
  //AnimationController an
  //Function() callAnimation;

  RecommendationDialog(this._recommendation);

  @override
  _RecommendationDialog createState() => _RecommendationDialog();
}

class _RecommendationDialog
    extends State<RecommendationDialog> /*with SingleTickerProviderStateMixin*/ {


  Dialog alertDialog;
  double width;
  double height;
  //List<Widget> mainComments = [];
  //int currentChapterNumber;
  //Chapter currentChapter;
  //Color readButtonColor;
  //bool visible;
  ScrollController scrollController;
  //String chapterTitle;
  List<Widget> widgets;
  //AnimationController animationController;
  //Animation<double> animation;
  Color _backgroundColor;


  final TextEditingController inputController = TextEditingController();

  @override
  void initState(){

    super.initState();

    scrollController = new ScrollController();
    _backgroundColor = kPrimaryLightColor;


    widgets = new List();

    //readButtonColor = kPrimaryDarkColor;
    //visible = widget.book.finished ? true : false;
  }

  /*_getReactionsGrid(){
    return Container(
        height: 190,
        child: GridView.count(
            padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 4,
            //childAspectRatio: ((width - 20) / 4) / (110),
            children: List.generate(widget.book.getCurrentChapterReactions().length, (index) {
              return ReactionCard(widget.book.getCurrentChapterReactions()[index]);
            },)
        )
    );
  }*/

  /*_getCommentsTitle(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.comment,
              size: 25,
            ),
          ),
          _getTitleSection(mainComments.length.toString()  + " comentarios"),
        ],
      ),
    );
  }*/

  _getRatingBar(){
    return Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: kPrimaryDarkColor,
      child: Container(
          height: 50,
          child: Align(
            alignment: Alignment.center,
            child: RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
                setState(() {
                  if(rating == 1){
                    _backgroundColor  = Colors.red[200];
                  } else if (rating == 2) {
                    _backgroundColor  = Colors.deepOrange[100];
                  } else if (rating == 3) {
                    _backgroundColor  = Colors.yellow[100];
                  } else if (rating == 4) {
                    _backgroundColor  = Colors.cyan[100];
                  } else {
                    _backgroundColor  = Colors.green[300];
                  }

                });
              },
            ),
          )
        //width: 100,
      ),
      //child: _createListView(),
    );
  }

  _getTitleSection(String title){
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: kPrimaryDarkColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    //animationController.dispose();
    super.dispose();
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

              /*Positioned(
                  top: 150,
                  right: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: width,
                        height: height-140,
                        //color: _backgroundColor,
                        child:  Align(
                          alignment: Alignment.topRight,
                          child: AnimatedOpacity(
                            //opacity: !widget.book.finished ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: FloatingActionButton(
                                heroTag: UniqueKey(),
                                onPressed: () async {
                                  setState(() {
                                    /*if(!widget.book.finished){
                                      readButtonColor = Colors.lightGreen;
                                    }*/
                                  });
                                  /*await animationController.forward();
                                  setState(() {
                                    if(!widget.book.finished){
                                      visible = true;
                                      var user = Provider.of<User>(context, listen: false);
                                      user.increaseChapter(widget.book);
                                    }
                                  });*/
                                },
                                backgroundColor: kPrimaryLightColor,
                                child: RotationTransition(
                                  turns: animation,
                                  child: Icon(
                                    Icons.beenhere,
                                    color: readButtonColor,
                                    size: 50,
                                  ),
                                )
                            ),
                          ),
                        )
                    ),
                  )
              ),*/

              /*UserPreviewCard(
                widget._recommendation.recommendedBy,
                height: 150,
              ),*/

              ProfileInfo(widget._recommendation.recommendedBy),

              /*
              UserPreviewCard(
      this.user,
      {
        this.height = 100,
        this.fontSize = 30,
        this.padding = 10,
        this.card = true,
        this.isAuthor = false,
        this.fromDialog = true,
        //this.isFriend = false,
        this.removeComment
      });
              */

              /*Center(
                child: BookCover(
                  widget.book,
                  showInfo: false,
                  height: 180,
                  showTitle: false,
                  chapterTitle: chapterTitle,
                ),
              ),*/

              Padding(
                padding: EdgeInsets.fromLTRB(7, 210, 7, 10),
                child: Container(color: kPrimaryDarkColor, height: 2, width: width),
              ),

              /*AnimatedOpacity(
                opacity: visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child:  Visibility(
                  visible: visible,
                  maintainSize: false,
                  maintainAnimation: false,
                  maintainState: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(7, 220, 7, 0),
                    child:  ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: widgets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return widgets[index];
                        }
                    ),
                  ),
                ),
              ),

              Center(
                child: Visibility(
                  visible: !visible,
                  maintainSize: false,
                  maintainAnimation: false,
                  maintainState: false,
                  child:  _getTitleSection("To give feedback and see comments. Mark as read first"),
                ),
              ),

              Positioned(
                bottom: 5,
                right: 10,
                child: AnimatedOpacity(
                    opacity: visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child:  Visibility(
                      visible: visible,
                      maintainSize: false,
                      maintainAnimation: false,
                      maintainState: false,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: FittedBox(
                          child: FloatingActionButton(
                            heroTag: UniqueKey(),
                            onPressed: (){
                              //_navigateToCommentsPage(context);
                            },
                            backgroundColor: Colors.yellow,
                            child: Icon(
                              Icons.add,
                              color: kPrimaryDarkColor,),
                          ),
                        ),
                      ),
                    )
                ),
              ),*/

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