import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_user_list.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';

import '../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  List<Book> books;
  List<User> users;

  SearchPage(this.books, this.users);

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  List<Book> _filteredList = [];

  List<User> _personsList = [];

  TextEditingController controller = new TextEditingController();

  TabController _tabController;

  String filter = "";
  String persons = "";
  Icon actionIcon = new Icon(Icons.search, color: kThirdDarkColor);
  Widget appBarTitle = new Text(
    "Search...",
    style: TextStyle(color: kThirdDarkColor),
  );

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
    setState(() {
      _filteredList = widget.books;
      _personsList = widget.users;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          persons = "";
          _filteredList = widget.books;
          _personsList = widget.users;
        });
      } else {
        setState(() {
          filter = controller.text;
          persons = controller.text;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((filter.isNotEmpty)) {
      List<Book> tmpList = new List<Book>();
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i]
            .title
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }

    if ((persons.isNotEmpty)) {
      List<User> _tmpList2 = new List<User>();
      for (int i = 0; i < _personsList.length; i++) {
        if (_personsList[i]
            .name
            .toLowerCase()
            .contains(persons.toLowerCase())) {
          _tmpList2.add(_personsList[i]);
        }
      }
      _personsList = _tmpList2;
    }

    final appBody = TabBarView(
      controller: _tabController,
      children: [
        Container(
            child: VerticalBookListSearch(
                _filteredList, ListType.preview_friends)),
        Container(child: VerticalUserList(_personsList)),
      ],
    );

    final appTopAppBar = AppBar(
      backgroundColor: kPrimaryDarkColor,
      iconTheme: IconThemeData(
        color: kThirdDarkColor, //change your color here
      ),
      elevation: 0.1,
      bottom: TabBar(
          controller: _tabController,
          indicatorColor: kSecondaryDarkColor,
          tabs: [
            Tab(
                child: Text(
              BOOK_TITLE,
              style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier),
                  color: kThirdDarkColor),
            )),
            Tab(
                child: Text(
              PERSON_TITLE,
              style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier),
                  color: kThirdDarkColor),
            ))
          ]),
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(
                  Icons.close,
                  color: kThirdDarkColor,
                );
                this.appBarTitle = new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: kThirdDarkColor),
                  ),
                  style: new TextStyle(
                    color: kThirdDarkColor,
                  ),
                  autofocus: true,
                  cursorColor: kThirdDarkColor,
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text(
                  _tabController.index == 0 ? "Book" : "Persons",
                  style: TextStyle(color: kThirdDarkColor),
                );
                _filteredList = widget.books;
                _personsList = widget.users;
                controller.clear();
              }
            });
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appTopAppBar,
      body: appBody,
    );
  }
}
