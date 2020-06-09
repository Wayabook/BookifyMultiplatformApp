import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bookifyapp/Pages/book_page.dart';

class CardSwiper extends StatelessWidget {
  final List<Book> books;

  const CardSwiper(this.books);

  @override
  Widget build(BuildContext context) {
    //this.context = context;
    return new Scaffold(
        backgroundColor: Colors.blueGrey,
        body: new Swiper(
          //containerHeight: 25.0,
          itemBuilder: (BuildContext context, int index) {
            return _getSwiperCardContent(index, context);
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: false,
          itemCount: books.length,
          pagination: null,
          control: null,
          viewportFraction: 0.6,
          scale: 0.9,
        ));
  }

  _getSwiperCardContent(int index, BuildContext context){
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        elevation: 10,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: _goToBookPage(context),
                    child: Image.network(
                      this.books[index].picture,
                    ),
                  )
              ),
              flex: 6,
            ),

            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    this.books[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),


            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  this.books[index].author,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              flex: 1,
            )
          ],
        ),

    );
  }

  _goToBookPage(BuildContext context){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BookPage("title", this.books)));
  }
}