import 'dart:async';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Interfaces/RemoveCommentInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/reaction_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../SizeConfig.dart';

class AddFeedbackDialog extends StatefulWidget{

  Lecture book;
  Function() callAnimation;
  AddFeedbackDialog(this.book);

  @override
  _AddFeedbackDialog createState() => _AddFeedbackDialog();
}

class _AddFeedbackDialog
    extends State<AddFeedbackDialog> with SingleTickerProviderStateMixin
    implements RemoveCommentInterface{


  Dialog alertDialog;
  double width;
  double height;
  List<Widget> mainComments = [];
  int currentChapterNumber;
  Chapter currentChapter;
  Color readButtonColor;
  bool visible;
  ScrollController scrollController;
  String chapterTitle;
  List<Widget> widgets;
  AnimationController animationController;
  Animation<double> animation;
  Color _backgroundColor;


  final TextEditingController inputController = TextEditingController();

  @override
  void initState(){

    super.initState();

    scrollController = new ScrollController();
    _backgroundColor = kPrimaryLightColor;

    animationController = AnimationController(
        duration: Duration(milliseconds: 1500),
        vsync:this
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    );

    currentChapterNumber = widget.book.currentChapter;
    currentChapter = widget.book.chapters[currentChapterNumber];
    chapterTitle = currentChapter.title;

    for(int i=0; i < currentChapter.comments.length; i++){
      mainComments.add(
          MainCommentCard(
              currentChapter.comments[i],
              fromDialog: true,
              chapterTitle: this.currentChapter.title,
              chapterNumber: this.currentChapterNumber,
              removeCommentFunction: removeComment,
              positionKey: (i + 5),
          ));
    }

    widgets = new List();
    widgets.add(_getTitleSection("¿Como estuvo?"));
    widgets.add(_getRatingBar());
    widgets.add(_getTitleSection("¿Como te sentiste?"));
    widgets.add(_getReactionsGrid());
    widgets.add(_getCommentsTitle());
    widgets.addAll(mainComments);

    readButtonColor = kPrimaryDarkColor;
    visible = widget.book.finished ? true : false;
  }

  _getReactionsGrid(){
    return Container(
        height: (31.09 * SizeConfig.heightMultiplier), //190
        child: GridView.count(
            padding:EdgeInsets.fromLTRB(
                0,
                (1.46 * SizeConfig.heightMultiplier), // 10
                0,
                0
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 4,
            children: List.generate(widget.book.getCurrentChapterReactions().length, (index) {
              return ReactionCard(widget.book.getCurrentChapterReactions()[index]);
            },)
        )
    );
  }

  _getCommentsTitle(){
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
              size: (6.08 * SizeConfig.imageSizeMultiplier) //25
            ),
          ),
          _getTitleSection(mainComments.length.toString()  + " comentarios"),
        ],
      ),
    );
  }

  _getRatingBar(){
    return Card(
      margin: EdgeInsets.fromLTRB(
          0,
          (1.21 * SizeConfig.widthMultiplier), //5
          0,
          (1.21 * SizeConfig.widthMultiplier), //5
      ),
      color: kPrimaryDarkColor,
      child: Container(
          height: (7.32 * SizeConfig.heightMultiplier), // 50
          child: Align(
            alignment: Alignment.center,
            child: RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: (0.97 * SizeConfig.imageSizeMultiplier)), //4
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
          fontSize: (2.05 * SizeConfig.textMultiplier), //14
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    alertDialog = new Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
            height: height,
            width: width,
            child: Stack(
              children: <Widget>[

                Positioned(
                    top: (21.94 * SizeConfig.heightMultiplier), //140
                    child: Container(
                        width: width,
                        height: height -  (21.94 * SizeConfig.heightMultiplier),
                        color: _backgroundColor,
                        child:  Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                            ),
                          ),
                        )
                    )
                ),

                Positioned(
                    top: (24.54 * SizeConfig.heightMultiplier), //150
                    right: (2.43 * SizeConfig.widthMultiplier), //10
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: width,
                          height: height - (21.94 * SizeConfig.heightMultiplier), //140
                          //color: _backgroundColor,
                          child:  Align(
                            alignment: Alignment.topRight,
                            child: AnimatedOpacity(
                              opacity: !widget.book.finished ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: FloatingActionButton(
                                heroTag: UniqueKey(),
                                onPressed: () async {
                                  setState(() {
                                    if(!widget.book.finished){
                                      readButtonColor = Colors.lightGreen;
                                    }
                                  });
                                  await animationController.forward();
                                  setState(() {
                                    if(!widget.book.finished){
                                      visible = true;
                                      var user = Provider.of<User>(context, listen: false);
                                      user.increaseChapter(widget.book);
                                    }
                                  });
                                },
                                backgroundColor: kPrimaryLightColor,
                                child: RotationTransition(
                                  turns: animation,
                                  child: Icon(
                                    Icons.beenhere,
                                    color: readButtonColor,
                                    size:  (12.16 * SizeConfig.imageSizeMultiplier), //50
                                  ),
                                )
                              ),
                            ),
                          )
                      ),
                    )
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: BookCover(
                    widget.book,
                    showInfo: false,
                    height: (29.45 * SizeConfig.heightMultiplier), //180
                    showTitle: false,
                    chapterTitle: chapterTitle,
                    transparent: true,
                  ),
                ),

                /*Center(
                  child: BookCover(
                    widget.book,
                    showInfo: false,
                    height: (29.45 * SizeConfig.heightMultiplier), //180
                    showTitle: false,
                    chapterTitle: chapterTitle,
                    transparent: true,
                  ),
                ),*7

                 */

                Padding(
                  padding: EdgeInsets.fromLTRB(
                      (1.7 * SizeConfig.imageSizeMultiplier), //7
                      (34.36 * SizeConfig.heightMultiplier), //210
                      (1.7 * SizeConfig.imageSizeMultiplier), //7
                      (2.43 * SizeConfig.widthMultiplier), //10
                  ),
                  child: Container(color: kPrimaryDarkColor, height: (0.48 * SizeConfig.widthMultiplier), width: width),
                ),

                AnimatedOpacity(
                  opacity: visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child:  Visibility(
                    visible: visible,
                    maintainSize: false,
                    maintainAnimation: false,
                    maintainState: false,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          (1.7 * SizeConfig.imageSizeMultiplier), //7
                          (36.01 * SizeConfig.heightMultiplier), //220
                          (1.7 * SizeConfig.imageSizeMultiplier), //7
                          0
                      ),
                      child:  ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          padding: EdgeInsets.all((1.29 * SizeConfig.heightMultiplier)), //8
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
                    bottom: (1.21 * SizeConfig.widthMultiplier), //5
                    right: (2.43 * SizeConfig.imageSizeMultiplier), //10
                    child: AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child:  Visibility(
                          visible: visible,
                          maintainSize: false,
                          maintainAnimation: false,
                          maintainState: false,
                          child: Container(
                            height: (6.54 * SizeConfig.heightMultiplier), //40
                            width: (9.73 * SizeConfig.widthMultiplier), //40
                            child: FittedBox(
                              child: FloatingActionButton(
                                heroTag: UniqueKey(),
                                onPressed: (){
                                  _navigateToCommentsPage(context);
                                },
                                backgroundColor: Colors.yellow,
                                child: Icon(
                                  Icons.add,
                                  color: kPrimaryDarkColor,
                                  size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                ),

              ],
            ),
        )
    );

    return alertDialog;
  }

  _navigateToCommentsPage(BuildContext context) async {

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
          _scrollToLastPosition();
        });
      }
    }
  }

  @override
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
  }
}