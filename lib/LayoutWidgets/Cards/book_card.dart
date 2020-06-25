import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';


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

    /*double width = MediaQuery.of(context).size.width;
    double height =  MediaQuery.of(context).size.height;*/
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
                          .push(MaterialPageRoute(
                          builder: (context) => BookPage("title", this.book,
                              _getBooks())));
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
    } else if (this.type == BookCardType.without_add_option_and_progress_bar) {
      return Card(
        color: Colors.black,
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
                          .push(
                          MaterialPageRoute(builder: (context) => BookPage(
                              "title", this.book, _getBooks())));
                    },
                    child: Image.network(
                        this.book.picture),
                  ),
                ),
              ),

              Positioned(
                bottom: 1,
                right: 1,
                left: 1,
                child: Center(
                  child: LinearPercentIndicator(
                    //width: double.infinity,
                    lineHeight: 5.0,
                    percent: 0.5,
                    progressColor: Colors.lightGreen,
                  ),
                ),
              )
            ]
        ),
      );
      /*child:  Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: Container(
                  width: 90,
                  //padding: EdgeInsets.only(right: 12.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(width: 1.0, color: Colors.blueGrey),
                          left: new BorderSide(width: .075, color: Colors.blueGrey),
                          bottom: new BorderSide(width: .075, color: Colors.blueGrey),
                          top: new BorderSide(width: .075, color: Colors.blueGrey)
                      )
                  ),

                  child: Container(
                      color: Colors.black,
                      height: 150,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(
                            book.picture
                        ),
                      )
                  ) //Icon(Icons.autorenew, color: Colors.white),
              ),
            ),

            Flexible(
                flex: 1,
                child: Center(
                  child: LinearPercentIndicator(
                    //width: //150.0,
                    lineHeight: 5.0,
                    percent: 0.5,
                    progressColor: Colors.lightGreen,
                  ),
                )
            )
          ],
        )
      );


      * */
    } else if (this.type == BookCardType.book_card_in_grid){
      return Card(
        color: Colors.black,
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
                    child: Image.network(
                      this.book.picture, fit: BoxFit.fill, height: 200,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 1,
                right: 1,
                left: 1,
                child:  Center(
                  child: LinearPercentIndicator(
                    //width: double.infinity,
                    lineHeight: 5.0,
                    percent: 0.5,
                    progressColor: Colors.lightGreen,
                  ),
                ),
              )
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
      } else if (this.type == BookCardType.add_custom_list) {
        icon =  Icons.add;
        text = "Add Custom List";
      } else if (this.type == BookCardType.recommend_book) {
        icon = Icons.card_giftcard;
        text = "Recommend Book";
      } else if (this.type == BookCardType.settings) {
        icon = Icons.settings;
        text = "Settings";
      }

      return GestureDetector(
        onTap: () {
          if(this.type == BookCardType.disover){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (this.type == BookCardType.view_all){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookshelfPage()),
            );
          }

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

