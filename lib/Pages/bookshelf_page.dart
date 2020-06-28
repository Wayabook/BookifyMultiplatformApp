import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/Models/User.dart';


class BookshelfPage extends StatelessWidget {

  /*User user;*/
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Book> books =  List();
  BuildContext context;

  BookshelfPage();

  @override
  Widget build(BuildContext context) {
    this.context = context;
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
        description,
        "1");

    Book book2 = new Book.withSummary(
        "En busca del chico irrompible",
        "Coque Mesa",
        "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
        description,
        "2");

    Book book3 = new Book.withSummary(
        "Con el amor bastaba",
        "Maxim Huerta",
        "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
        description,
        "3");

    Book book4 = new Book.withSummary(
        "A próposito de nada",
        "Woody Allen",
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
        description,
        "4");

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    Map<String, List<Book>> userLists =
      {'Reading': books, 'Pending': books, 'Read': books, 'Recommended': books, 'Custom List 1': books};

    User user = new User.withBookLists(userLists);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CustomScrollView(
        slivers: _createBookshelf(user.bookLists),/*<Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _makeHeader("Reading", width)
              ],
            ),
          ),

          SliverGrid(
            //padding:EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4)
            ),/*SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 2.0,

            ),*/
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return BookCard(this.books[index], BookCardType.book_card_in_grid);
                    //return Container(color: Colors.black, padding: EdgeInsets.all(5), margin: EdgeInsets.all(10),);
              },
              childCount: this.books.length,

            ),

          )

        ],*/
      ),
      appBar: AppBar(
        title: Text("Bookshelf"),
        /*actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: Icon(Icons.search)
          )
        ],*/
      ),
    );
  }

  _createBookshelf(Map<String, List<Book>> userLists){

    double width = MediaQuery.of(context).size.width;
    List<Widget> bookshelf = new List<Widget>();

    for(String key in userLists.keys){
      List<Book> bookList = userLists[key];
      bookshelf.add(
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                _makeHeader(key, width)
              ],
            ),
          )
      );

      bookshelf.add(
          new SliverGrid(
            //padding:EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4)
            ),

            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return BookCard(bookList[index], BookCardType.book_card_in_grid);
                //return Container(color: Colors.black, padding: EdgeInsets.all(5), margin: EdgeInsets.all(10),);
              },
              childCount: bookList.length,

            ),

          )
      );
    }
    /*for(int i=0; i < userLists.length; i++){
      var title = userLists.keys[i];
    }*/

    /*userLists.forEach((listName, listBooks) => {
      bookshelf.add(
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                _makeHeader(listName, width)
              ],
            ),
          )
      );

    });*/

        /*SliverGrid(
          //padding:EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4)
          ),/*SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 2.0,

            ),*/
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return BookCard(this.books[index], BookCardType.book_card_in_grid);
              //return Container(color: Colors.black, padding: EdgeInsets.all(5), margin: EdgeInsets.all(10),);
            },
            childCount: this.books.length,

          ),

        )*/
    return bookshelf;
  }

  _makeHeader(String title, width) {
    return ListTitle(title);
    /*return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Container(color: Colors.white, height: 2, width: width),
          ),
        ],
      ),
    );*/
  }

/*_getBody(){
    return Column(
      children: <Widget>[
        VerticalBookList("Reading", this.books),

        //VerticalBookList("Pending", this.books),

      ],
    );
  }*/
}