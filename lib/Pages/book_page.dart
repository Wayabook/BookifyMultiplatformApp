import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BookPage extends StatelessWidget {
  final String title;
  final List<Book> books;

  const BookPage(this.title, this.books) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Scaffold(
      body: Container(
        child:  _createListView(),
      ),
      appBar: AppBar(title: text),
    );
  }

  _createListView(){
    return Container(
      height: 300,
      width: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: _getListElement(index),
              /*child: ListTile(
                leading: FlutterLogo(size: 40.0),
                title: Text(this.books[index]),
                subtitle: Text('subtitle'),
                trailing: Icon(Icons.favorite),
                isThreeLine: true,
              ),*/
            );
          },
      ),
    );
  }

  _getListElement(index){
    return Stack(
        //alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Align(
              alignment: Alignment.center,
              child: Image.network(books[index].picture),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 12, 0),
              child: _getButton(),
            ),
          )

          /*Padding(
            //padding: EdgeInsets.fromLTRB(left, top, right, bottom)
            padding: EdgeInsets.fromLTRB(0, 6, 12, 0),
            //padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: _getButton(),
            ),
          ),*/
        ]
    );
  }

  _getButton(){
    return FloatingActionButton(
      onPressed: () => {},
      tooltip: 'Increment',
      backgroundColor: Colors.white,
      child: Icon(Icons.add, color: Colors.black),
    );
    //return FlatButton.icon(onPressed: null, icon: null, label: null);
    //return RaisedButton.icon(onPressed: null, icon: Icon(Icons.add), label: null);
  }
}

