import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';

class BookCover extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  final Book book;
  final double height;
  final bool showInfo;
  final bool showTitle;
  final String chapterTitle;

  BookCover(
      this.book, {
        this.height = 100.0,
        this.showInfo = true,
        this.showTitle = true,
        this.chapterTitle = "",
      });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    if(showInfo){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width,
            height: height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              elevation: 10,
              child: Material(
                  borderRadius: BorderRadius.circular(4.0),
                  elevation: 2.0,
                  child: Center(
                    child: Image.network(
                      this.book.picture,
                      fit: BoxFit.cover,
                      width: width,
                      height: height,
                    ),
                  )
              ),
            ),
          ),

          Center(
            child: _getTitle(),
          ),

          Center(
            child: _getAuthor(),
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            elevation: 10,
            child: Material(
                borderRadius: BorderRadius.circular(4.0),
                elevation: 2.0,
                child: Center(
                  child: Image.network(
                    this.book.picture,
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                  ),
                )
            ),
          ),

         Center(
           child:  _getTitle(),
         )

        ],
      );
    }
  }

  _getTitle(){
    return Align(
      alignment: Alignment.center,
      child: Text(
        this.showTitle ? this.book.title : chapterTitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  }

  _getAuthor(){
    return Align(
      alignment: Alignment.center,
      child: Text(
        this.book.author,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kPrimaryDarkColor,
        ),
      ),
    );

  }
}