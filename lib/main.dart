// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'Pages/discover_page.dart';
import 'Pages/profile_page.dart';
import 'Pages/reading_page.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  List<Book> books;
  List<Genre> genres;
  User user;


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  /*final List<Widget> _widgetOptions = [
    ReadingPage(Colors.white, "Reading Page"),
    DiscoverPage(Colors.white, "Discover Page"),
    ProfilePage(user)
  ];*/

  @override
  Widget build(BuildContext context) {

    initialize_items();
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),

      // Children are the pages that will be shown by every click
      // They should placed in order such as
      // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
      children: <Widget>[
        ReadingPage(Colors.white, "Reading Page"),
        DiscoverPage(Colors.white, "Discover Page"),
        ProfilePage(this.user, ProfileType.user_profile),
      ],

      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }

  initialize_items(){
    if(this.books == null){
      this.books = new List();
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
    }

    if(this.genres == null){
      this.genres = new List();
      Genre genre1 = Genre("1", "Genre1", "genre1.png");
      Genre genre2 = Genre("2", "Genre2", "genre2.png");
      Genre genre3 = Genre("3", "Genre3", "genre3.png");
      Genre genre4 = Genre("4", "Genre4", "genre4.png");
      Genre genre5 = Genre("5", "Genre5", "genre5.png");
      Genre genre6 = Genre("6", "Genre6", "genre6.png");
      Genre genre7 = Genre("7", "Genre7", "genre7.png");
      Genre genre8 = Genre("8", "Genre8", "genre8.png");
      Genre genre9 = Genre("9", "Genre9", "genre9.png");

      genres.add(genre1);
      genres.add(genre2);
      genres.add(genre3);
      genres.add(genre4);
      genres.add(genre5);
      genres.add(genre6);
      genres.add(genre7);
      genres.add(genre8);
      genres.add(genre9);
    }

    if(user == null) {
      Map<String, List<Book>> userLists =
      {'Reading': books, 'Pending': books, 'Read': books, 'Recommended': books, 'Custom List 1': books};

      this.user = new User(
          "1",
          "Bill Gates",
          "\"Not as good as Steve Jobs\"",
          this.genres,
          userLists,
          21,
          198,
          345,
          "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4"
      );

      List<User> users = new List();
      User user222 = new User(
          "1",
          "Steve Jobs",
          "\"Not as good as Steve Jobs\"",
          genres,
          userLists,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user1 = new User(
          "1",
          "Steve Jobs 1",
          "\"Not as good as Steve Jobs\"",
          genres,
          userLists,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user2 = new User(
          "1",
          "Steve Jobs 2",
          "\"Not as good as Steve Jobs\"",
          genres,
          userLists,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user3 = new User(
          "1",
          "Steve Jobs 3",
          "\"Not as good as Steve Jobs\"",
          genres,
          userLists,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user4 = new User(
          "1",
          "Steve Jobs 33",
          "\"Not as good as Steve Jobs\"",
          genres,
          userLists,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      users.add(user222);
      users.add(user1);
      users.add(user2);
      users.add(user3);
      users.add(user4);

      this.user.followers = users;
      this.user.following = users;
    }
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.local_library),
      title: Text('Reading'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('Discover'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('Profile'),
    ),

  ];

}

class Page extends StatelessWidget {
  final String title;

  const Page(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text(title);

    return Scaffold(
      body: Container(
        child: Center(
            child: FlatButton(
                onPressed: () => _openDetailsPage(context), child: text)),
      ),
      appBar: AppBar(
        title: text,
      ),
    );
  }

  //Use the navigator like you usually do with .of(context) method
  _openDetailsPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

//  _openDetailsPage(BuildContext context) => mainNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

}

class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Scaffold(
      body: Container(
        child: Center(child: text),
      ),
      appBar: AppBar(title: text),
    );
  }
}
