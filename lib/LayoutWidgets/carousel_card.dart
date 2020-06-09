import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/card_swiper.dart';


class CarouselCard extends StatelessWidget {

  //CarouselCard({Key key}) : super(key: key);
  List<Book> books;
  CarouselCard(this.books);

 @override
 Widget build(BuildContext context) {

   return Container(
     height: 300,
     child: Center(
         child: Card(

           color: Colors.blueGrey,
           child: InkWell(
               splashColor: Colors.blue.withAlpha(30),
               onTap: () {
                 print('Card tapped.');
               },
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                 child: Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(7.0),
                   ),
                   elevation: 10,
                   color: Colors.white,
                   child:  CardSwiper(this.books),
                 ),
               )
           ),
         ),
       ),
   );
 }
}

