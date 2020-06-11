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
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            elevation: 10,
            child: _getListElement(index),
          );
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
                      .push(MaterialPageRoute(builder: (context) => BookPage("title", books[index])));
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



  /*_getTopFloatingActionButton(){
    return FloatingActionButton(
      onPressed: () => {

      },
      tooltip: 'Increment',
      backgroundColor: Colors.white,
      child: Icon(Icons.add, color: Colors.black),
    );
  }*/

  /*_getAddButton(){
    return SizedBox(
      width: 25,
      height: 25,
      child: IconButton(
        icon:Icon(
        Icons.comment,
        color: Colors.white
        ),
      )
    );
  }*/

  /*_getAddButton(){
    return ClipOval(
      child: Material(
        color: Colors.blue, // button color
        child: InkWell(
          splashColor: Colors.red, // inkwell color
          child: SizedBox(width: 56, height: 56, child: Icon(Icons.menu)),
          onTap: () {},
        ),
      ),
    );
  }*/
}

