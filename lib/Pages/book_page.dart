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
        child: _getListElement(),
      ),
      appBar: AppBar(title: text),
    );
  }

  _getListElement(){
    return Stack(
        alignment: Alignment.topRight,
        children: <Widget>[

          Image.network("https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg"),

          Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(

                  onPressed: () {
                    null;
                  },
                  child: new Text("Call me")
              )
          ),
        ]
    );
  }

  _getButton(){
    //return FlatButton.icon(onPressed: null, icon: null, label: null);
    return RaisedButton.icon(onPressed: null, icon: Icon(Icons.add), label: null);
  }
}

