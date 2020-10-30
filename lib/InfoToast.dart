
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Design/constants.dart';

class InfoToast {

  static void showInterestsSavedCorrectly(){
    Fluttertoast.showToast(
        msg: "Your interests as a lecturer were saved correctly.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showRecommendationsSavedCorrectly(){
    Fluttertoast.showToast(
        msg: "Selected recommendations were saved correctly.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showListRemovedCorrecltyFromBookshelf(String listTitle){
    Fluttertoast.showToast(
        msg: listTitle + "books list was removed correctly from your Bookshelf.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showListCopiedCorrecltyToBookshelf(String listTitle){
    Fluttertoast.showToast(
        msg: listTitle + "books list was added correctly to your Bookshelf.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showCommentRemovedCorrectly(bool comment){
    String commentText =  comment ? "Comment" : "Sub-comment";
    Fluttertoast.showToast(
        msg: commentText + " removed correctly.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showFinishedCongratulationsMessage(String bookTitle){
    Fluttertoast.showToast(
        msg: "Congratulations you just finished: " + bookTitle + ".",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showBookAddedCorrectlyToast(String bookTitle){
    Fluttertoast.showToast(
        msg: bookTitle + " correctly added to Reading page.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

  static void showBookRemovedCorrectlyToast(String bookTitle){
    Fluttertoast.showToast(
        msg: bookTitle + " correctly removed from Reading page.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: kPrimaryLightColor,
        fontSize: 16.0
    );
  }

}