import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/CommentPage/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../Design/SizeConfig.dart';

class ChapterCard extends StatelessWidget {
  Book book;
  int chapter;
  ChapterCard(this.book, this.chapter); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
      margin: new EdgeInsets.all(PADDING_FACTOR_0),
      child: Container(
        height: (CONTAINER_FACTOR_100 * SizeConfig.heightMultiplier), //100
        child: _makeListTile(context),
      ),
    );
  }

  _makeListTile(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(
              (BORDER_RADIUS_FACTOR_7 * SizeConfig.imageSizeMultiplier)), //7
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
            vertical: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    this.book.chapters[this.chapter].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: (TEXT_FACTOR_32 * SizeConfig.textMultiplier),
                    ), //32
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: kPrimaryDarkColor,
                          size: (ICON_FACTOR_24 *
                              SizeConfig.imageSizeMultiplier), //24
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CommentPage.showingAllBookComments(
                                    this.book,
                                    subCommentsPage: false,
                                    chapterTitle:
                                        this.book.chapters[this.chapter].title,
                                    chapterNumber: this.chapter,
                                    showAllCommentsOfChapter: true,
                                    inactiveAddCommentOption: true,
                                  )));
                        },
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
