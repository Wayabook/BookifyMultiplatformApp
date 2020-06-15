import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {

  SearchPage();

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            Icon(Icons.directions_car),
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
    /*setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });*/
  }
}