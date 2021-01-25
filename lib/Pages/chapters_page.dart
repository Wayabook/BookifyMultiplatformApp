import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/Chapter/chapter_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';

import '../Design/SizeConfig.dart';

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

              ListTitle(INDEX_TITLE),

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: book.chapters.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (PADDING_FACTOR_15 * SizeConfig.widthMultiplier),
                        vertical: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier),
                    ),
                    child: Container(
                      height: (CONTAINER_FACTOR_100 * SizeConfig.heightMultiplier),
                      key: UniqueKey(),
                      padding: EdgeInsets.all(PADDING_FACTOR_0),
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