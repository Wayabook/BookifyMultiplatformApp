import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';

import '../../Design/SizeConfig.dart';

class HorizontalBookList extends StatelessWidget {

  List<Lecture> books;
  BuildContext context;
  ListType type;
  User user;

  HorizontalBookList(this.books, this.type, {this.user});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(
            (2.43 * SizeConfig.widthMultiplier),
            0,
            (2.43 * SizeConfig.widthMultiplier),
            (1.46 * SizeConfig.heightMultiplier),
        ),
        color: kPrimaryDarkColor,
        child: _createListView(),
      ),
    );
  }


  _createListView(){

    return Container(
      height: (29.28 * SizeConfig.heightMultiplier), // 200
      width: (121.65 * SizeConfig.widthMultiplier), // 500
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (this.type == ListType.discover_option || this.type == ListType.view_all) ? books.length + 1: books.length,
        itemBuilder: (BuildContext context, int index) {
          if(this.type == ListType.discover_option || this.type == ListType.view_all)
          {
            if(index < books.length){
              if (this.type == ListType.discover_option) {
                return BookCard(this.books[index], BookCardType.add_option, user: this.user);
              } else {
                return BookCard(this.books[index], BookCardType.without_add_option_and_progress_bar, user: this.user);
              }
            } else {
              if (this.type == ListType.discover_option) {
                return BookCard.option(BookCardType.disover);
              } else {
                return BookCard.option(BookCardType.view_all, user: this.user);
              }
            }
          } else {
            return BookCard(this.books[index], BookCardType.add_option, user: this.user);
          }
        },
      ),
    );
  }
}

