import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/Models/Book.dart';


class ProfilePage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  ProfilePage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    List<Book> books =  List();
    String description =
    """
    Engánchate al fenómenoValeria de @BetaCoqueta, una saga altamente divertida, emotiva y sensual.

    ¡Te vas a enamorar!
    
    Valeria es escritora de historias de amor.
    Valeria vive el amor de forma sublime.
    Valeria tiene tres amigas: Nerea, Carmen y Lola.
    Valeria vive en Madrid.
    Valeria ama a Adrián hasta que conoce a Víctor.
    Valeria necesita sincerarse consigo misma.
    Valeria llora, Valeria ríe, Valeria camina...
    Pero el sexo, el amor y los hombres no son objetivos fáciles.
    Valeria es especial.
    Como tú.
    
    En los zapatos de Valeria es el primer libro de la«Saga Valeria», la primera obra deElísabet Benavent, que inició su carrera literaria autopublicándose y que en poco tiempo conquistó a cientos de lectores y se situó en los primeros puestos de la lista de más vendidos de ficción.
    
    Posteriormente la autora, también conocida por sus fans como@BetaCoqueta, ha continuado cosechando grandes éxitos con la publicación de su«Saga Silvia», la trilogía«Mi elección», la bilogía«Horizonte Martina» y la novelaMi isla.
    """;
    /*"Engánchate al fenómenoValeria de @BetaCoqueta, una saga altamente divertida, emotiva y sensual.\n" &
    "¡Te vas a enamorar!\n" &
    "Valeria es escritora de historias de amor.\n"&
    "Valeria vive el amor de forma sublime.\n"&
    "Valeria tiene tres amigas: Nerea, Carmen y Lola.\n"&
    "Valeria vive en Madrid.\n"&
    "Valeria ama a Adrián hasta que conoce a Víctor.\n"&
    "Valeria necesita sincerarse consigo misma.\n"&
    "Valeria llora, Valeria ríe, Valeria camina...\n"&
    "Pero el sexo, el amor y los hombres no son objetivos fáciles.\n"&
    "Valeria es especial.\n"&
    "Como tú.\n\n"&
    "En los zapatos de Valeria es el primer libro de la«Saga Valeria», la primera obra deElísabet Benavent, que inició su carrera literaria autopublicándose y que en poco tiempo conquistó a cientos de lectores y se situó en los primeros puestos de la lista de más vendidos de ficción.\n"&
    "Posteriormente la autora, también conocida por sus fans como@BetaCoqueta, ha continuado cosechando grandes éxitos con la publicación de su«Saga Silvia», la trilogía«Mi elección», la bilogía«Horizonte Martina» y la novelaMi isla.";*/

    Book book1 = new Book.withSummary(
        "En los Zapatos de Valeria",
        "Elisabeth Benavent",
        "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg",
        description);
    Book book2 = new Book.withSummary(
        "En busca del chico irrompible",
        "Coque Mesa",
        "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
        description);

    Book book3 = new Book.withSummary(
        "Con el amor bastaba",
        "Maxim Huerta",
        "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
        description);

    Book book4 = new Book.withSummary(
        "A próposito de nada",
        "Woody Allen",
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
        description);

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    return SearchByCityOrPerson(books);
  }

}

class SearchByCityOrPerson extends StatefulWidget {


  SearchByCityOrPerson(this.books, {Key key, this.title}) : super(key: key);

  List<Book> books;
  final String title;

  @override
  _SearchByCityOrPerson createState() => _SearchByCityOrPerson();
}

