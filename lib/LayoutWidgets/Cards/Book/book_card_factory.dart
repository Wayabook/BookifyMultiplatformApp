import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/bok_card.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';

abstract class BookCardFactory {
  factory BookCardFactory(BookCardType bookCardType, Lecture book,
      {User user}) {
    switch (bookCardType) {
      case BookCardType.book_card_in_vertical_list:
        return BokCard(book, bookCardType, user: user);
      case BookCardType.book_card_in_vertical_search_list:
        return BokCard(book, bookCardType, user: user);
      default:
        return BokCard(book, bookCardType, user: user);
    }
  }

  //@override
  //void initState();

  Widget build({@required BuildContext context});
}
