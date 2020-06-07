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
        child: ExampleHorizontal(books),
      ),
      appBar: AppBar(title: text),
    );
  }
}

class ExampleHorizontal extends StatelessWidget {
  final List<Book> books;

  const ExampleHorizontal(this.books);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey,
        body: new Swiper(
          containerHeight: 25.0,
          itemBuilder: (BuildContext context, int index) {
            var color = Colors.white12;

            if(index == 0)
              color = Colors.brown;

            if(index == 1)
              color = Colors.red;


            return  new ListView(
              //CrossAxisAlignment.center,
              children: <Widget>[
                /*Scaffold(
                  /*margin: new EdgeInsets.all(2.0),*/
                  body: Image.network(
                      'https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg',
                    ),
                )*/
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    this.books[index].picture,
                  )
                ),

                Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        this.books[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),

                Align(
                    alignment: Alignment.center,
                    child: Text(
                      this.books[index].author,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                ),


              /*Container(
                color: color,
                width: 20,
                height: 20,
              ),*/

              ],
            );
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: books.length,
          pagination: null,
          control: null,
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }
}