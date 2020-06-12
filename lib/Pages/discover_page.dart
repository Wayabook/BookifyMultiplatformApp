import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:flutter/material.dart';
import 'book_page.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';

class DiscoverPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<String> sectionsTitles = ["Latest Additions","Top Rated","More of  Novel Genre","More of Romance Genre"];
  List<Book> books =  List();

  DiscoverPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {


    Book book1 = new Book("En los Zapatos de Valeria", "Elisabeth Benavent", "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg");
    Book book2 = new Book("En busca del chico irrompible", "Coque Mesa", "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg");
    Book book3 = new Book("Con el amor bastaba", "Maxim Huerta", "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg");
    Book book4 = new Book("A próposito de nada", "Woody Allen", "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg");

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
        color: color,
        child: ListView.builder(
          itemBuilder: (context, index) => _buildSection(context, index),
          itemCount: sectionsTitles.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true
        ),
      ),

      appBar: AppBar(
        title: Text(this.text),
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
              child: Text(
                sectionTitle,
                style: optionStyle,
              ),
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
              child: Text(
                sectionTitle,
                style: optionStyle,
              ),
            ),
          ),

          HorizontalBookList(books),
        ],
      );
    }
  }



  //Use the navigator like you usually do with .of(context) method
  /*_openBooksPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => BookPage("title")));*/

  // Exemple: https://github.com/ayham95/Custom-navigator/tree/master/custom_scaffold_example
}
