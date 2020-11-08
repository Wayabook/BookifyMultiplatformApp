import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/card_swiper.dart';


class CarouselCard extends StatelessWidget {

  List<Book> books;
  CarouselCard(this.books);

 @override
 Widget build(BuildContext context) {

   return Container(
     height: (43.92 * SizeConfig.heightMultiplier),
     child: Center(
         child: Card(
           color: kPrimaryDarkColor,
           child: InkWell(
               child: Padding(
                 padding: EdgeInsets.fromLTRB(
                     (2.43 * SizeConfig.widthMultiplier), // 10
                     (2.92 * SizeConfig.heightMultiplier), // 20
                     (2.43 * SizeConfig.widthMultiplier), // 10
                     (2.92 * SizeConfig.heightMultiplier), // 20
                 ),
                 child: CardSwiper(this.books),
               )
           ),
         ),
       ),
   );
 }
}

