import 'package:flutter/material.dart';
import 'book_page.dart';
import 'package:bookifyapp/Models/Book.dart';

class DiscoverPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  DiscoverPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {

    List<Book> books =  List();
    Book book1 = new Book("En los Zapatos de Valeria", "Elisabeth Benavent", "https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg");
    Book book2 = new Book("En busca del chico irrompible", "Coque Mesa", "https://imagessl9.casadellibro.com/a/l/t5/59/9788408228059.jpg");
    Book book3 = new Book("Con el amor bastaba", "Maxim Huerta", "https://imagessl2.casadellibro.com/a/l/t5/92/9788408221692.jpg");

    books.add(book1);
    books.add(book2);
    books.add(book3);

    return Scaffold(
      body: Container(
        color: color,
        child:  new Column(
            children: <Widget>[
              Text(
                this.text,
                style: optionStyle,
              ),

              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    //Navigator.push(context, BookPage("title"));
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => BookPage("title", books)));
                  },
                ),



              ),


            ]),

      ),
      appBar: AppBar(
        title: Text(this.text),
      ),
    );
  }

  /*_getSwiper(){
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        /*return new Image.asset(
          images[index],
          fit: BoxFit.fill,
        );*7

         */
        return  new Container(
          color: Colors.white12,
        );
      },

      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      itemCount: 4,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }*/

  //Use the navigator like you usually do with .of(context) method
  /*_openBooksPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => BookPage("title")));*/

  // Exemple: https://github.com/ayham95/Custom-navigator/tree/master/custom_scaffold_example
}
