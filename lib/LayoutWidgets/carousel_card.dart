import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/card_swiper.dart';


class CarouselCard extends StatelessWidget {

  CarouselCard({Key key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   List<Book> books =  List();
   Book book1 = new Book("En los Zapatos de Valeria", "Elisabeth Benavent", "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg");
   Book book2 = new Book("En busca del chico irrompible", "Coque Mesa", "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg");
   Book book3 = new Book("Con el amor bastaba", "Maxim Huerta", "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg");

   books.add(book1);
   books.add(book2);
   books.add(book3);

   return Center(
     child: Card(
       color: Colors.blueGrey,
       child: InkWell(
         splashColor: Colors.blue.withAlpha(30),
         onTap: () {
           print('Card tapped.');
         },
         child: Padding(
           padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
           child: Card(
             color: Colors.white,
             child:  CardSwiper(books),
           ),
         )
       ),
     ),
   );
 }
}

