import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';

class BookCover extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  final Book book;
  final double height;
  final bool showInfo;

  BookCover(
      this.book, {
        this.height = 100.0,
        this.showInfo = true,
      });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    if(showInfo){
      return Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            elevation: 10,
            child: Material(
              borderRadius: BorderRadius.circular(4.0),
              elevation: 2.0,
              child: Image.network(
                this.book.picture,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
            ),
          ),

          _getTitle(),

          _getAuthor()
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Card(
            //margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            elevation: 10,
            child: Material(
              borderRadius: BorderRadius.circular(4.0),
              elevation: 2.0,
              child: Image.network(
                this.book.picture,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
            ),
          ),

          _getTitle(),

        ],
      );
    }
  }

  _getTitle(){
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Text(
          this.book.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

  }

  _getAuthor(){
    return Align(
      alignment: Alignment.center,
      child: Text(
        this.book.author,
        style: TextStyle(
          color: Colors.blueGrey,
        ),
      ),
    );

  }
}