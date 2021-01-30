import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/bok_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card_in_vertical_list.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card_in_vertical_search_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';

import 'BookCardInfo/book_card_info.dart';

abstract class BookCardFactory {
  factory BookCardFactory(BookCardType bookCardType, Lecture book,
      {User user,
      ButtonType buttonType,
      int position,
      TickerProvider tickerProvider,
      ListType listType,
      String listTitle,
      Color backgroundColor,
      double cardHeight = 160,
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
        return BokCard(book, bookCardType, user: user);
    }
  }

  Widget build({@required BuildContext context});

  _getSecondRowItem(Lecture book, BookCardType type) {
    return Padding(
      padding: EdgeInsets.all((1.75 * SizeConfig.heightMultiplier)), //12
      child: Container(
        height: (24.54 * SizeConfig.heightMultiplier), //150
        child: BookCardInfo(book, type),
      ),
    );
  }
}
