import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';

class BookCover extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  final Book book;
  double height;
  final bool showInfo;
  final bool showTitle;
  final String chapterTitle;
  bool transparent;

  BookCover(
      this.book, {
        this.height = 100.0,
        this.showInfo = true,
        this.showTitle = true,
        this.chapterTitle = "",
        this.transparent = false,
      });

  _initializeDimensions(){
    if(this.height == 100.0)
      this.height = (14.64 * SizeConfig.heightMultiplier);
  }

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;
    _initializeDimensions();

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
                borderRadius: BorderRadius.circular((1.7 * SizeConfig.imageSizeMultiplier)), //7
              ),
              elevation: (2.43 * SizeConfig.widthMultiplier), //10
              child: Material(
                  borderRadius: BorderRadius.circular((0.97 * SizeConfig.imageSizeMultiplier)), //4
                  elevation: (0.48 * SizeConfig.imageSizeMultiplier), //2
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
      return Container(
        color: Colors.transparent,
        width: width,
        height: height,
        child: Column(
          children: <Widget>[
            Center(
              child: Image.network(
                this.book.picture,
                fit: BoxFit.cover,
                width: width,
                height: height - (2.05 * SizeConfig.textMultiplier) - (0.81 * SizeConfig.heightMultiplier),
              ),
            ),

            Center(
              child:  _getTitle(),
            )

          ],
        ),
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
          fontSize: (2.05 * SizeConfig.textMultiplier), //14
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
          fontSize: (2.05 * SizeConfig.textMultiplier), //14
          color: kPrimaryDarkColor,
        ),
      ),
    );

  }
}