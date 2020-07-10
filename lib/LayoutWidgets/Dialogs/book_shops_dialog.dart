import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';


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

              Padding(
                padding: EdgeInsets.fromLTRB(15, 220, 0, 0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: width,
                            //color: Colors.black,
                            child: Text(
                              'Ficha Tecnica:',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Enucadernación:',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'TAPA DURA',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Editorial:',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'SUMA',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'EAN:',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '978-8483655368',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'IBAN:',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '9788483655368',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Idioma:',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'CASTELLANO',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
                      child: Container(color: Colors.blueGrey, height: 2, width: width),
                    ),

                    ShopItemCard(this.book),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Container(color: Colors.white, height: 2, width: width),
                    ),

                    ShopItemCard(this.book),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Container(color: Colors.white, height: 2, width: width),
                    ),

                    ShopItemCard(this.book),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Container(color: Colors.white, height: 2, width: width),
                    ),
                  ],
                ),
              )

              /*Positioned(
                top: 185,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: width,
                          color: Colors.black,
                          /*child: Text(
                            'Ficha Tecnica:',

                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),*/
                        )

                        /*Row(
                          children: <Widget>[
                            Text(
                              'Editorial:',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'SUMA',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Text(
                              'EAN:',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '978-8483655368',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Text(
                              'IBAN:',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '9788483655368',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Text(
                              'IDIOMA:',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'CASTELLANO',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )*/
                      ],
                    )
                  ],
                ),
              )*/

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