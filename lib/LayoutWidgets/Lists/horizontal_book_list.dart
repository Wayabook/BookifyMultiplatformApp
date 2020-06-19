import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';

class HorizontalBookList extends StatelessWidget {

  List<Book> books;
  BuildContext context;
  ListType type;

  HorizontalBookList(this.books, this.type);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        color: Colors.blueGrey,
        child: _createListView(),
      ),
    );
  }


  _createListView(){
    var length = books.length;
    if(this.type == ListType.discover_option || this.type == ListType.view_all){
      length++;
    }

    return Container(
      height: 200,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          if(this.type == ListType.discover_option || this.type == ListType.view_all)
          {
            if(index < books.length){
              if (this.type == ListType.discover_option) {
                return BookCard(this.books[index], BookCardType.add_option);
              } else {
                return BookCard(this.books[index], BookCardType.without_add_option);
              }
            } else {
              if (this.type == ListType.discover_option) {
                return BookCard.option(BookCardType.disover);
              } else {
                return BookCard.option(BookCardType.view_all);
                //return BookCard(this.books[index], BookCardType.without_add_option);
              }
              /*return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  elevation: 10,
                  child: Container(
                      width: 120,
                      //height: double.infinity,
                      color: Colors.white,
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                this.type == ListType.discover_option ?
                                Icons.add : Icons.remove_red_eye,
                                color: Colors.blueGrey,
                                size: 50,
                              ),

                              Text(
                                this.type == ListType.discover_option ?
                                "Discover Books" : "View All",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                      )
                  ),
                ),
              );*/
            }
          } else {
            return BookCard(this.books[index], BookCardType.add_option);
          }
        },
      ),
    );
  }



  _getListElement(index){
    if(this.type != ListType.view_all){
      return Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => BookPage("title", books[index], this.books)));
                  },
                  child: Image.network(books[index].picture),
                ),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: AddButtonSmall(),
            )
          ]
      );
    } else {
      return Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => BookPage("title", books[index], this.books)));
                  },
                  child: Image.network(books[index].picture),
                ),
              ),
            ),

            /*Positioned(
              top: 0,
              right: 0,
              child: AddButtonSmall(),
            )*/
          ]
      );
    }
  }
}

