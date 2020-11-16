import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/Chapter/chapter_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';

import '../SizeConfig.dart';

class ChaptersPage extends StatelessWidget {

  Book book;

  ChaptersPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          color: kPrimaryDarkColor,
          child: Column(
            children: [

              ListTitle("Index"),

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: book.chapters.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        (3.64 * SizeConfig.widthMultiplier),//15
                        (2.43 * SizeConfig.widthMultiplier), //10
                        (3.64 * SizeConfig.widthMultiplier),//15
                        (2.43 * SizeConfig.widthMultiplier), //10
                    ),
                    child: Container(
                      height: (14.64 * SizeConfig.heightMultiplier), //100
                      key: UniqueKey(),
                      padding: EdgeInsets.all(0),
                      child: ChapterCard(this.book, index),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
      ),
    );
  }
}