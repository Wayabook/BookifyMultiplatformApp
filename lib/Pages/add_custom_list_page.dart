import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_user_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';

class AddCustomListPage extends StatefulWidget {

  List<Book> bookshelf;
  String listTitle;
  ListType listType;
  bool showListTitleAndButtons;
  bool removeBackButton;
  String specificUserBookList;
  _AddCustomListPage _addCustomListPage = new _AddCustomListPage();

  AddCustomListPage(
      this.bookshelf,
      this.listTitle,
      this.listType,
      {
        this.showListTitleAndButtons = false,
        this.removeBackButton = true,
        this.specificUserBookList = ";;;",
      }
  );

  @override
  _AddCustomListPage createState() => _addCustomListPage;
}

class _AddCustomListPage extends State<AddCustomListPage> {

  List<Book> _bookshelf = [];

  TextEditingController controller;

  TabController _tabController;
  FocusNode _focusNode;

  String filter = "";
  Icon actionIcon = new Icon(Icons.search);
  String searchTitle = "Search...";
  TextField appBarTitle;

  @override
  void dispose() {
    controller.clear();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _focusNode = new FocusNode();
    controller = new TextEditingController();
    setState(() {
      _bookshelf = widget.bookshelf;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          _bookshelf = widget.bookshelf;
        });
      } else {
        setState(() {
          filter = controller.text;
        });
      }
    });

    this.appBarTitle = TextField(
      controller: controller,
      focusNode: _focusNode,
      decoration: new InputDecoration(
        hintText: searchTitle,
        hintStyle: new TextStyle(color: kPrimaryLightColor),
      ),
      style: new TextStyle(
        color: kPrimaryLightColor,
      ),
      //autofocus: true,
      cursorColor: kPrimaryLightColor,
      onTap: (){
        _checkInuptTextState(false);
      },
    );
    super.initState();
  }

  _checkInuptTextState(fromButton){
    setState(() {
      if (this.actionIcon.icon == Icons.search) {
        this.actionIcon = new Icon(Icons.close);
        _focusNode.requestFocus();
      } else {
        this.actionIcon = new Icon(Icons.search);
        _bookshelf = widget.bookshelf;
        _focusNode.unfocus();
        controller.clear();
      }
      if(fromButton)
        searchTitle = "Search...";
    });
  }


  @override
  Widget build(BuildContext context) {

    if ((filter.isNotEmpty)) {
      List<Book> tmpList = new List<Book>();
      for (int i = 0; i < _bookshelf.length; i++) {
        if (_bookshelf[i].title.toLowerCase().contains(
            filter.toLowerCase())) {
          tmpList.add(_bookshelf[i]);
        }
      }
      _bookshelf = tmpList;
    }

    final appBody = Container(
      child: VerticalBookListSearch(
        _bookshelf,
        widget.listType,
        title: widget.listTitle,
        specificLectureTitle: widget.specificUserBookList,
      ),
    );

    final appTopAppBar = AppBar(
      automaticallyImplyLeading: widget.removeBackButton,
      backgroundColor: kPrimaryDarkColor,
      elevation: 0.1,
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            _checkInuptTextState(true);
          },
        ),
      ],
    );

    return
      Scaffold(
        appBar: appTopAppBar,
        body: appBody,
      );
  }
}