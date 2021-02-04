import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListContainer extends StatelessWidget {
  String title;
  User user;
  List<Book> books;
  BookListContainer(this.title, this.books, this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: ListTitle(
              this.title,
              barAndTitleColor: Colors.black,
            ),
          ),
        ),
        Container(
          key: UniqueKey(),
          child: HorizontalBookList(
            Book.toLectureList(this.books),
            ListType.normal,
            user: this.user,
          ),
        )
      ],
    );
  }
}
