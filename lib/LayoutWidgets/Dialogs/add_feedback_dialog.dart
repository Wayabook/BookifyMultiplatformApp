import 'package:bookifyapp/LayoutWidgets/Cards/reaction_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bordered_text/bordered_text.dart';



class AddFeedbackDialog extends StatelessWidget{

  Lecture book;
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

                Padding(
                  padding: EdgeInsets.fromLTRB(15, 220, 15, 0),
                  child: ListView(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "¿Como estuvo?",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Card(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          color: Colors.blueGrey,
                          child: Container(
                            height: 50,
                            child: Align(
                              alignment: Alignment.center,
                              child: RatingBar(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            )
                            //width: 100,
                          ),
                          //child: _createListView(),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "¿Como te sentiste?",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Container(
                          height: 190,
                          width: double.infinity,
                          //color: Colors.black,
                          child: GridView.count(
                            padding:EdgeInsets.fromLTRB(0, 10, 0, 10),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 4,
                            childAspectRatio: ((width - 20) / 4) / (110),
                            children: List.generate(this.book.reactions().length, (index) {
                              return ReactionCard(this.book.reactions()[index]);
                            },)
                          )
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.comment,
                                  //color: Colors.black,
                                  size: 25,
                                ),
                              ),

                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "12 comentarios",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                  ),
                )
              ],
            ),
        )
    );

    return alertDialog;
  }

  _getGrid(){
    return Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        child: Row(
          children: <Widget>[
            Container(
              //color: Colors.white,
                width: 50,
                height: 100,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: BorderedText(
                    strokeWidth: 1.0,
                    strokeColor: Colors.white,
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          decoration: TextDecoration.none,
                          //decorationColor: Colors.,
                          decorationThickness: 1
                      ),
                    ),
                  ),
                  /*Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            //height: double.infinity,
                          ),
                        ),*/
                  //Icon(Icons.filter_1)
                )
            ),

            Container(
                width: 110,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/genre1.png",
                          height: 50,
                          width: 50,
                        ),

                        Text("Misterious",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                )
            ),
          ],
        )
    );
  }

  /*
  *  Padding(
                  padding: EdgeInsets.fromLTRB(15, 220, 0, 0),
                  child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "¿Como estuvo?",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                  ),
                )*/
}