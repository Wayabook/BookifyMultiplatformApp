import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';


class BookShopsDialog extends StatelessWidget{

  Book book;
  BookShopsDialog(this.book);

  AlertDialog alertDialog;
  bool _firstTime = true;

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Book> books = new List();
    books.add(book);
    books.add(book);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    alertDialog = new AlertDialog(
      //title: const Text('Add List Title:'),
      backgroundColor: Colors.transparent,
      content: Container(
        height: 500,
        width: width,
        child: Container(
          //color: Colors.black,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 140,
                  child: Container(
                    width: width,
                    height: height-140,
                    color: Colors.white,
                    child:  Column(
                      children: <Widget>[
                        Align(
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
                      ],
                    ),
                  )
              ),

              Center(
                child: BookCover(
                  book,
                  showInfo: false,
                  height: 180,
                ),
              ),

              /*Positioned(
                //left: 5,
                top: 170,
                child: IconButton(
                  icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black
                  ),

                ),
              )*/



            ],
          ),
        )//CarouselCard(books),
      )
    );
    return alertDialog;
  }

}