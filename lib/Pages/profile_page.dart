import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/horizontal_book_list.dart';
import 'package:bookifyapp/Models/Book.dart';


class ProfilePage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<String> litems = ["1","2","Third","4"];
  List<Book> books;

  ProfilePage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    books =  List();
    Book book1 = new Book("En los Zapatos de Valeria", "Elisabeth Benavent", "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg");
    Book book2 = new Book("En busca del chico irrompible", "Coque Mesa", "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg");
    Book book3 = new Book("Con el amor bastaba", "Maxim Huerta", "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg");

    books.add(book1);
    books.add(book2);
    books.add(book3);

    books.add(book1);
    books.add(book2);
    books.add(book3);


    return Scaffold(
      body: Container(
        color: color,
        child: Container(
          child: ListView.builder(
              itemBuilder: (context, index) => _makeCard(context, index),
              itemCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true),
        ),
      ),
      appBar: AppBar(
        title: Text(this.text),
      ),
    );
  }

  HorizontalBookList _makeCard(BuildContext context, int index) {
    String item = litems[index];
    return HorizontalBookList(books);
  }
}