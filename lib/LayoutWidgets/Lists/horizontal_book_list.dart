import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/book_card_factory.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';

import '../../Design/SizeConfig.dart';

class HorizontalBookList extends StatelessWidget {
  static const double DEFAULT_PADDING_FACTOR = 1.46;
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
          (PADDING_FACTOR_10 * SizeConfig.widthMultiplier),
          (PADDING_FACTOR_0),
          (PADDING_FACTOR_10 * SizeConfig.widthMultiplier),
          (DEFAULT_PADDING_FACTOR * SizeConfig.heightMultiplier),
        ),
        color: kPrimaryDarkColor,
        child: _createListView(),
      ),
    );
  }

  _createListView() {
    return Container(
      height: (CONTAINER_FACTOR_200 * SizeConfig.heightMultiplier), // 200
      width: (CONTAINER_FACTOR_500 * SizeConfig.widthMultiplier), // 500
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (this.type == ListType.discover_option ||
                this.type == ListType.view_all)
            ? books.length + 1
            : books.length,
        itemBuilder: (BuildContext context, int index) {
          return _getBookCardFactory(index);
        },
      ),
    );
  }

  _getBookCardFactory(index) {
    if (this.type != ListType.discover_option &&
        this.type != ListType.view_all) {
      return BookCardFactory(BookCardType.add_option, this.books[index],
              user: this.user)
          .build(context: context);
    } else if (index == books.length) {
      return (this.type == ListType.discover_option)
          ? BookCardFactory(BookCardType.disover, null).build(context: context)
          : BookCardFactory(BookCardType.view_all, null, user: this.user)
              .build(context: context);
    } else if (this.type == ListType.discover_option) {
      return BookCardFactory(BookCardType.add_option, this.books[index],
              user: this.user)
          .build(context: context);
    } else {
      return BookCardFactory(BookCardType.without_add_option_and_progress_bar,
              this.books[index],
              user: this.user)
          .build(context: context);
    }
  }
}
