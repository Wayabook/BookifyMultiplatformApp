import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/BookCardFactory/book_card_factory.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/recommendation_dialog.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/friends_preview.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/BookPage/book_page.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../InfoToast.dart';
import '../BookCardInfo/book_card_info.dart';
import '../OptionCard/option_card.dart';

class BookCardInVerticalSearchList extends StatefulWidget with BookCardFactory {
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
  bookCompletedProcess() {
    bookCard.bookCompletedProcess();
  }

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
  //bool isInPendingList;
  //bool isInReadingList;
  bool added;

  _BookCard();

  @override
  Widget build(BuildContext context) {
    //return _getCardWidget(context);
    return widget.getCardWidget(
        widget.type, _getVerticalListCardWidget(context));
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
                child: widget.getFirstRowItem(
                    widget.type, widget.listType, widget.book, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          BookPage("title", widget.book, _getBooks())));
                }),
              ),
              Flexible(
                flex: 5,
                child: widget.getSecondRowItem(widget.book, widget.type),
              ),
              Flexible(
                flex: 2,
                child: widget.getThirdRowItem(
                    widget.book,
                    widget.type,
                    widget.user,
                    widget.listType,
                    widget.tickerProvider,
                    widget.listTitle,
                    _onBookCardActionButtonPressed),
              ),
            ],
          ),
        ));
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
      widget.isInPendingList =
          widget.user.isInPendingList(widget.book.toLecture());
      widget.isInReadingList =
          widget.user.isInReadingList(widget.book.toLecture());
      setState(() {
        if (!widget.isInReadingList) {
          if (!widget.isInPendingList) {
            setState(() {
              widget.user.addLectureToPendingList(book);
              InfoToast.showBookAddedCorrectlyToast(book.title);
            });
          } else {
            widget.user.removeLectureFromPendingList(book);
            InfoToast.showBookRemovedCorrectlyToast(book.title);
          }
          widget.isInPendingList = !widget.isInPendingList;
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
    }
  }

  List<Book> _getBooks() {
    return Book.getAppMockBooks();
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }
}
