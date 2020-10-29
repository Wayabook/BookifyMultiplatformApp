import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';


class BookCard extends StatelessWidget {

  //List<Book> books;
  BuildContext context;
  BookCardType type;
  Lecture book;
  User user;

  BookCard(this.book, this.type);
  BookCard.option(this.type, {this.user});

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
                child: AddButtonSmall(this.book),
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
                    percent: !this.book.finished ? this.book.progress : 1.0,
                    progressColor: !this.book.finished ? Colors.lightGreen : Colors.deepPurple,
                  ),
                ),
              )
            ]
        ),
      );

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
                    percent: !this.book.finished ? this.book.progress : 1.0,
                    progressColor: !this.book.finished ? Colors.lightGreen : Colors.deepPurple,
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
        onTap: () async {
          if(this.type == BookCardType.disover){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (this.type == BookCardType.view_all){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookshelfPage(this.user)),
            );
          } else if (this.type == BookCardType.add_custom_list){
            var result = await showDialog(
              context: context,
              builder: (BuildContext context) => DialogWithInputText(
                  'Add List Title:',
                  'Add a custom list of books from your Bookshelf, and share it with your friends.\n\n',
                  'List Title'
              ),
            );
            if(result != DialogWithInputText.CANCEL_TAP){
              await _pushAddCustomListPage(result);
            }
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
              color: kPrimaryLightColor,
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        icon,
                        color: kPrimaryDarkColor,
                        size: 50,
                      ),

                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kPrimaryDarkColor,
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

  _pushAddCustomListPage(String listTitle) async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddCustomListPage(this.user.bookshelf, listTitle, ListType.add_custom_list)));
    if(result == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookshelfPage(Provider.of<User>(context, listen: false), scrollToLastPosition: true,)),
      );
      //Navigator.pop(context);
    }
  }

  List<Book> _getBooks(){
    List<Book> books = new List();
    Shop shop1 = new Shop.withoutIds("Casa del Libro", "https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg");
    Shop shop2 = new Shop.withoutIds("Fnac", "https://upload.wikimedia.org/wikipedia/commons/2/2e/Fnac_Logo.svg");
    Shop shop3 = new Shop.withoutIds("El corte ingles", "https://pbs.twimg.com/profile_images/1214523397239115781/wuA5BVB4_400x400.jpg");
    Shop shop4 = new Shop.withoutIds("Taugus Books", "https://imagessl.casadellibro.com/t19/i/logo.png");
    Shop shop5 = new Shop.withoutIds("Me gusta leer", "https://tienda.megustaleer.com/img/tienda-megustaleer-logo-1585260247.jpg");

    List<Item> items = new List();
    items.add(new Item.withoutId(shop1, "https://www.casadellibro.com/libro-en-busca-del-chico-irrompible/9788408228059/11405104", 16.05, "€", "1", "2"));
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
        shopItems);

    Book book2 = new Book.withSummary(
        "En busca del chico irrompible",
        "Coque Mesa",
        "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg",
        description,
        shopItems);

    Book book3 = new Book.withSummary(
        "Con el amor bastaba",
        "Maxim Huerta",
        "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg",
        description,
        shopItems);

    Book book4 = new Book.withSummary(
        "A próposito de nada",
        "Woody Allen",
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg",
        description,
        shopItems);

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);
    return books;
  }
}

