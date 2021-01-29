import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Design/constants.dart';

class InfoToast {
  static const String INTERESTS_SAVED =
      "Your interests as a lecturer were saved correctly.";
  static const String RECOMMENDATIONS_SAVED =
      "Selected recommendations were saved correctly.";
  static const String BOOK_LIST_REMOVED =
      "books list was removed correctly from your Bookshelf.";
  static const String BOOK_LIST_ADDED =
      "books list was added correctly to your Bookshelf.";
  static const String COMMNET = "Comment";
  static const String SUB_COMMENT = "Sub-comment";
  static const String COMMENT_REMOVED = " removed correctly.";
  static const String BOOK_FINISHED_MESSAGE =
      "Congratulations you just finished: ";
  static const String NEW_BOOK_READING_PAGE =
      " correctly added to Reading page.";
  static const String BOOK_REMOVED_READING_PAGE =
      " correctly added to Reading page.";

  static void showInterestsSavedCorrectly() {
    Fluttertoast.showToast(
        msg: INTERESTS_SAVED,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showRecommendationsSavedCorrectly() {
    Fluttertoast.showToast(
        msg: RECOMMENDATIONS_SAVED,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showListRemovedCorrecltyFromBookshelf(String listTitle) {
    Fluttertoast.showToast(
        msg: listTitle + BOOK_LIST_REMOVED,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showListCopiedCorrecltyToBookshelf(String listTitle) {
    Fluttertoast.showToast(
        msg: listTitle + BOOK_LIST_ADDED,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showCommentRemovedCorrectly(bool comment) {
    String commentText = comment ? COMMNET : SUB_COMMENT;
    Fluttertoast.showToast(
        msg: commentText + COMMENT_REMOVED,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showFinishedCongratulationsMessage(String bookTitle) {
    Fluttertoast.showToast(
        msg: BOOK_FINISHED_MESSAGE + bookTitle + ".",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showBookAddedCorrectlyToast(String bookTitle) {
    Fluttertoast.showToast(
        msg: bookTitle + NEW_BOOK_READING_PAGE,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }

  static void showBookRemovedCorrectlyToast(String bookTitle) {
    Fluttertoast.showToast(
        msg: bookTitle + BOOK_REMOVED_READING_PAGE,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0);
  }
}
