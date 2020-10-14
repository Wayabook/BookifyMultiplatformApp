import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:bookifyapp/Pages/LoginPages/Welcome/welcome_page.dart';
import 'package:bookifyapp/Pages/profile_page.dart';
import 'package:bookifyapp/Pages/reading_page.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import 'discover_page.dart';


class MainTabPage extends StatefulWidget {

  MainTabPage({Key key}) : super(key: key);

  @override
  _MainTabPage createState() => _MainTabPage();
}

class _MainTabPage extends State<MainTabPage> {
  int _selectedIndex = 0;

  List<Book> books;
  List<Lecture> lectures;
  List<Genre> genres;
  User user;
  int _currentIndex;


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState(){

    super.initState();
    _currentIndex = 0;
  }

  changeCurrentIndex(int position){
    setState(() {
      _currentIndex = position;
    });
  }

  @override
  Widget build(BuildContext context) {

    BottomNavigationBar bottomNavigationBar =  BottomNavigationBar(
      items: _items,
      currentIndex: _currentIndex,
    );
    //bottomNavigationBar.selected
    //initialize_items();
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          backgroundColor: Colors.white54,
          //currentIndex: 2,
        ),
      ),

      children: _get_pages(), /*<Widget>[
        ReadingPage(this.user),
        DiscoverPage(Colors.white, "Discover Page"),
        DiscoverPage(Colors.white, "Discover Page"),
        //ProfilePage(this.user, ProfileType.user_profile),
      ],*/

      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }

  _get_pages(){
    initialize_items();
    return [
      ReadingPage(),
      DiscoverPage(kPrimaryLightColor, "Discover Page"),
      ProfilePage(Provider.of<User>(context, listen: false), ProfileType.user_profile),
    ];
  }

  initialize_items(){
    if(this.lectures == null){
      this.books = new List();
      this.lectures = new List();
      Shop shop1 = new Shop.withoutIds("Casa del Libro", "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg");
      Shop shop2 = new Shop.withoutIds("Fnac", "https://upload.wikimedia.org/wikipedia/commons/2/2e/Fnac_Logo.svg");
      Shop shop3 = new Shop.withoutIds("El corte ingles", "https://pbs.twimg.com/profile_images/1214523397239115781/wuA5BVB4_400x400.jpg");
      Shop shop4 = new Shop.withoutIds("Taugus Books", "https://imagessl.casadellibro.com/t19/i/logo.png");
      Shop shop5 = new Shop.withoutIds("Me gusta leer", "https://tienda.megustaleer.com/img/tienda-megustaleer-logo-1585260247.jpg");

      List<Item> items = new List();
      items.add(new Item.withoutId(shop1, "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€", "1", "2"));
      items.add(new Item.withoutId(shop2, "https://tienda.megustaleer.com/libros/2519-dulce-chico-indecente-9788490708248.html", 16.05, "€", "1", "2"));
      items.add(new Item.withoutId(shop3, "https://www.elcorteingles.es/libros/A35120735-en-busca-del-chico-irrompible-tapa-dura-9788408228059/", 16.05, "€", "1", "2"));
      items.add(new Item.withoutId(shop4, "https://www.tagusbooks.com/ebook-en-busca-del-chico-irrompible-ebook/9788408230663/11537354", 16.05, "€", "1", "2"));
      items.add(new Item.withoutId(shop5, "https://tienda.megustaleer.com/libros/2519-dulce-chico-indecente-9788490708248.html", 16.05, "€", "1", "2"));

      Map<String, List<Item>> shopItems = {
        'Tapa Blanda': items,
        'Tapa Dura' : items,
        'Tapa Ebook': items,
      };



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

      List<Chapter> chapters = new List();
      chapters.add(new Chapter(1, "Capitulo 1 :  Inicio"));
      chapters.add(new Chapter(2, "Capitulo 2 :  Post Inicio"));
      chapters.add(new Chapter(3, "Capitulo 3 :  Pre Final"));
      chapters.add(new Chapter(4, "Capitulo 4 :  Final"));


      /*List<String> chapter_titles = [
        "Capitulo 1 :  Inicio" ,
        "Capitulo 2 :  Post Inicio" ,
        "Capitulo 3 :  Pre Final" ,
        "Capitulo 4 :  Final" ,
      ];*/

      Book book1 = new Book.withSummary(
          "En los Zapatos de Valeria",
          "Elisabeth Benavent",
          "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg",
          description,
          shopItems,
          chapters: chapters);

      Book book2 = new Book.withSummary(
          "En busca del chico irrompible",
          "Coque Mesa",
          "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
          description,
          shopItems,
          chapters: chapters
      );

      Book book3 = new Book.withSummary(
          "Con el amor bastaba",
          "Maxim Huerta",
          "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
          description,
          shopItems,
          chapters: chapters
      );

      Book book4 = new Book.withSummary(
          "A próposito de nada",
          "Woody Allen",
          "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
          description,
          shopItems,
          chapters: chapters
      );

      books.add(book1);
      books.add(book2);
      books.add(book3);
      books.add(book4);

      lectures.add(book1.toLecture());
      lectures.add(book2.toLecture());
      lectures.add(book3.toLecture());
      lectures.add(book4.toLecture());

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
      /*Map<String, List<Book>> userLists =
      {'Reading': books, 'Pending': books, 'Read': books, 'Recommended': books, 'Custom List 1': books};*/

      Map<String, List<Lecture>> userLectures =
      {'Reading': lectures, 'Pending': lectures, 'Read': lectures, 'Recommended': lectures, 'Custom List 1': lectures};

      this.user = new User(
          "1",
          "Bill Gates",
          this.genres,
          userLectures,
          21,
          198,
          345,
          "https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4"
      );
      //this.user.lectures = userLectures;

      List<User> users = new List();
      User user222 = new User(
          "1",
          "Steve Jobs",
          genres,
          userLectures,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user1 = new User(
          "1",
          "Steve Jobs 1",
          genres,
          userLectures,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user2 = new User(
          "1",
          "Steve Jobs 2",
          genres,
          userLectures,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user3 = new User(
          "1",
          "Steve Jobs 3",
          genres,
          userLectures,
          21,
          198,
          345,
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"
      );

      User user4 = new User(
          "1",
          "Steve Jobs 33",
          genres,
          userLectures,
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

      this.user.friends = users;
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