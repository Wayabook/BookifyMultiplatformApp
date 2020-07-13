import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class AddFeedbackDialog extends StatelessWidget{

  Book book;
  AddFeedbackDialog(this.book);

  Dialog alertDialog;
  bool _firstTime = true;
  BuildContext context;
  double width;
  double height;

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Book> books = new List();
    books.add(book);
    books.add(book);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    alertDialog = new Dialog(
      //title: const Text('Add List Title:'),
        backgroundColor: Colors.transparent,
        child: Container(
            height: height,
            width: width,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 140,
                    child: Container(
                        width: width,
                        height: height-140,
                        color: Colors.white,
                        child:  Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black
                            ),
                          ),
                        )
                    )
                ),

                Center(
                  child: BookCover(
                    book,
                    showInfo: false,
                    height: 180,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(15, 210, 15, 10),
                  child: Container(color: Colors.blueGrey, height: 2, width: width),
                ),
              ],
            ),
        )
    );

    return alertDialog;
  }
}