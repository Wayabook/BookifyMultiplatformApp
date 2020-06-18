import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';

class HorizontalBookList extends StatelessWidget {

  List<Book> books;
  BuildContext context;

  HorizontalBookList(this.books);

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
    return Container(
      height: 200,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if(index < books.length){
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              elevation: 10,
              child: _getListElement(index),
            );
          } else {
            return Card(
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
                        //buttonType == ButtonType.read ?
                        //Icons.beenhere : Icons.arrow_drop_up,
                        Icons.add,
                        color: Colors.blueGrey,
                        size: 50,
                      ),

                      Text("Discover Books",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                )

                /*
                * SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child:  Icon(
                              //buttonType == ButtonType.read ?
                              //Icons.beenhere : Icons.arrow_drop_up,
                              Icons.add,
                              color: Colors.blueGrey,
                              size: 50,
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child:  Text("Discover Books",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )



                        ],
                      ),
                    ),
                  )*/


                /*Text("Discover Books",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),*/
              ),
            );
          }

        },
      ),
    );
  }



  _getListElement(index){
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
  }
}

