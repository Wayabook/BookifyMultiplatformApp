import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/book_card_factory.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_accept_and_cancel_options.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:provider/provider.dart';
import 'package:bookifyapp/Design/size_constants.dart';

import '../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class VerticalBookListSearch extends StatefulWidget {
  VerticalBookListSearch(
    this.books,
    this.type, {
    this.title,
    this.specificLectureTitle,
    this.backgroundColor = kPrimaryDarkColor,
    this.onAcceptButtonTapped,
    this.onCancelButtonTapped,
    this.addOrRemoveBook,
  }); // : super(key: key);

  final List<Book> books;
  final ListType type;
  final String title;
  final String specificLectureTitle;
  Color backgroundColor;
  Function() onAcceptButtonTapped;
  Function() onCancelButtonTapped;
  Function(Book book, bool add) addOrRemoveBook;

  @override
  _VerticalBookListSearch createState() => _VerticalBookListSearch();
}

class _VerticalBookListSearch extends State<VerticalBookListSearch> {
  List<Lecture> customBooksList;

  @override
  void initState() {
    super.initState();
    if (widget.type != ListType.first_time_form &&
        widget.type != ListType.received_recommendation_form &&
        widget.type != ListType.send_recommendation_form) {
      User user = Provider.of<User>(context, listen: false);
      customBooksList = user.hasLectureList(widget.title)
          ? user.getLectureListByName(widget.title)
          : new List();
    } else {
      customBooksList = new List();
    }
  }

  addOrRemoveBookFromTemporalCustomList(Book book, bool add) {
    if (widget.type == ListType.received_recommendation_form ||
        widget.type == ListType.send_recommendation_form) {
      widget.addOrRemoveBook(book, add);
    } else {
      if (add) {
        customBooksList.add(book);
      } else {
        customBooksList.remove(book);
      }
    }
  }

  addOrRemoveBookFromPendingOrReadingList(Book book, bool add) {
    User user = Provider.of<User>(context, listen: false);
    if (add) {
      user.addLectureToLectureListByKey(
          book.toLecture(), widget.specificLectureTitle);
    } else {
      user.removeLectureFromLectureListByKey(
          book.toLecture(), widget.specificLectureTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: _makeBody(),
    );
  }

  _makeCard(int index) {
    if (widget.type == ListType.add_custom_list ||
        widget.type == ListType.edit_custom_list ||
        widget.type == ListType.first_time_form ||
        widget.type == ListType.received_recommendation_form ||
        widget.type == ListType.send_recommendation_form) {
      return BookCardFactory(
        BookCardType.book_card_in_vertical_search_list,
        widget.books[index].toLecture(),
        listType: widget.type,
        user: Provider.of<User>(context, listen: false),
        backgroundColor: widget.type == ListType.received_recommendation_form
            ? widget.backgroundColor
            : Colors.white,
        addOrRemoveBookFromTemporalCustomList:
            (widget.type == ListType.first_time_form)
                ? addOrRemoveBookFromPendingOrReadingList
                : addOrRemoveBookFromTemporalCustomList,
        listTitle: widget.title,
      ).build(context: context);
    } else {
      return BookCardFactory(
        BookCardType.book_card_in_vertical_search_list,
        widget.books[index].toLecture(),
        listType: widget.type,
        user: Provider.of<User>(context, listen: false),
      ).build(context: context);
    }
  }

  _onAcceptButtonTapped() async {
    if (customBooksList.length == 0) {
      int result = await showDialog(
        context: context,
        builder: (BuildContext context) => DialogWithAcceptAndCancelOptions(
            DELETE_LIST_OPTION,
            DELETE_LIST_CONFIRMATION_MESSAGE,
            TextStyle(
                color: Colors.red,
                fontSize: (TEXT_FACTOR_12 * SizeConfig.heightMultiplier)),
            TextStyle(
                color: Colors.blue,
                fontSize: (TEXT_FACTOR_12 * SizeConfig.heightMultiplier))),
      );
      if (result == DialogWithAcceptAndCancelOptions.ACCEPT_TAP) {
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
  }

  _getAcceptButton() {
    return FlatButton(
        child: Text(ACCEPT_OPTION,
            style: TextStyle(
              color: Colors.blue,
              fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
            )),
        onPressed: () async {
          if (widget.type == ListType.received_recommendation_form ||
              widget.type == ListType.send_recommendation_form) {
            widget.onAcceptButtonTapped();
          } else {
            _onAcceptButtonTapped();
            Navigator.pop(context, 0);
          }
        });
  }

  _getCancelButton() {
    return FlatButton(
      child: Text(CANCEL_OPTION,
          style: TextStyle(
            color: Colors.red,
            fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
          )),
      onPressed: () {
        if (widget.type == ListType.received_recommendation_form ||
            widget.type == ListType.send_recommendation_form) {
          widget.onCancelButtonTapped();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }

  _isEditableList() {
    return widget.type == ListType.add_custom_list ||
        widget.type == ListType.edit_custom_list ||
        widget.type == ListType.received_recommendation_form ||
        widget.type == ListType.send_recommendation_form;
  }

  _makeBody() {
    if (_isEditableList()) {
      return Stack(
        children: <Widget>[
          _getListContainer(_getStackListBuilder()),
          _getOptionsRow(),
        ],
      );
    } else if (widget.type == ListType.first_time_form) {
      return _getListContainer(_getListBuilderWithTitle());
    } else {
      return _getListContainer(_getNormalListBuilder());
    }
  }

  _getOptionsRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: kForthDarkColor,
        height: (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(flex: 5, child: _getAcceptButton()),
            Expanded(flex: 5, child: _getCancelButton())
          ],
        ),
      ),
    );
  }

  _getStackListBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: (widget.type == ListType.received_recommendation_form)
          ? widget.books.length
          : widget.books.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (widget.type != ListType.received_recommendation_form && index == 0)
          return ListTitle(widget.title);
        return _makeCard((widget.type == ListType.received_recommendation_form)
            ? index
            : index - 1);
      },
    );
  }

  _getListBuilderWithTitle() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.books.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0)
          return ListTitle(
            widget.title,
            fontSize: (3.21 * SizeConfig.textMultiplier),
          );
        return _makeCard(index - 1);
      },
    );
  }

  _getNormalListBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.books.length,
      itemBuilder: (BuildContext context, int index) {
        return _makeCard(index);
      },
    );
  }

  _getListContainer(listBuilder) {
    return Container(
      color: widget.backgroundColor,
      child: listBuilder,
    );
  }
}
