import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/search_book_or_person.dart';

class SearchPage extends StatelessWidget {

  SearchPage();

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";


  final _europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  var _filteredList = [];


  /*    return ListView.builder(
        itemCount: europeanCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(europeanCountries[index]),
          );
        },
      );

    }
  */


  @override
  Widget build(BuildContext context) {
    return SearchBookOrPerson();
  }
}
    /*DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [Text("Books"), Text("Users")],
          ),
          title: /*_isSearching ?*/ _buildSearchField() /*: _buildTitle(context)*/,
          actions: _buildActions(context),
          /*<Widget>[
            IconButton(
                /*onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },*/
                icon: Icon(Icons.search)
            )
          ],*/
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _europeanCountries == null ? 0 : _filteredList.length,
                itemBuilder: (BuildContext context, int index) {
                  return personCard(_filteredList[index]);
                },
              ),
            ),
            Icon(Icons.directions_transit),
            //Icon(Icons.directions_bike),
          ],
        ),
      ),
    );

    /*Scaffold(
      body: Column(
        children: <Widget>[
          // Page Content
        ],
      ),
      appBar: AppBar(
        title: Text("Search Book"),
        bottom: TabBar(
          tabs: [Text("Books"), Text("Users")],
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search)
          )
        ],
      ),
    );*/
  }

  /*Widget _buildTitle() {
    return
  }*/

  ListTile personListTile(String city) =>
      ListTile(
        title: Text(
          city,
          style: TextStyle(
              color: Colors.black45, fontWeight: FontWeight.bold),
        ),);

  Card personCard(String city) =>
      Card(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: personListTile(city),
        ),
      );

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery,
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          ModalRoute.of(context)
              .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

          _isSearching = true;
        },
      ),
    ];
  }

  void _startSearch(BuildContext context) {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    _isSearching = true;
    /*setState(() {
      _isSearching = true;
    });*/
  }

  void updateSearchQuery(String newQuery) {
    searchQuery = newQuery;

    /*setState(() {
      searchQuery = newQuery;
    });*/
  }

  void _stopSearching() {
    _clearSearchQuery();
    _isSearching = false;
    /*setState(() {
      _isSearching = false;
    });*/
  }

  void _clearSearchQuery() {
    _searchQueryController.clear();
    updateSearchQuery("");
    /*setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });*/
  }
}*/