import 'dart:async';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Interfaces/RemoveCommentInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Comment/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Reaction/reaction_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/CommentPage/comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../Design/SizeConfig.dart';

class AddFeedbackDialog extends StatefulWidget {
  Lecture book;

  AddFeedbackDialog(this.book);

  @override
  _AddFeedbackDialog createState() => _AddFeedbackDialog();
}

class _AddFeedbackDialog extends State<AddFeedbackDialog>
    with SingleTickerProviderStateMixin
    implements RemoveCommentInterface {
  static const double DEFAULT_PADDING = 1.46;
  static const double DEFAULT_PADDING_LARGE = 9.81;

  static const int DEFAULT_MILLISECONDS = 1500;
  static const int SHORT_DURATION = 500;

  static const int DEFAULT_SECONDS = 1;
  static const double VISIBLE = 1.0;
  static const double INVISIBLE = 0.0;

  static const int POSITION_KEY = 5;
  static const int CROSS_AXIS_COUNT = 4;
  static const double INITIAL_RATING = 3;
  static const double MIN_RATING = 1;

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

  List<Color> _ratingColors = [
    Colors.red[200],
    Colors.deepOrange[100],
    Colors.yellow[100],
    Colors.cyan[100],
    Colors.green[300]
  ];

  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    scrollController = new ScrollController();
    _backgroundColor = kPrimaryLightColor;

    animationController = AnimationController(
        duration: Duration(milliseconds: DEFAULT_MILLISECONDS), vsync: this);

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    );

    currentChapterNumber = widget.book.currentChapter;
    currentChapter = widget.book.chapters[currentChapterNumber];
    chapterTitle = currentChapter.title;

    for (int i = 0; i < currentChapter.comments.length; i++) {
      mainComments.add(MainCommentCard(
        currentChapter.comments[i],
        fromDialog: true,
        chapterTitle: this.currentChapter.title,
        chapterNumber: this.currentChapterNumber,
        removeCommentFunction: removeComment,
        positionKey: (i + POSITION_KEY),
      ));
    }

    widgets = new List();
    widgets.add(_getTitleSection(SECTION_1_TITLE));
    widgets.add(_getRatingBar());
    widgets.add(_getTitleSection(SECTION_2_TITLE));
    widgets.add(_getReactionsGrid());
    widgets.add(_getCommentsTitle());
    widgets.addAll(mainComments);

    readButtonColor = kPrimaryDarkColor;
    visible = widget.book.finished ? true : false;
  }

  _getReactionsGrid() {
    return Container(
        height: (CONTAINER_FACTOR_190 * SizeConfig.heightMultiplier), //190
        child: GridView.count(
            padding: EdgeInsets.symmetric(
              horizontal: PADDING_FACTOR_0,
              vertical: (DEFAULT_PADDING * SizeConfig.heightMultiplier), // 10
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: CROSS_AXIS_COUNT,
            children: List.generate(
              widget.book.getCurrentChapterReactions().length,
              (index) {
                return ReactionCard(
                    widget.book.getCurrentChapterReactions()[index]);
              },
            )));
  }

  _getCommentsTitle() {
    return Padding(
      padding: EdgeInsets.all(PADDING_FACTOR_0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.comment,
                size: (ICON_FACTOR_25 * SizeConfig.imageSizeMultiplier) //25
                ),
          ),
          _getTitleSection(mainComments.length.toString() + COMMENTS_OPTION),
        ],
      ),
    );
  }

  _getRatingBar() {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: PADDING_FACTOR_0,
        vertical: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
      ),
      color: kPrimaryDarkColor,
      child: Container(
          height: (DEFAULT_PADDING_LARGE * SizeConfig.heightMultiplier), // 50
          child: Align(
            alignment: Alignment.center,
            child: RatingBar(
              itemSize: (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier), //50
              initialRating: INITIAL_RATING,
              minRating: MIN_RATING,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: POSITION_KEY,
              itemPadding: EdgeInsets.symmetric(
                  horizontal: (0.97 * SizeConfig.imageSizeMultiplier)), //4
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
                setState(() {
                  _backgroundColor = _ratingColors[rating.toInt() - 1];
                });
              },
            ),
          )),
      //child: _createListView(),
    );
  }

  _getTitleSection(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: kPrimaryDarkColor,
          fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
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
                  top: (CONTAINER_FACTOR_140 *
                      SizeConfig.heightMultiplier), //140
                  child: Container(
                      width: width,
                      height: height -
                          (CONTAINER_FACTOR_140 * SizeConfig.heightMultiplier),
                      color: _backgroundColor,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                (PADDING_FACTOR_0),
                                ((TEXT_FACTOR_50 *
                                        SizeConfig.imageSizeMultiplier) /
                                    2), //150,
                                (PADDING_FACTOR_0),
                                (PADDING_FACTOR_0)),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: (ICON_FACTOR_24 *
                                    SizeConfig.imageSizeMultiplier), //24
                              ),
                            ),
                          )))),
              Positioned(
                  top: (CONTAINER_FACTOR_150 *
                      SizeConfig.heightMultiplier), //150
                  right: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width:
                            (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier),
                        height:
                            (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier),
                        child: FittedBox(
                          child: FloatingActionButton(
                              heroTag: UniqueKey(),
                              onPressed: () async {
                                setState(() {
                                  if (!widget.book.finished) {
                                    readButtonColor = Colors.lightGreen;
                                  }
                                });
                                await animationController.forward();
                                setState(() {
                                  if (!widget.book.finished) {
                                    visible = true;
                                    var user = Provider.of<User>(context,
                                        listen: false);
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
                                  size: SizeConfig.imageSizeMultiplier > 5.5
                                      ? (ICON_FACTOR_24 *
                                          SizeConfig.imageSizeMultiplier)
                                      : (TEXT_FACTOR_50 *
                                          SizeConfig.imageSizeMultiplier), //24
                                ),
                              )),
                        ),
                      ))),
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                  (1.7 * SizeConfig.imageSizeMultiplier), //7
                  (34.36 * SizeConfig.heightMultiplier), //210
                  (1.7 * SizeConfig.imageSizeMultiplier), //7
                  (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                ),
                child: Container(
                    color: kPrimaryDarkColor,
                    height: (0.48 * SizeConfig.widthMultiplier),
                    width: width),
              ),
              AnimatedOpacity(
                opacity: visible ? VISIBLE : INVISIBLE,
                duration: Duration(milliseconds: SHORT_DURATION),
                child: Visibility(
                  visible: visible,
                  maintainSize: false,
                  maintainAnimation: false,
                  maintainState: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        (1.7 * SizeConfig.imageSizeMultiplier), //7
                        (36.01 * SizeConfig.heightMultiplier), //220
                        (1.7 * SizeConfig.imageSizeMultiplier), //7
                        PADDING_FACTOR_0),
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        padding: EdgeInsets.all((PADDING_FACTOR_8 *
                            SizeConfig.heightMultiplier)), //8
                        itemCount: widgets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return widgets[index];
                        }),
                  ),
                ),
              ),
              Center(
                child: Visibility(
                  visible: !visible,
                  maintainSize: false,
                  maintainAnimation: false,
                  maintainState: false,
                  child: _getTitleSection(ADD_FEEDBACK_INDICATOR),
                ),
              ),
              Positioned(
                bottom: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
                right:
                    (PADDING_FACTOR_10 * SizeConfig.imageSizeMultiplier), //10
                child: AnimatedOpacity(
                    opacity: visible ? VISIBLE : INVISIBLE,
                    duration: Duration(milliseconds: SHORT_DURATION),
                    child: Visibility(
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
                            onPressed: () {
                              _navigateToCommentsPage(context);
                            },
                            backgroundColor: Colors.yellow,
                            child: Icon(
                              Icons.add,
                              color: kPrimaryDarkColor,
                              //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));

    return alertDialog;
  }

  _navigateToCommentsPage(BuildContext context) async {
    final String result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CommentPage(
              null,
              subCommentsPage: false,
              chapterTitle: this.currentChapter.title,
              chapterNumber: this.currentChapterNumber,
            )));

    if (result != null) {
      if (result.length > PADDING_FACTOR_0) {
        setState(() {
          var user = Provider.of<User>(context, listen: false);
          MainComment mainComment = new MainComment(
            user,
            result,
            answers: Comment.getMockComments(),
          );
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
  void removeComment(int key) {
    setState(() {
      widgets.removeAt(key);
      InfoToast.showCommentRemovedCorrectly(true);
    });
  }

  _scrollToLastPosition() {
    Timer(
      Duration(seconds: DEFAULT_SECONDS),
      () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
  }
}
