import 'package:bookifyapp/Enums/list_type.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_user_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';

class AddCustomListPage extends StatefulWidget {

  List<Book> bookshelf;
  String listTitle;
  AddCustomListPage(this.bookshelf, this.listTitle);

  @override
  _AddCustomListPage createState() => _AddCustomListPage();
}

class _AddCustomListPage extends State<AddCustomListPage> {

  List<Book> _bookshelf = [];

  TextEditingController controller = new TextEditingController();

  TabController _tabController;

  String filter = "";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Search...");

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
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
      child: VerticalBookListSearch(_bookshelf, ListType.add_custom_list, title: widget.listTitle,),
    );
    /*final appBody = Scaffold(
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.listTitle.isEmpty ? "Custom List 1" : widget.listTitle,
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Container(color: Colors.white, height: 2, width: MediaQuery.of(context).size.width),
            ),

            VerticalBookListSearch(_bookshelf),
          ],
        ),
        //child: VerticalBookListSearch(_bookshelf)
    );*/

    final appTopAppBar = AppBar(
      elevation: 0.1,
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
                _bookshelf = widget.bookshelf;
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