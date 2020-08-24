
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoToast {

  static void showBookAddedCorrectlyToast(String bookTitle){
    Fluttertoast.showToast(
        msg: bookTitle + " added correctly to Reading page.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static void showBookRemovedCorrectlyToast(String bookTitle){

  }

}