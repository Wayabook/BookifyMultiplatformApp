import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  final String url;
  final double height;

  BookCover(
      this.url, {
        this.height = 100.0,
      });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        elevation: 10,
        child: Material(
          borderRadius: BorderRadius.circular(4.0),
          elevation: 2.0,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        ),
    );
  }
}