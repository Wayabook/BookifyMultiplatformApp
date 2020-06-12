import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/book_cover.dart';

class BookPage extends StatelessWidget {
  final String title;
  final Book book;

  const BookPage(this.title, this.book) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Scaffold(
      body: Container(
        //child:  _createListView(),
        child: _buildBookPage(context),
      ),
      appBar: AppBar(title: text),
    );
  }

  _buildBookPage(BuildContext context){

    double width = MediaQuery.of(context).size.width;
    //double horizontal_margin = (width - (3 * 105)) / 2;
    double width_per_child = (width - 30 - (10 * 2)) / 3;


    return ListView(
      children: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140.0),
              child: ArcBannerImage(this.book.picture),
            ),
            Positioned(
              bottom: 30.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BookCover(
                    book,
                    height: 180.0,
                  ),
                  //SizedBox(width: 16.0),
                  //Expanded(child: movieInformation),
                ],
              ),
            ),
          ],
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                      )
                  ),
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white
                    ),
                  ),
                  //Icon(Icons.add_circle_outline),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon: Icon(
                      Icons.shop_two,
                      color: Colors.white
                    ),

                  ),
                  //Icon(Icons.add_circle_outline),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        )
                  ),
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon:Icon(
                        Icons.comment,
                        color: Colors.white
                    ),

                  ),
                  //Icon(Icons.add_circle_outline),
                ),
              ),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),


        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Center(
                  child: Container(
                    height: 105,
                    width: width_per_child,
                    child: Column(
                      children: <Widget>[

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              child: Text(
                                "GENDER",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'images/genre1.png',
                            height: 50,
                            width: 50,
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              child: Text(
                                "Poetry",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Center(
                  child: Container(
                    height: 105,
                    width: width_per_child,
                    child: Column(
                      children: <Widget>[

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              child: Text(
                                "GENDER",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'images/genre1.png',
                            height: 50,
                            width: 50,
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              child: Text(
                                "Poetry",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Center(
                  child: Container(
                    height: 105,
                    width: width_per_child,
                    child: Column(
                      children: <Widget>[

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              child: Text(
                                "GENDER",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'images/genre1.png',
                            height: 50,
                            width: 50,
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              child: Text(
                                "Poetry",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

      ],
    );
  }


}

