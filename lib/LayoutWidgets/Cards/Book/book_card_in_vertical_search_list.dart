import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card_factory.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/add_feedback_dialog.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/recommendation_dialog.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/friends_preview.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/BookPage/book_page.dart';
import 'package:bookifyapp/Pages/SearchPage/search_page.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../InfoToast.dart';
import 'BookCardInfo/book_card_info.dart';
import 'OptionCard/option_card.dart';

class BookCardInVerticalSearchList extends StatefulWidget
    implements BookCardFactory {
  BuildContext context;
  BookCardType type;
  Lecture book;
  User user;

  //Vertical List
  TickerProvider tickerProvider;
  ButtonType buttonType;
  int position;

  //Vertical SearchList
  Function(Book book, bool add) addOrRemoveBookFromTemporalCustomList;
  ListType listType;
  String listTitle;
  Color backgroundColor;
  double cardHeight;

  _BookCard bookCard = _BookCard();

  BookCardInVerticalSearchList(this.book, this.type, this.listType, this.user,
      {this.addOrRemoveBookFromTemporalCustomList,
      this.listTitle = "",
      this.backgroundColor = kPrimaryDarkColor,
      this.cardHeight = 160});

  @override
  Widget build({
    BuildContext context,
  }) {
    return this;
  }

  @override
  void initState() {}

  @override
  _BookCard createState() => bookCard;
}

class _BookCard extends State<BookCardInVerticalSearchList> {
  static const double DEFAULT_PADDING_FACTOR = 0.24;
  static const double DEFAULT_BORDER_RADIUS_FACTOR = 1.7;
  static const double DEFAULT_LINE_HEIGHT_FACTOR = 0.73;
  static const double BOOK_COMPLETED_INDICATOR = 1.0;
  //BuildContext context;

  Card card;
  bool showEndLectureFrame = false;
  double buttonSize; // = 50.0;
  Widget content;
  bool visible;
  int animationControllerDuration;
  Color buttonColor;
  bool _visible;

  // Rotation controller
  AnimationController animationController;
  Animation<double> animation;

  // Confetti controller
  ConfettiController confettiController;

  // Vertical List Search
  //User user;
  IconData iconData;
  //Color buttonColor;
  bool isInPendingList;
  bool isInReadingList;
  bool added;

  _BookCard();

  @override
  Widget build(BuildContext context) {
    /*if (widget.type == BookCardType.book_card_in_vertical_list &&
        widget.book.finished) {
      setState(() {
        confettiController.play();
      });
    }*/
    return _getCardWidget(context);
  }

  @override
  void initState() {
    _initializeWidgetsInSearchVerticalList();
    super.initState();
  }

  _initializeWidgetsInSearchVerticalList() {
    if (widget.cardHeight == 160)
      widget.cardHeight = (23.42 * SizeConfig.heightMultiplier); //160
  }

