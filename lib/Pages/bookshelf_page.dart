import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
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
import 'package:provider/provider.dart';

import 'add_custom_list_page.dart';


class BookshelfPage extends StatefulWidget {

  User user;
  bool scrollToLastPosition;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  BookshelfPage(this.user, { this.scrollToLastPosition = false });

  @override
  _BookshelfPage createState() => _BookshelfPage();
}

class _BookshelfPage extends State<BookshelfPage>{

  BuildContext context;

  /*@override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {

    this.context = context;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //body: _getCustomScrollView(),
      body: _getListView(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Bookshelf (" + widget.user.lectures.length.toString() + " lists)"),
      ),
    );
  }

  _getListView(){
    double width = MediaQuery.of(context).size.width;
    List<String> keys = widget.user.lectures.keys.toList();
    return ListView.builder
      (
        controller: widget.scrollToLastPosition ?
        ScrollController(initialScrollOffset: (MediaQuery.of(context).size.height / 4) * (widget.user.lectures.keys.length * 2)) : ScrollController(),
        itemCount: widget.user.lectures.keys.length * 2,
        itemBuilder: (BuildContext ctxt, int index) {
          if (index % 2 == 0){
            return _makeHeader(keys[index == 0 ? index : (index~/2)], width, index == 0);
          } else {
            var auxIndex = index;
            var key = keys[((auxIndex-1)~/2)];
            //return _makeHeader("Grido", width);

           /* crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4)*/
          return GridView.count(
            //primary: true,
            physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4),
            children: List.generate(widget.user.lectures[key].length, (index) {
              //Lecture aux = user.lectures[key][index];
              return BookCard(widget.user.lectures[key][index], BookCardType.book_card_in_grid);
            }),
          );
          }


        }
    );
  }

  _addReadListToLastPosition(){
    List<Lecture> read = widget.user.lectures['Read'];
    widget.user.lectures.remove('Read');
    widget.user.lectures['Read'] = read;
    //return user.lectures;
  }

  /*_getCustomScrollView(){
    //Map<String, List<Lecture>> userLists = user.bookLists;
    if(! widget.scrollToLastPosition)
      _addReadListToLastPosition();

    return  CustomScrollView(
      controller: widget.scrollToLastPosition ?
          ScrollController(initialScrollOffset: (MediaQuery.of(context).size.height / 4) * ((widget.user.lectures.keys.length * 2) - 1)) :
          ScrollController(),
      slivers: _createBookshelf(),
    );
  }*/

  /*_createBookshelf(){

    double width = MediaQuery.of(context).size.width;
    List<Widget> bookshelf = new List<Widget>();

    for(String key in widget.user.lectures.keys){
      //List<Lecture> bookList = userLists[key];

      bookshelf.add(
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _makeHeader(key, width)
              ],
            ),
          )
      );
      //bookshelf.add(_makeHeader(key, width));

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
                return BookCard(widget.user.lectures[key][index], BookCardType.book_card_in_grid);
              },
              childCount: widget.user.lectures[key].length,

            ),

          )
      );
    }
    return bookshelf;
  }*/

  goToEditListPage(String title) async {

    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>
        AddCustomListPage(Provider
            .of<User>(context, listen: false)
            .bookshelf, title, ListType.edit_custom_list)));

    setState(() {
      User user = Provider.of<User>(context, listen: false);
      widget.user.lectures[title] = user.lectures[title];
    });
  }

  _makeHeader(String title, width, [reading]) {
    //if return ListTitle(title);

    return reading ?   ListTitle(title):
      ListTitle(title, withButton: true, buttonType: ButtonType.edit_list, goToPageFromParent: goToEditListPage,);
  }


}