import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Pages/search_page.dart';
//import 'package:bookifyapp/Pages/search_page.dart';


class BookCard extends StatelessWidget {

  //List<Book> books;
  BuildContext context;
  BookCardType type;
  Book book;

  BookCard(this.book, this.type);
  BookCard.option(this.type);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return _getCard();
  }

  _getCard(){
    if(this.type == BookCardType.add_option){
      return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        elevation: 10,
        child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => BookPage("title", this.book, _getBooks())));
                    },
                    child: Image.network(this.book.picture),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: AddButtonSmall(),
              )
            ]
        ),
      );
    } else if (this.type == BookCardType.without_add_option) {
      return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        elevation: 10,
        child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => BookPage("title", this.book, _getBooks())));
                    },
                    child: Image.network(this.book.picture),
                  ),
                ),
              ),

              /*Positioned(
              top: 0,
              right: 0,
              child: AddButtonSmall(),
            )*/
            ]
        ),
      );
    } else {
      String text = "";
      IconData icon;
      if(this.type == BookCardType.disover){
        icon = Icons.add;
        text = "Discover Books";
      } else if (this.type == BookCardType.view_all) {
        icon = Icons.remove_red_eye;
        text = "View All";
      } else {
        icon =  Icons.add;
        text = "Add Custom List";
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          );
        },
        child: Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          elevation: 10,
          child: Container(
              width: 120,
              //height: double.infinity,
              color: Colors.white,
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        icon,
                        color: Colors.blueGrey,
                        size: 50,
                      ),

                      Text(
                        text,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
              )
          ),
        ),
      );

    }
  }

  List<Book> _getBooks(){
    List<Book> books = new List();
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
    return books;
  }
}