  _getVerticalListCardWidget(BuildContext ctx) {
    return Container(
      height: widget.cardHeight,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: _getVerticaListTile(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getCardWidget(BuildContext context) {
    return Card(
        elevation: (2.43 * SizeConfig.widthMultiplier), //10
        margin: new EdgeInsets.symmetric(
            horizontal: (2.43 * SizeConfig.widthMultiplier), //10
            vertical: widget.type == BookCardType.book_card_in_vertical_list
                ? (0.98 * SizeConfig.heightMultiplier)
                : //10
                (0.87 * SizeConfig.heightMultiplier) //6
            ),
        child: _getVerticalListCardWidget(context));
  }

  _getStackWidgets() {
    return <Widget>[
      _getStackTopPart(),
      _getStackBottomPart(),
    ];
  }

  _getStackBottomPart() {
    if (widget.type == BookCardType.add_option) {
      return Positioned(
        top: 0,
        right: 0,
        child: AddButtonSmall(
          (widget.user.isInPendingList(widget.book.toLecture()) ||
                  widget.user.isInReadingList(widget.book.toLecture()))
              ? AddButtonSmall.iconChecked
              : AddButtonSmall.iconAdded,
          onButtonClicked: () {
            if (!widget.user.isInReadingList(widget.book.toLecture())) {
              if (!widget.user.isInPendingList(widget.book.toLecture())) {
                setState(() {
                  widget.user.addLectureToPendingList(widget.book.toLecture());
                  InfoToast.showBookAddedCorrectlyToast(widget.book.title);
                });
              }
            }
          },
        ),
      );
    } else if (widget.type ==
            BookCardType.without_add_option_and_progress_bar ||
        widget.type == BookCardType.book_card_in_grid) {
      return Positioned(
        bottom: (0.24 * SizeConfig.imageSizeMultiplier), // 1
        right: (0.24 * SizeConfig.imageSizeMultiplier),
        left: (0.24 * SizeConfig.imageSizeMultiplier),
        child: Center(
          child: LinearPercentIndicator(
            lineHeight: (0.73 * SizeConfig.heightMultiplier), // 5
            percent: !widget.book.finished ? widget.book.progress : 1.0,
            progressColor:
                !widget.book.finished ? Colors.lightGreen : Colors.deepPurple,
          ),
        ),
      );
    }
  }

  _getStackTopPart() {
    if (widget.type == BookCardType.book_card_in_grid) {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BookPage("title", widget.book, _getBooks())));
            },
            child: Image.network(
              widget.book.picture,
              fit: BoxFit.fill,
              height: (29.28 * SizeConfig.heightMultiplier),
            ),
          ),
        ),
      );
    } else if (widget.type == BookCardType.add_option ||
        widget.type == BookCardType.without_add_option ||
        widget.type == BookCardType.without_add_option_and_progress_bar) {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BookPage("title", widget.book, _getBooks())));
            },
            child: Image.network(widget.book.picture),
          ),
        ),
      );
    }
  }

  _getOptionCard() {
    return GestureDetector(
        onTap: () async {
          onOptionCardPressed();
        },
        child: OptionCard(widget.type));
  }

  onOptionCardPressed() async {
    if (widget.type == BookCardType.disover) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage(
                Book.getUserMockBooks(), User.getMockAlterantiveUsers())),
      );
    } else if (widget.type == BookCardType.view_all) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookshelfPage(widget.user)),
      );
    } else if (widget.type == BookCardType.add_custom_list) {
      var result = await showDialog(
        context: context,
        builder: (BuildContext context) => DialogWithInputText(
            'Add List Title:',
            'Add a custom list of books from your Bookshelf, and share it with your friends.\n\n',
            'List Title'),
      );
      if (result != DialogWithInputText.CANCEL_TAP) {
        await _pushAddCustomListPage(result);
      }
    } else if (widget.type == BookCardType.recommend_book) {
      _pushRecommendBooksPage();
    }
  }

  sendRecommendedBooks(List<Book> recommendedBooks) async {
    List<Recommendation> recommendations = new List();
    User recommender = Provider.of<User>(context, listen: false);
    for (Book book in recommendedBooks) {
      recommendations.add(new Recommendation(recommender, book));
    }
    // show popup and on accept send it to user.
    await showDialog(
      context: context,
      builder: (BuildContext context) => RecommendationDialog(
        Recommendation.getMockRecommendation(),
        type: ListType.send_recommendation_form,
        sendToUser: widget.user,
      ),
    );
    /**
     * Missing
     * This part will be implemented in futher steps.
     * */
  }

  _pushRecommendBooksPage() async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddCustomListPage(
              widget.user.bookshelf,
              "Recommendation",
              ListType.send_recommendation_form,
              sendRecommendedBooks: sendRecommendedBooks,
            )));
  }

  _pushAddCustomListPage(String listTitle) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddCustomListPage(
            widget.user.bookshelf, listTitle, ListType.add_custom_list)));
    if (result == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookshelfPage(
                  Provider.of<User>(context, listen: false),
                  scrollToLastPosition: true,
                )),
      );
      //Navigator.pop(context);
    }
  }

  _getVerticaListTile() {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(
                (1.7 * SizeConfig.imageSizeMultiplier)) // 7
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (1.21 * SizeConfig.widthMultiplier), //5
            vertical: (1.46 * SizeConfig.heightMultiplier), //10
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: _getFirstRowItem(),
              ),
              Flexible(
                flex: 5,
                child: _getSecondRowItem(),
              ),
              Flexible(
                flex: 2,
                child: _getThirdRowItem(),
              ),
            ],
          ),
        ));
  }

  _getFirstRowItem() {
    return (widget.type == BookCardType.book_card_in_vertical_list ||
            widget.listType == ListType.normal)
        ? Column(
            children: <Widget>[
              Flexible(
                flex: 9,
                child: Container(
                  width: (21.89 * SizeConfig.widthMultiplier), //90
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: kPrimaryDarkColor),
                          left: new BorderSide(
                              width: .075, color: kPrimaryDarkColor),
                          bottom: new BorderSide(
                              width: .075, color: kPrimaryDarkColor),
                          top: new BorderSide(
                              width: .075, color: kPrimaryDarkColor))),

                  child: Container(
                      color: Colors.black,
                      height: (24.54 * SizeConfig.heightMultiplier), //150
                      width: double.infinity,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.network(
                              widget.book.picture,
                            ),
                          ))),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: LinearPercentIndicator(
                      //width: //150.0,
                      lineHeight: (1.21 * SizeConfig.widthMultiplier), //5
                      percent: widget.book.progress,
                      progressColor: Colors.lightGreen,
                    ),
                  ))
            ],
          )
        : _getFriendsPreview();
  }

  _getSecondRowItem() {
    return Padding(
      padding: EdgeInsets.all((1.75 * SizeConfig.heightMultiplier)), //12
      child: Container(
        height: (24.54 * SizeConfig.heightMultiplier), //150
        child: BookCardInfo(widget.book, widget.type),
      ),
    );
  }

  _getThirdRowItem() {
    return BookCardActionButton(
      widget.book,
      widget.type,
      widget.listType,
      widget.tickerProvider,
      widget.listTitle,
      onBookCardActionButtonPressed: _onBookCardActionButtonPressed,
      onBookCompletedProcess: bookCompletedProcess,
      added: _isBookAdded(),
    );
  }

  _isBookAdded() {
    if (widget.listType == ListType.first_time_form ||
        widget.listType == ListType.received_recommendation_form ||
        widget.listType == ListType.send_recommendation_form) {
      return false;
    } else if (widget.listType == ListType.add_custom_list ||
        widget.listType == ListType.edit_custom_list ||
        widget.listType == ListType.first_time_form) {
      return widget.user
          .isLectureInList(widget.book.toLecture(), widget.listTitle);
    } else {
      isInPendingList = widget.user.isInPendingList(widget.book.toLecture());
      isInReadingList = widget.user.isInReadingList(widget.book.toLecture());
      return isInPendingList || isInReadingList;
    }
  }

  bookCompletedProcess() {
    setState(() {
      widget.user.moveLectureFromReadingListToReadList(widget.book);
      InfoToast.showFinishedCongratulationsMessage(widget.book.title);
    });
  }

  _onBookCardActionButtonPressed(ListType listType, Lecture book,
      {bool added: false, BookCardType type}) async {
    if (listType == ListType.normal || listType == ListType.preview_friends) {
      isInPendingList = widget.user.isInPendingList(widget.book.toLecture());
      isInReadingList = widget.user.isInReadingList(widget.book.toLecture());
      setState(() {
        if (!isInReadingList) {
          if (!isInPendingList) {
            setState(() {
              widget.user.addLectureToPendingList(book);
              InfoToast.showBookAddedCorrectlyToast(book.title);
            });
          } else {
            widget.user.removeLectureFromPendingList(book);
            InfoToast.showBookRemovedCorrectlyToast(book.title);
          }
          isInPendingList = !isInPendingList;
        }
      });
    } else if (listType == ListType.add_custom_list ||
        listType == ListType.edit_custom_list ||
        listType == ListType.first_time_form ||
        listType == ListType.received_recommendation_form ||
        listType == ListType.send_recommendation_form) {
      setState(() {
        widget.addOrRemoveBookFromTemporalCustomList(book, added);
      });
    } else if (widget.type == BookCardType.book_card_in_vertical_list) {
      setState(() {
        widget.user.increaseChapter(book);
      });
    }
  }

  _getFriendsPreview() {
    if (widget.book.friendsReading != null &&
        widget.book.friendsReading.length > 0) {
      return Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              0,
              0,
              (2.43 * SizeConfig.widthMultiplier), //10
            ),
            child: Container(
                width: (21.89 * SizeConfig.widthMultiplier), //90,
                //padding: EdgeInsets.only(right: 12.0),
                //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                            width: 1.0, color: kPrimaryDarkColor),
                        left: new BorderSide(
                            width: .075, color: kPrimaryDarkColor),
                        bottom: new BorderSide(
                            width: .075, color: kPrimaryDarkColor),
                        top: new BorderSide(
                            width: .075, color: kPrimaryDarkColor))),
                child: Container(
                    color: Colors.black,
                    height: (24.54 * SizeConfig.heightMultiplier), //150
                    width: double.infinity,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookPage(
                                    "title", widget.book, _getBooks())));
                          },
                          child: Image.network(
                            widget.book.picture,
                          ),
                        )))),
          ),
          Positioned(
              child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: FriendsPreview(widget.book.friendsReading),
          )),
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            0, 0, 0, (2.43 * SizeConfig.widthMultiplier)), //10
        child: Container(
            width: (21.89 * SizeConfig.widthMultiplier), //90,
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: kPrimaryDarkColor),
                    left: new BorderSide(width: .075, color: kPrimaryDarkColor),
                    bottom:
                        new BorderSide(width: .075, color: kPrimaryDarkColor),
                    top:
                        new BorderSide(width: .075, color: kPrimaryDarkColor))),
            child: Container(
                color: Colors.black,
                height: (24.54 * SizeConfig.heightMultiplier), //150
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(widget.book.picture),
                ))),
      );
    }
  }

  List<Book> _getBooks() {
    return Book.getAppMockBooks();
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }
}
