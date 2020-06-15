import 'package:flutter/material.dart';

class SearchBookOrPerson extends StatefulWidget {
  SearchBookOrPerson({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchBookOrPerson createState() => _SearchBookOrPerson();
}

class _SearchBookOrPerson extends State<SearchBookOrPerson> {

  List<String> _cities = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  List<String> _persons = ["John Smith", "Alex Johnson", "Jane Doe", "Eric Johnson", "Michael Eastwood", "Benjamin Woods"];

  List<String> _filteredList = [];
  //List<String> _elementsList = [];
  TextEditingController controller = new TextEditingController();

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
    //PersonDataBuilder pdb = new PersonDataBuilder();
    /*List<Person> tmpList = new List<Person>();
    for (int i = 0; i < pdb
        .getPeople()
        .length; i++) {
      tmpList.add(pdb.getPeople()[i]);
    }*/
    setState(() {
      //_personList = tmpList;
      _filteredList = _cities;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          _filteredList = _cities;
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

    Card personCard(bookOrPeson) =>
        Card(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: personListTile(bookOrPeson),
          ),
        );

    if ((filter.isNotEmpty)) {
      List<String> tmpList = new List<String>();
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i].toLowerCase().contains(
            filter.toLowerCase())) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }

    final appBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _cities == null ? 0 : _filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          return personCard(_filteredList[index]);
        },
      ),
    );

    final appTopAppBar = AppBar(
      elevation: 0.1,
      bottom: TabBar(
        tabs: [
          GestureDetector(
            child: Text("City"),
            onTap: (){
              _filteredList = _cities;
            },
          ),

          GestureDetector(
            child: Text("Person"),
            onTap: (){
              _filteredList = _persons;
            },
          ),
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
                this.appBarTitle = new Text("Cities");
                _filteredList = _cities;
                controller.clear();
              }
            });
          },
        ),
      ],
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appTopAppBar,
        body: appBody,
      ),
    );
  }

}