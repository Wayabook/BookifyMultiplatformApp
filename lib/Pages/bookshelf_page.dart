import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/Models/User.dart';


class BookshelfPage extends StatelessWidget {

  User user;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //List<Book> books =  List();
  BuildContext context;

  BookshelfPage(this.user);

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CustomScrollView(
        slivers: _createBookshelf(this.user.bookLists),
      ),
      appBar: AppBar(
        title: Text("Bookshelf"),
      ),
    );
  }

  _createBookshelf(Map<String, List<Lecture>> userLists){

    double width = MediaQuery.of(context).size.width;
    List<Widget> bookshelf = new List<Widget>();

    for(String key in userLists.keys){
      List<Lecture> bookList = userLists[key];

      bookshelf.add(
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                _makeHeader(key, width)
              ],
            ),
          )
      );

      bookshelf.add(
          new SliverGrid(
            //padding:EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4)
            ),

            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return BookCard(bookList[index], BookCardType.book_card_in_grid);
              },
              childCount: bookList.length,

            ),

          )
      );
    }
    return bookshelf;
  }

  _makeHeader(String title, width) {
    return ListTitle(title);
  }


}