class _SearchByCityOrPerson extends State<SearchByCityOrPerson> with SingleTickerProviderStateMixin {

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
            Tab( text: "City"),
            Tab(text: "person")


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

/*class ListPersonPage extends StatefulWidget {
  ListPersonPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPersonPageState createState() => _ListPersonPageState();
}

class _ListPersonPageState extends State<ListPersonPage> {
  List<Person> _personList = [];
  List<Person> _filteredList = [];
  TextEditingController controller = new TextEditingController();
  String filter = "";

  Widget appBarTitle = new Text("List of People");
  Icon actionIcon = new Icon(Icons.search);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    PersonDataBuilder pdb = new PersonDataBuilder();
    List<Person> tmpList = new List<Person>();
    for (int i = 0; i < pdb
        .getPeople()
        .length; i++) {
      tmpList.add(pdb.getPeople()[i]);
    }
    setState(() {
      _personList = tmpList;
      _filteredList = _personList;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          _filteredList = _personList;
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
    final appTopAppBar = AppBar(
      elevation: 0.1,
      bottom: TabBar(
        tabs: [Text("Books"), Text("Users")],
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
                this.appBarTitle = new Text("List of People");
                _filteredList = _personList;
                controller.clear();
              }
            });
          },
        ),
      ],
    );

    ListTile personListTile(Person person) =>
        ListTile(
          title: Text(
            person.personFirstName + " " + person.personLastName,
            style: TextStyle(
                color: Colors.black45, fontWeight: FontWeight.bold),
          ),);

    Card personCard(Person person) =>
        Card(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: personListTile(person),
          ),
        );

    if ((filter.isNotEmpty)) {
      List<Person> tmpList = new List<Person>();
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i].personFirstName.toLowerCase().contains(
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
        itemCount: _personList == null ? 0 : _filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          return personCard(_filteredList[index]);
        },
      ),
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

class Person {
  String personFirstName;
  String personLastName;

  Person(
      {this.personFirstName, this.personLastName}
      );
}

class PersonDataBuilder {
  List getPeople() {
    return [
      Person(
          personFirstName: "John",
          personLastName: "Smith"
      ),
      Person(
          personFirstName: "Alex",
          personLastName: "Johnson"
      ),
      Person(
          personFirstName: "Jane",
          personLastName: "Doe"
      ),
      Person(
          personFirstName: "Eric",
          personLastName: "Johnson"
      ),
      Person(
          personFirstName: "Michael",
          personLastName: "Eastwood"
      ),
      Person(
          personFirstName: "Benjamin",
          personLastName: "Woods"
      ),
      Person(
          personFirstName: "Abraham",
          personLastName: "Atwood"
      ),
      Person(
          personFirstName: "Anna",
          personLastName: "Clack"
      ),
      Person(
          personFirstName: "Clark",
          personLastName: "Phonye"
      ),
      Person(
          personFirstName: "Kerry",
          personLastName: "Mirk"
      ),
      Person(
          personFirstName: "Eliza",
          personLastName: "Wu"
      ),
      Person(
          personFirstName: "Jackey",
          personLastName: "Lee"
      ),
      Person(
          personFirstName: "Kristin",
          personLastName: "Munson"
      ),
      Person(
          personFirstName: "Oliver",
          personLastName: "Watson"
      ),

    ];
  }

  List getPeople2() {
    return [
      Person(
          personFirstName: "John1",
          personLastName: "Smith"
      ),
      Person(
          personFirstName: "Alex2",
          personLastName: "Johnson"
      ),
      Person(
          personFirstName: "Jane3",
          personLastName: "Doe"
      ),
      Person(
          personFirstName: "Eric4",
          personLastName: "Johnson"
      ),
      Person(
          personFirstName: "Michael",
          personLastName: "Eastwood"
      ),
      Person(
          personFirstName: "Benjamin",
          personLastName: "Woods"
      ),
      Person(
          personFirstName: "Abraham",
          personLastName: "Atwood"
      ),
      Person(
          personFirstName: "Anna",
          personLastName: "Clack"
      ),
      Person(
          personFirstName: "Clark",
          personLastName: "Phonye"
      ),
      Person(
          personFirstName: "Kerry",
          personLastName: "Mirk"
      ),
      Person(
          personFirstName: "Eliza",
          personLastName: "Wu"
      ),
      Person(
          personFirstName: "Jackey",
          personLastName: "Lee"
      ),
      Person(
          personFirstName: "Kristin",
          personLastName: "Munson"
      ),
      Person(
          personFirstName: "Oliver",
          personLastName: "Watson"
      ),

    ];
  }
}*/