import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class BookShopsDialog extends StatelessWidget{

  Book book;
  BookShopsDialog(this.book);

  AlertDialog alertDialog;
  bool _firstTime = true;
  BuildContext context;
  double width;
  double height;

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Book> books = new List();
    books.add(book);
    books.add(book);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    alertDialog = new AlertDialog(
      //title: const Text('Add List Title:'),
      backgroundColor: Colors.transparent,
      content: Container(
        height: 500,
        width: width,
        child: Swiper(
          //containerHeight: 25.0,
          itemBuilder: (BuildContext context, int index) {
            return _getCardContent(index);
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: false,
          itemCount: this.book.shops_items.length,
          pagination: null,
          control: null,
          viewportFraction: 0.6,
          scale: 0.9,
        )
      )
    );
    return alertDialog;
  }

  _getCardContent(int index){

    return Container(
      //color: Colors.black,
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
              book,
              showInfo: false,
              height: 180,
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 210, 15, 10),
            child: Container(color: Colors.blueGrey, height: 2, width: width),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 220, 0, 0),
            child: ListView(
              children: get_book_info(index)
            ),
          )
        ],
      ),
    );
  }

  List<Widget> get_book_data_sheet(String cover_type){
    List<Widget> bookDataSheet = [
      Container(
        height: 20,
        width: width,
        //color: Colors.black,
        child: Text(
          'Ficha Tecnica:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),

      Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: <Widget>[
              Text(
                'Enucadernación:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                cover_type,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ],
          )
      ),

      Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          children: <Widget>[
            Text(
              'Editorial:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              book.editorial,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),

      Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          children: <Widget>[
            Text(
              'EAN:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              book.ean,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),

      Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          children: <Widget>[
            Text(
              'IBAN:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              book.isbn,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),

      Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: <Widget>[
              Text(
                'Idioma:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                book.language,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ],
          )
      ),
    ];

    return bookDataSheet;
  }

  List<Widget> get_book_info(int index){
    var aux = this.book.shops_items.entries.toList();
    String cover_type = aux[index].key;
    List<Item> items  = aux[index].value;

    List<Widget> infoItems = <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Column(
            children: get_book_data_sheet(cover_type)
          )
      ),

      Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
        child: Container(color: Colors.blueGrey, height: 2, width: width),
      ),
    ];

    /*
    *  ShopItemCard(this.book),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
        child: Container(color: Colors.white, height: 2, width: width),
      ),

      ShopItemCard(this.book),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
        child: Container(color: Colors.white, height: 2, width: width),
      ),

      ShopItemCard(this.book),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
        child: Container(color: Colors.white, height: 2, width: width),
      ),*/

    return infoItems;
  }

}