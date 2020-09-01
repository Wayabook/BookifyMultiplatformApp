import 'dart:async';

import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/reaction_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/MainComment.dart';
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

class AddFeedbackDialog extends StatefulWidget{

  Lecture book;
  AddFeedbackDialog(this.book);

  @override
  _AddFeedbackDialog createState() => _AddFeedbackDialog();
}

class _AddFeedbackDialog extends State<AddFeedbackDialog>{

  //Lecture book;
  //AddFeedbackDialog(this.book);

  Dialog alertDialog;
  bool _firstTime = true;
  //BuildContext context;
  double width;
  double height;
  List<Widget> mainComments = [];
  int listSize;
  int currentChapterNumber;
  Chapter currentChapter;
  Color readButtonColor;
  bool visible;
  ScrollController scrollController;
  String chapterTitle;

  final TextEditingController inputController = TextEditingController();

  @override
  void initState(){

    super.initState();

    scrollController = new ScrollController();

    currentChapterNumber = widget.book.currentChapter;
    currentChapter = widget.book.chapters[currentChapterNumber];
    chapterTitle = currentChapter.title;

    for(MainComment mainComment in currentChapter.comments){
      mainComments.add(MainCommentCard(mainComment, fromDialog: true, chapterTitle: this.currentChapter.title,  chapterNumber: this.currentChapterNumber));
    }
    listSize = mainComments.length + 5;
    listSize = mainComments.length + 5;

    readButtonColor = Colors.blueGrey;
    visible = widget.book.finished ? true : false;


    /*MainCommentCard(fromDialog: true),
    MainCommentCard(fromDialog: true),
    MainCommentCard(fromDialog: true),
    MainCommentCard(fromDialog: true),*/
  }

  _getReactionsGrid(){
    return Container(
        height: 190,
        width: double.infinity,
        //color: Colors.black,
        child: GridView.count(
            padding:EdgeInsets.fromLTRB(0, 10, 0, 10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 4,
            childAspectRatio: ((width - 20) / 4) / (110),
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
              //color: Colors.black,
              size: 25,
            ),
          ),

          _getTitleSection(listSize.toString() + " comentarios"),

          /*Align(
            alignment: Alignment.center,
            child: Text(
              "12 comentarios",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  _getRatingBar(){
    return Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: Colors.blueGrey,
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
        style: TextStyle(
          color: Colors.blueGrey,
        ),
      ),
    );
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
            child: Stack(
              children: <Widget>[


                Positioned(
                    top: 140,
                    child: Container(
                        width: width,
                        height: height-140,
                        color: Colors.white,
                        child:  Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: (){
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

                Positioned(
                    top: 150,
                    right: 10,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: width,
                          height: height-140,
                          //color: Colors.white,
                          child:  Align(
                            alignment: Alignment.topRight,
                            child: AnimatedOpacity(
                              opacity: !widget.book.finished ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    if(!widget.book.finished){
                                      readButtonColor = Colors.lightGreen;
                                      visible = true;

                                      var user = Provider.of<User>(context, listen: false);
                                      user.increaseChapter(widget.book);

                                      if(widget.book.finished)
                                        InfoToast.showFinishedCongratulationsMessage(widget.book.title);

                                    }
                                  });
                                },
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.beenhere,
                                  color: readButtonColor,
                                  size: 50,
                                ),
                              ),
                            ),
                          )
                      ),
                    )
                ),

                Center(
                  child: BookCover(
                    widget.book,
                    showInfo: false,
                    height: 180,
                    showTitle: false,
                    chapterTitle: chapterTitle,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(7, 210, 7, 10),
                  child: Container(color: Colors.blueGrey, height: 2, width: width),
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
                      padding: EdgeInsets.fromLTRB(7, 220, 7, 0),
                      child:  ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: listSize,
                          itemBuilder: (BuildContext context, int index) {
                            //return addFeedbackSections[index];
                            if(index == 0){
                              return _getTitleSection("¿Como estuvo?");
                            } else if (index == 1) {
                              return _getRatingBar();
                            } else if (index == 2) {
                              return _getTitleSection("¿Como te sentiste?");
                            } else if (index == 3) {
                              return _getReactionsGrid();
                            } else if (index == 4) {
                              return _getCommentsTitle();
                            } else {
                              return mainComments[index - 5];
                            }

                          }
                      ),


                      /*child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.comment,
                                  //color: Colors.black,
                                  size: 25,
                                ),
                              ),

                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "12 comentarios",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        MainCommentCard(fromDialog: true),
                        MainCommentCard(fromDialog: true),
                        MainCommentCard(fromDialog: true),
                        MainCommentCard(fromDialog: true),

                        /*GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => CommentPage()));
                          },
                          child: MainCommentCard(),
                        )*/
                      ],
                  ),*/
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
                                onPressed: (){
                                  _navigateToCommentsPage(context);
                                },
                                backgroundColor: Colors.yellow,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.blueGrey,),
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
      //bookTitleAndChapter: "Publicar sobre Titulo Libro | Cap 01",
    )));

    var aux = result;

    if(result != null || result.length > 0){
      setState(() {
        var user = Provider.of<User>(context, listen: false);
        MainComment mainComment = new MainComment(user, result, answers: Comment.getMockComments());
        mainComments.add(MainCommentCard(mainComment, fromDialog: true));
        listSize = mainComments.length + 5;
        _scrollToLastPosition();
      });
    }
    //print(result);
  }

  _scrollToLastPosition(){
    Timer(
      Duration(seconds: 1),
          () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
  }
}