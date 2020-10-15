import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Pages/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:url_launcher/url_launcher.dart';

class ChapterCard extends StatelessWidget {

  Book book;
  int chapter;
  ChapterCard(this.book, this.chapter); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: new EdgeInsets.fromLTRB(0, 0, 0, 0),
      child:  Container(
        height: 100,
        child: _makeListTile(context),
      ),
    );
  }

  _makeListTile(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius:  BorderRadius.circular(7.0)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Container(
            //color: Colors.black,
            //height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child:  AutoSizeText(
                    this.book.chapters[this.chapter].title,
                    style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32,),
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
                        ),
                        onPressed: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) =>
                              CommentPage.showingAllBookComments(this.book, subCommentsPage: false,
                                  chapterTitle: this.book.chapters[this.chapter].title,
                                  chapterNumber: this.book.chapters[this.chapter].number,
                                  showAllCommentsOfChapter: true,
                                  inactiveAddCommentOption: true,
                              )
                            /*CommentPage(
                            null,
                            subCommentsPage: false,
                            chapterTitle: this.book.chapters[this.chapter].title,
                            chapterNumber: this.book.chapters[this.chapter].number,
                          )*/));
                        },
                      )
                  ),
                )
              ],
            ),

          ),
        )
    );
  }
}