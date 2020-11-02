import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/Shop.dart' as prefix0;
import 'package:flutter/material.dart';
import 'book_page.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:bookifyapp/Models/Item.dart';



class DiscoverPage extends StatelessWidget {

  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<String> sectionsTitles = ["Latest Additions","Top Rated","More of  Novel Genre","More of Romance Genre"];
  List<Book> books =  List();
  List<Lecture> lectures;

  DiscoverPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {

    lectures = new List();
    List<Item> items = new List();
    List<Genre> genres = new List();

    List<Chapter> chapters = new List();
    chapters.add(new Chapter(1, "Capitulo 1 :  Inicio", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(2, "Capitulo 2 :  Post Inicio", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(3, "Capitulo 3 :  Pre Final", comments: MainComment.getMockMainComments()));
    chapters.add(new Chapter(4, "Capitulo 4 :  Final", comments: MainComment.getMockMainComments()));

    Shop shop1 = new Shop.withoutIds("Casa del Libro", "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg");
    Shop shop2 = new Shop.withoutIds("Fnac", "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg");
    Shop shop3 = new Shop.withoutIds("El corte ingles", "https://pbs.twimg.com/profile_images/1214523397239115781/wuA5BVB4_400x400.jpg");
    Shop shop4 = new Shop.withoutIds("Taugus Books", "https://imagessl.casadellibro.com/t19/i/logo.png");
    Shop shop5 = new Shop.withoutIds("Me gusta leer", "https://tienda.megustaleer.com/img/tienda-megustaleer-logo-1585260247.jpg");

    items.add(new Item.withoutId(shop1, "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€", "1", "2",));
    items.add(new Item.withoutId(shop2, "https://www.fnac.es/a7456973/En-busca-del-chico-irrompible#st=el+chico+irr&ct=En+todo+Fnac&t=p", 16.05, "€", "1", "2"));
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

    Book book1 = new Book.withSummary(
        "En los Zapatos de Valeria",
        "Elisabeth Benavent",
        "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg",
        description,
        shopItems,
        chapters : chapters
    );

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

    Map<String, List<Lecture>> userLectures =
    {'Reading': lectures, 'Pending': lectures, 'Read': lectures, 'Recommended': lectures, 'Custom List 1': lectures};


    book1.friends_reading =  User.getMockAlterantiveUsers();
    book2.friends_reading =  User.getMockAlterantiveUsers().sublist(0, 2);
    book3.friends_reading =  User.getMockAlterantiveUsers().sublist(0, 1);

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    return Scaffold(
      body: Container(
        color: kPrimaryDarkColor,
        child: ListView.builder(
          itemBuilder: (context, index) => _buildSection(context, index),
          itemCount: sectionsTitles.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true
        ),
      ),

      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: Text("Search book..."),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: Icon(Icons.search)
          )
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, int index) {
    String sectionTitle = sectionsTitles[index];
    if (index == 0) {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5, 2, 2, 2),
            child:  Align(
              alignment: Alignment.topLeft,
              child: ListTitle(sectionTitle),
              /*child: Text(
                sectionTitle,
                style: optionStyle,
              ),*/
            ),
          ),

          CarouselCard(this.books),
        ],
      );

    } else {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5, 2, 2, 2),
            child:  Align(
              alignment: Alignment.topLeft,
              child: ListTitle(sectionTitle),
              /*child: Text(
                sectionTitle,
                style: optionStyle,
              ),*/
            ),
          ),
          /*Container(
            margin: EdgeInsets.fromLTRB(5, 2, 2, 2),
            child:  Align(
              alignment: Alignment.topLeft,
              child: Text(
                sectionTitle,
                style: optionStyle,
              ),
            ),
          ),*/

          HorizontalBookList(Book.toLectureList(Book.getAppMockBooks()), ListType.discover_option),
        ],
      );
    }
  }
}
