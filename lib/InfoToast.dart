
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoToast {

  static void showFinishedCongratulationsMessage(String bookTitle){
    Fluttertoast.showToast(
        msg: "Congratulations you just ended: " + bookTitle + ".",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
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
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static void showBookRemovedCorrectlyToast(String bookTitle){
    Fluttertoast.showToast(
        msg: bookTitle + " correctly removed to Reading page.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}