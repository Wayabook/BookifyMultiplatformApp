import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/card_swiper.dart';


class CarouselCard extends StatelessWidget {

  List<Book> books;
  CarouselCard(this.books);

 @override
 Widget build(BuildContext context) {

   return Container(
     height: 300,
     child: Center(
         child: Card(
           color: kPrimaryDarkColor,
           child: InkWell(
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                 child: CardSwiper(this.books),
               )
           ),
         ),
       ),
   );
 }
}

