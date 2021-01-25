

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class BookCardInfo extends StatefulWidget {

  Lecture book;
  BookCardType type;

  BookCardInfo(this.book, this.type);

  @override
  _BookCardInfo createState() => _BookCardInfo();
}

class _BookCardInfo extends State<BookCardInfo>{

  final String _addedByString = " personas han guardado este libro";
  final int animationControllerDuration = 1500;

  _getTitleContainer(){
    return Center(
      child: Container(
        child: Text(
          widget.book.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 2.05 * SizeConfig.textMultiplier //14
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _getAuthorContainer(){
    return Center(
      child: Text(
        widget.book.author,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: (2.05 * SizeConfig.textMultiplier), //14
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _getChaptersInfo(){
    return <Widget>[
      Row(
        children: <Widget>[

          Flexible(
            flex: 2,
            child: Icon(
              Icons.bookmark,
              color: kPrimaryDarkColor,
              size: (2.92 * SizeConfig.heightMultiplier), //20
            ),
          ),

          Flexible(
            flex: 6,
            child: AutoSizeText(
              widget.book.current_chapter_title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: (2.05 * SizeConfig.textMultiplier) //14
              ),
              maxLines: 1,
            ),
          ),

          Flexible(
            flex: 2,
            child: Visibility(
              visible: widget.book.currentChapter != widget.book.chapters.length - 1,
              maintainSize: false,
              maintainAnimation: false,
              maintainState: false,
              child:  AutoSizeText(
                "+" + (widget.book.chapters.length - widget.book.currentChapter - 1).toString(),
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: (2.05 * SizeConfig.textMultiplier) //14
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    ];
  }

  _getAddedByInfo(){
    return <Widget>[
      Row(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Icon(
              Icons.bookmark,
              color: kPrimaryDarkColor,
              size: (2.92 * SizeConfig.heightMultiplier), //20
            ),
          ),

          Flexible(
            flex: 7,
            child: AutoSizeText(
              (widget.book.addedByNumberOfPeople.toString() + _addedByString),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (2.05 * SizeConfig.textMultiplier), //14
              ),
              maxLines: 1,
            ),
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        Flexible(
            flex: 2,
            child: (widget.type == BookCardType.book_card_in_vertical_list) ?
            Center(
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: !widget.book.finished  ? 1.0 : 0.0,
                duration: Duration(milliseconds: animationControllerDuration),
                // The green box must be a child of the AnimatedOpacity widget.
                child: _getTitleContainer(),
              ),
            ) : _getTitleContainer(),
        ),

        Flexible(
          flex: 2,
          child: (widget.type == BookCardType.book_card_in_vertical_list) ?
          AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: !widget.book.finished   ? 1.0 : 0.0,
              duration: Duration(milliseconds: animationControllerDuration),
              // The green box must be a child of the AnimatedOpacity widget.
              child: _getAuthorContainer()
          ) : _getAuthorContainer(),
        ),

        Flexible(
          flex: 4,
          child:  Align(
            alignment: Alignment.bottomCenter,
            child: (widget.type == BookCardType.book_card_in_vertical_list) ?
            AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: !widget.book.finished   ? 1.0 : 0.0,
                duration: Duration(milliseconds: animationControllerDuration),
                // The green box must be a child of the AnimatedOpacity widget.
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: _getChaptersInfo()
                )
            ) : Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: _getAddedByInfo()
            )
          ),
        )


      ]
    );
  }
}