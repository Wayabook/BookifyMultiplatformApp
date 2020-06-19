import 'package:bookifyapp/Enums/list_type.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/profile_info.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/LayoutWidgets/info_row.dart';
import 'package:bookifyapp/Enums/row_type.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_genres_list.dart';
import 'dart:math';


class ProfilePage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Book> books =  List();
  List<Genre> genres = List();

  ProfilePage(this.color, this.text);
  double width_per_child;
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    //double horizontal_margin = (width - (3 * 105)) / 2;
    width_per_child = (width - 30 - (10 * 2)) / 3;

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

    return Scaffold(
      body: _getBody(),
      appBar: AppBar(
        title: Text(this.text),
      ),
    );
  }

  _getBody(){
    var rnd = new Random();
    int r = 0 + rnd.nextInt(this.books.length - 1 - 0);


    return ListView(
      children: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: ArcBannerImage(this.books[r].picture),
            ),
            Positioned(
              bottom: 0.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileInfo(),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              InfoRow.withIcon(RowType.icon_image,  "BOOKS READ", Icons.book,  "18", width_per_child, 105),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              InfoRow.withIcon(RowType.icon_image,  "CHAPTERS READ", Icons.collections_bookmark,  "51", width_per_child, 105),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              InfoRow.withIcon(RowType.icon_image,  "PAGES READ", Icons.description,  "1001", width_per_child, 105),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
          child:  Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Genres of Interest:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        HorizontalGenresList(this.genres, ListType.add_genre),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
          child:  Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Bookshelf:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        HorizontalBookList(books, ListType.view_all)
      ],
    );
  }

}

// See multiple profiles
/*class CustomAvatars extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                ), // P// Provide your custom image
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                ), // Provide your custom image
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

