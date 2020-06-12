import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';

class BookCover extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  final Book book;
  final double height;

  BookCover(
      this.book, {
        this.height = 100.0,
      });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

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

        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              this.book.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Text(
            this.book.author,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ),



    /*Column(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.circular(4.0),
              elevation: 2.0,
              child: Image.network(
                this.book.picture,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
            ),

            /*Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    this.book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),


            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  this.book.author,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              flex: 1,
            )*/
          ],
        ),*/

      ],
    );
  }
}