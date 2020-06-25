import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_user_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';


class FriendsPage extends StatefulWidget {


  FriendsPage(this.followers, this.following);

  List<User> followers;
  List<User> following;
  //final String title;

  @override
  _FriendsPage createState() => _FriendsPage();
}

class _FriendsPage extends State<FriendsPage> with SingleTickerProviderStateMixin {

  List<User> _followersfilteredList = [];

  List<User> _followingFilteredList = [];

  TextEditingController controller = new TextEditingController();

  TabController _tabController;

  String filter = "";
  String persons = "";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Search...");


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
      _followersfilteredList = widget.followers;
      _followingFilteredList = widget.following;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          persons = "";
          _followersfilteredList = widget.followers;
          _followingFilteredList = widget.following;
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

    ListTile personListTile(String bookOrPerson) =>
        ListTile(
          title: Text(
            bookOrPerson,
            style: TextStyle(
                color: Colors.black45, fontWeight: FontWeight.bold),
          ),);

    Card personCard(bookOrPerson) => Card(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: personListTile(bookOrPerson),
      ),
    );

    if ((filter.isNotEmpty)) {
      List<User> tmpList = new List<User>();
      for (int i = 0; i < _followersfilteredList.length; i++) {
        if (_followersfilteredList[i].name.toLowerCase().contains(
            filter.toLowerCase())) {
          tmpList.add(_followersfilteredList[i]);
        }
      }
      _followersfilteredList = tmpList;
    }

    if ((persons.isNotEmpty)) {
      List<User> _tmpList2 = new List<User>();
      for (int i = 0; i < _followingFilteredList.length; i++) {
        if (_followingFilteredList[i].name.toLowerCase().contains(
            persons.toLowerCase())) {
          _tmpList2.add(_followingFilteredList[i]);
        }
      }
      _followingFilteredList = _tmpList2;
    }

    final appBody = TabBarView(
        controller: _tabController,
        children: [
          Container(
              child: VerticalUserList(_followersfilteredList)
          ),

          Container(
              child: VerticalUserList(_followingFilteredList)
          ),
        ]);

    final appTopAppBar = AppBar(
      elevation: 0.1,
      bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab( text: "Book"),
            Tab(text: "Person")


          ]
      ),
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                    /*prefixIcon: new Icon(Icons.search, color: Colors.white),*/
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white),
                  ),
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                  cursorColor: Colors.white,
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text(_tabController.index == 0 ? "Cities" : "Persons");
                _followersfilteredList = widget.followers;
                _followingFilteredList = widget.following;
                controller.clear();
              }
            });
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