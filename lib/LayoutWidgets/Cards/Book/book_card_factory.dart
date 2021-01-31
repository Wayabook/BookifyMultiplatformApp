import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card_in_vertical_list.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card_in_vertical_search_list.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/friends_preview.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'BookCardInfo/book_card_info.dart';

abstract class BookCardFactory {
  bool isInPendingList;
  bool isInReadingList;

  static const double DEFAULT_CARD_HEIGHT = 160;
  static const double DEFAULT_BORDER_75 = 0.75;
  static const double DEFAULT_BORDER_100 = 1.00;
  static const double DEFAULT_CONTAINER_WIDTH = 21.89;
  static const double DEFAULT_HEIGHT_FACTOR = 0.98;
  static const double DEFAULT_HEIGHT_FACTOR_SMALL = 0.87;

  BorderSide border75 =
      new BorderSide(width: DEFAULT_BORDER_75, color: kPrimaryDarkColor);
  BorderSide border100 =
      new BorderSide(width: DEFAULT_BORDER_100, color: kPrimaryDarkColor);

  factory BookCardFactory(BookCardType bookCardType, Lecture book,
      {User user,
      ButtonType buttonType,
      int position,
      TickerProvider tickerProvider,
      ListType listType,
      String listTitle,
      Color backgroundColor,
      double cardHeight = DEFAULT_CARD_HEIGHT,
      Function(Book book, bool add) addOrRemoveBookFromTemporalCustomList}) {
    switch (bookCardType) {
      case BookCardType.book_card_in_vertical_list:
        return BookCardInVerticalList(
            book, bookCardType, user, buttonType, position, tickerProvider);
      case BookCardType.book_card_in_vertical_search_list:
        return BookCardInVerticalSearchList(
          book,
          bookCardType,
          listType,
          user,
          addOrRemoveBookFromTemporalCustomList:
              addOrRemoveBookFromTemporalCustomList,
          listTitle: listTitle,
          backgroundColor: backgroundColor,
          cardHeight: cardHeight,
        );
      default:
        return BookCard(book, bookCardType, user: user);
    }
  }

  Widget build({@required BuildContext context});

  void bookCompletedProcess();

  getFirstRowItem(
      BookCardType type, ListType listType, Lecture book, Function() onTap) {
    return (type == BookCardType.book_card_in_vertical_list ||
            listType == ListType.normal)
        ? Column(
            children: <Widget>[
              Flexible(
                flex: 9,
                child: Container(
                  width: (DEFAULT_CONTAINER_WIDTH *
                      SizeConfig.widthMultiplier), //90
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: border100,
                          left: border75,
                          bottom: border75,
                          top: border75)),
                  child: Container(
                      color: Colors.black,
                      height: (CONTAINER_FACTOR_150 *
                          SizeConfig.heightMultiplier), //150
                      width: double.infinity,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.network(
                              book.picture,
                            ),
                          ))),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Center(
                    child: LinearPercentIndicator(
                      lineHeight:
                          (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
                      percent: book.progress,
                      progressColor: Colors.lightGreen,
                    ),
                  ))
            ],
          )
        : _getFriendsPreview(book, onTap);
  }

  _getFriendsPreview(Lecture book, Function onTap) {
    if (book.friendsReading != null && book.friendsReading.length > 0) {
      return Stack(
        children: <Widget>[
          _getCardContainer(book, onTap: onTap),
          Positioned(
              child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: FriendsPreview(book.friendsReading),
          )),
        ],
      );
    } else {
      return _getCardContainer(book);
    }
  }

  _getCardContainer(Lecture book, {Function() onTap}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        PADDING_FACTOR_0,
        PADDING_FACTOR_0,
        PADDING_FACTOR_0,
        (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
      ),
      child: Container(
          width: (DEFAULT_CONTAINER_WIDTH * SizeConfig.widthMultiplier), //90,
          decoration: new BoxDecoration(
              border: new Border(
                  right: border100,
                  left: border75,
                  bottom: border75,
                  top: border75)),
          child: Container(
              color: Colors.black,
              height:
                  (CONTAINER_FACTOR_150 * SizeConfig.heightMultiplier), //150
              width: double.infinity,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: (book.friendsReading != null &&
                          book.friendsReading.length > 0)
                      ? GestureDetector(
                          onTap: onTap,
                          child: Image.network(
                            book.picture,
                          ))
                      : Image.network(book.picture)))),
    );
  }

  Padding getSecondRowItem(Lecture book, BookCardType type) {
    return Padding(
      padding:
          EdgeInsets.all((TEXT_FACTOR_12 * SizeConfig.heightMultiplier)), //12
      child: Container(
        height: (CONTAINER_FACTOR_150 * SizeConfig.heightMultiplier), //150
        child: BookCardInfo(book, type),
      ),
    );
  }

  _isBookAdded(ListType listType, User user, Lecture book, String listTitle) {
    if (listType == ListType.first_time_form ||
        listType == ListType.received_recommendation_form ||
        listType == ListType.send_recommendation_form) {
      return false;
    } else if (listType == ListType.add_custom_list ||
        listType == ListType.edit_custom_list ||
        listType == ListType.first_time_form) {
      return user.isLectureInList(book.toLecture(), listTitle);
    } else {
      isInPendingList = user.isInPendingList(book.toLecture());
      isInReadingList = user.isInReadingList(book.toLecture());
      return isInPendingList || isInReadingList;
    }
  }

  BookCardActionButton getThirdRowItem(
      Lecture book,
      BookCardType type,
      User user,
      ListType listType,
      TickerProvider tickerProvider,
      String listTitle,
      Function(ListType listType, Lecture book, {bool added, BookCardType type})
          _onBookCardActionButtonPressed) {
    return BookCardActionButton(
      book,
      type,
      listType,
      tickerProvider,
      listTitle,
      onBookCardActionButtonPressed: _onBookCardActionButtonPressed,
      onBookCompletedProcess: bookCompletedProcess,
      added: _isBookAdded(listType, user, book, listTitle),
    );
  }

  Card getCardWidget(BookCardType type, Widget verticalListCardWidget) {
    return Card(
      elevation: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
      margin: new EdgeInsets.symmetric(
          horizontal: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          vertical: type == BookCardType.book_card_in_vertical_list
              ? (DEFAULT_HEIGHT_FACTOR * SizeConfig.heightMultiplier)
              : //10
              (DEFAULT_HEIGHT_FACTOR_SMALL * SizeConfig.heightMultiplier) //6
          ),
      child: verticalListCardWidget,
    );
  }
}
