import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/search_book_or_person.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';

class SearchPage extends StatelessWidget {

  SearchPage();




  @override
  Widget build(BuildContext context) {
    List<Book> books =  List();
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

    books.add(book1);
    books.add(book2);
    books.add(book3);
    books.add(book4);

    List<User> users = new List<User>();
    User user = new User.withNameAndProfilePicture("Steve Jobs", "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg");
    User user1 = new User.withNameAndProfilePicture("Steve Jobs 1", "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg");
    User user2 = new User.withNameAndProfilePicture("Steve Jobs 2", "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg");
    User user3 = new User.withNameAndProfilePicture("Steve Jobs 3", "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg");
    User user4 = new User.withNameAndProfilePicture("Steve Jobs 4", "https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg");
    users.add(user);
    users.add(user1);
    users.add(user2);
    users.add(user3);
    users.add(user4);


    return SearchBookOrPerson(books, users);
  }
}