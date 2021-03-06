import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Interfaces/TitleButtonInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/book_card_factory.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:provider/provider.dart';

import '../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class VerticalBookList/*<T extends Book>*/ extends StatefulWidget {
  VerticalBookList(this.readingBooks, this.pendingBooks); // : super(key: key);

  List<Lecture> readingBooks;
  List<Lecture> pendingBooks;

  @override
  _VerticalBookList createState() =>
      _VerticalBookList(this.readingBooks, this.pendingBooks);
}

class _VerticalBookList extends State<VerticalBookList>
    with TickerProviderStateMixin
    implements TitleButtonInterface {
  int positionToChange;
  List<Widget> items;
  List<Lecture> readingBooks;
  List<Lecture> pendingBooks;

  _VerticalBookList(this.readingBooks, this.pendingBooks);

  @override
  void initState() {
    super.initState();
    updateLists();
    updateUILists();
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void updateLists() {
    var user = Provider.of<User>(context, listen: false);
    var aux = user.getLectureListByName(READING_LIST);
    widget.readingBooks = aux;
    widget.pendingBooks = user.getLectureListByName(PENDING_LIST);
  }

  void updateUILists() {
    items = new List();
    for (int index = 0;
        index < widget.readingBooks.length + widget.pendingBooks.length + 2;
        index++) {
      if (index == 0) {
        items.add(ListTitle(
          "Reading:",
          withButton: true,
          user: Provider.of<User>(context, listen: false),
          onListTitleButtonTapped: onTitleButtonPressed,
        ));
      } else if (index <= widget.readingBooks.length) {
        items.add(_makeCard(index - 1, widget.readingBooks, ButtonType.read));
      } else if (index == widget.readingBooks.length + 1) {
        items.add(ListTitle('Pending:'));
      } else {
        items.add(_makeCard(index - 2 - widget.readingBooks.length,
            widget.pendingBooks, ButtonType.read));
      }
    }
  }

  @override
  onTitleButtonPressed(ButtonType buttonType, BuildContext context,
      {String title}) {
    if (buttonType == ButtonType.view_all) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BookshelfPage(Provider.of<User>(context, listen: false))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    updateLists();
    updateUILists();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: kPrimaryDarkColor,
        body: _makeBody(),
      ),
    );
  }

  _makeCard(int index, List<Book> books, ButtonType buttonType) {
    return BookCardFactory(
            BookCardType.book_card_in_vertical_list, books[index],
            user: Provider.of<User>(context, listen: false),
            buttonType: buttonType,
            position: index,
            tickerProvider: this)
        .build(context: context);
  }

  _makeBody() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: FutureBuilder(
        builder: (context, projectSnap) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: this.readingBooks.length + pendingBooks.length + 2,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: width,
                height: (index == 0) || (index == this.readingBooks.length + 1)
                    ? (13.09 * SizeConfig.heightMultiplier)
                    : (26.18 * SizeConfig.heightMultiplier),
                key: UniqueKey(),
                //padding: EdgeInsets.all(0),
                child: items[index],
              );
            },
          );
        },
      ),
    );
  }
}
