import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/Models/Book.dart';


class SearchBookOrPerson extends StatefulWidget {


  SearchBookOrPerson(this.books, {Key key, this.title}) : super(key: key);

  List<Book> books;
  final String title;

  @override
  _SearchBookOrPerson createState() => _SearchBookOrPerson();
}

class _SearchBookOrPerson extends State<SearchBookOrPerson> with SingleTickerProviderStateMixin {

  /*List<String> _cities = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];*/

  List<String> _persons = ["John Smith", "Alex Johnson", "Jane Doe", "Eric Johnson", "Michael Eastwood", "Benjamin Woods"];

  List<Book> _filteredList = [];

  List<String> _personsList = [];

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
      _filteredList = widget.books;
      _personsList = _persons;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          persons = "";
          _filteredList = widget.books;
          _personsList = _persons;
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
      List<Book> tmpList = new List<Book>();
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i].title.toLowerCase().contains(
            filter.toLowerCase())) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }

    if ((persons.isNotEmpty)) {
      List<String> _tmpList2 = new List<String>();
      for (int i = 0; i < _personsList.length; i++) {
        if (_personsList[i].toLowerCase().contains(
            persons.toLowerCase())) {
          _tmpList2.add(_personsList[i]);
        }
      }
      _personsList = _tmpList2;
    }

    final appBody = TabBarView(
        controller: _tabController,
        children: [
          Container(
              child: VerticalBookListSearch(_filteredList)
            /*ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.books == null ? 0 : _filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return personCard(_filteredList[index].title);
              },
            ),*/
          ),

          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _persons == null ? 0 : _personsList.length,
              itemBuilder: (BuildContext context, int index) {
                return personCard(_personsList[index]);
              },
            ),
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
                _filteredList = widget.books;
                _personsList = _persons;
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