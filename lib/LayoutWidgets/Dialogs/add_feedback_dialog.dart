import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/reaction_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Pages/comment_page.dart';
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

class AddFeedbackDialog extends StatefulWidget{

  Lecture book;
  AddFeedbackDialog(this.book);

  @override
  _AddFeedbackDialog createState() => _AddFeedbackDialog();
}

class _AddFeedbackDialog extends State<AddFeedbackDialog>{

  //Lecture book;
  //AddFeedbackDialog(this.book);

  Dialog alertDialog;
  bool _firstTime = true;
  //BuildContext context;
  double width;
  double height;
  List<Widget> mainComments = [];
  int listSize;

  final TextEditingController inputController = TextEditingController();

  @override
  void initState(){

    super.initState();

    //var aux = _getTitleSection("¿Como estuvo?");
    //widgets.add(_getTitleSection("¿Como estuvo?"));

    /*widgets.add(_getRatingBar());

    widgets.add(_getTitleSection("¿Como te sentiste?"));

    widgets.add(_getReactionsGrid());

    widgets.add(_getCommentsTitle());*/

    mainComments.add(MainCommentCard(fromDialog: true));

    mainComments.add(MainCommentCard(fromDialog: true));

    mainComments.add(MainCommentCard(fromDialog: true));

    mainComments.add(MainCommentCard(fromDialog: true));

    listSize = mainComments.length + 5;


    /*MainCommentCard(fromDialog: true),
    MainCommentCard(fromDialog: true),
    MainCommentCard(fromDialog: true),
    MainCommentCard(fromDialog: true),*/
  }

  _getReactionsGrid(){
    return Container(
        height: 190,
        width: double.infinity,
        //color: Colors.black,
        child: GridView.count(
            padding:EdgeInsets.fromLTRB(0, 10, 0, 10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 4,
            childAspectRatio: ((width - 20) / 4) / (110),
            children: List.generate(widget.book.reactions().length, (index) {
              return ReactionCard(widget.book.reactions()[index]);
            },)
        )
    );
  }

  _getCommentsTitle(){
    return Padding(
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

          _getTitleSection("12 comentarios"),

          /*Align(
            alignment: Alignment.center,
            child: Text(
              "12 comentarios",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  _getRatingBar(){
    return Card(
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
    );
  }

  _getTitleSection(String title){
   return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*List<Book> books = new List();
    books.add(widget.book);
    books.add(widget.book);*/

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
                    widget.book,
                    showInfo: false,
                    height: 180,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(7, 210, 7, 10),
                  child: Container(color: Colors.blueGrey, height: 2, width: width),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(7, 220, 7, 0),
                  child:  ListView.builder(
                      //controller: scrollController,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: listSize,
                      itemBuilder: (BuildContext context, int index) {
                        //return addFeedbackSections[index];
                        if(index == 0){
                          return _getTitleSection("¿Como estuvo?");
                        } else if (index == 1) {
                          return _getRatingBar();
                        } else if (index == 2) {
                          return _getTitleSection("¿Como te sentiste?");
                        } else if (index == 3) {
                          return _getReactionsGrid();
                        } else if (index == 4) {
                          return _getCommentsTitle();
                        } else {
                          return mainComments[index - 5];
                        }

                      }
                  ),


                  /*child: ListView(
                      children: <Widget>[
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
                        ),

                        MainCommentCard(fromDialog: true),
                        MainCommentCard(fromDialog: true),
                        MainCommentCard(fromDialog: true),
                        MainCommentCard(fromDialog: true),

                        /*GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => CommentPage()));
                          },
                          child: MainCommentCard(),
                        )*/
                      ],
                  ),*/
                ),

                Positioned(
                  bottom: 5,
                  right: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        onPressed: (){
                         _navigateToCommentsPage(context);
                        },
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.add,
                          color: Colors.blueGrey,),
                      ),
                    ),
                  )
                ),
              ],
            ),
        )
    );

    return alertDialog;
  }

  _navigateToCommentsPage(BuildContext context) async {
    final String result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CommentPage(
      subCommentsPage: false,
      bookTitleAndChapter: "Publicar sobre Titulo Libro | Cap 01",
    )));

    print(result);
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