import 'package:bookifyapp/Models/Lecture.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';

class HorizontalBookList extends StatelessWidget {

  List<Lecture> books;
  BuildContext context;
  ListType type;

  HorizontalBookList(this.books, this.type);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        color: Colors.blueGrey,
        child: _createListView(),
      ),
    );
  }


  _createListView(){
    var length = books.length;
    if(this.type == ListType.discover_option || this.type == ListType.view_all){
      length++;
    }

    return Container(
      height: 200,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          if(this.type == ListType.discover_option || this.type == ListType.view_all)
          {
            if(index < books.length){
              if (this.type == ListType.discover_option) {
                return BookCard(this.books[index], BookCardType.add_option);
              } else {
                return BookCard(this.books[index], BookCardType.without_add_option_and_progress_bar);
              }
            } else {
              if (this.type == ListType.discover_option) {
                return BookCard.option(BookCardType.disover);
              } else {
                return BookCard.option(BookCardType.view_all);
                //return BookCard(this.books[index], BookCardType.without_add_option);
              }
            }
          } else {
            return BookCard(this.books[index], BookCardType.add_option);
          }
        },
      ),
    );
  }
}

