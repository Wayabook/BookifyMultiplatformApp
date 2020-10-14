import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card_in_vertical_search_list.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_accept_and_cancel_options.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/friends_preview.dart';
import 'package:provider/provider.dart';

import '../editable_list_title.dart';


class VerticalBookListSearch extends StatefulWidget {

  VerticalBookListSearch(this.books, this.type, {this.title}); // : super(key: key);

  final List<Book> books;
  final ListType type;
  final String title;

  @override
  _VerticalBookListSearch createState() => _VerticalBookListSearch();
}

class _VerticalBookListSearch extends State<VerticalBookListSearch> {

  List<Lecture> customBooksList;

  @override
  void initState() {
    super.initState();
    User user = Provider.of<User>(context, listen: false);
    customBooksList = user.hasLectureList(widget.title) ? user.getLectureListByName(widget.title) : new List();
  }

  addOrRemoveBookFromTemporalCustomList(Book book, bool add){
    if(add){
      customBooksList.add(book);
    } else {
      customBooksList.remove(book);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: _makeBody(),
    );
  }

  _makeCard(int index) {
    if(widget.type == ListType.add_custom_list || widget.type == ListType.edit_custom_list){
      return BookCardInVerticalSearchList(
          widget.books[index],
          widget.type,
          addOrRemoveBookFromTemporalCustomList: addOrRemoveBookFromTemporalCustomList,
          listTitle: widget.title,
      );
    } else {
      return BookCardInVerticalSearchList(widget.books[index], widget.type);
    }

  }

  _getAcceptButton(){
    return FlatButton(
      child: Text(
          "Accept",
          style: TextStyle(color: Colors.blue,)
      ),
      onPressed: () async {
        if(customBooksList.length == 0){
          int result = await showDialog(
            context: context,
            builder: (BuildContext context) => DialogWithAcceptAndCancelOptions(
                "Delete List",
                "Any book selected. Are you sure you want to delete list?",
                TextStyle(color: Colors.red,),
                TextStyle(color: Colors.blue,)
            ),
          );
          if(result == DialogWithAcceptAndCancelOptions.ACCEPT_TAP){
            User user = Provider.of<User>(context, listen: false);
            user.removeLectureListByName(widget.title);
            InfoToast.showListRemovedCorrecltyFromBookshelf(widget.title);
          }
        } else {
          setState(() {
            User user = Provider.of<User>(context, listen: false);
            user.addCustomLectureList(widget.title, customBooksList);
          });
        }
        Navigator.pop(context, 0);
      },
    );
  }

  _getCancelButton(){
    return FlatButton(
      child: Text(
          "Cancel",
          style: TextStyle(color: Colors.red,)
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  _makeBody() {
    if (widget.type == ListType.add_custom_list || widget.type == ListType.edit_custom_list){
      return Stack(
        children: <Widget>[
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.books.length + 1,
              itemBuilder: (BuildContext context, int index) {
                  if(index == 0)
                    return ListTitle(widget.title);
                  return _makeCard(index - 1);
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: kPrimaryLightColor,
              height: 50,
              width:  MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: _getAcceptButton()
                  ),
                  Expanded(
                    flex: 5,
                    child: _getCancelButton()
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.books.length,
          itemBuilder: (BuildContext context, int index) {
            return _makeCard(index);
          },
        ),
      );
    }
  }
}