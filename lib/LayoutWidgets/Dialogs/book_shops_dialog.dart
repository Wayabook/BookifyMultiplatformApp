import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/shop_item_card.dart';
import 'package:bookifyapp/LayoutWidgets/carousel_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/badgets_page.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/Pages/discover_page.dart';
import 'package:bookifyapp/Pages/friends_page.dart';
import 'package:bookifyapp/Pages/profile_page.dart';
import 'package:bookifyapp/Pages/reading_page.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';


class BookShopsDialog<T extends TickerProviderStateMixin> extends StatefulWidget {

  Book book;
  T page;

  BookShopsDialog(this.book, this.page);

  final TextEditingController inputController = TextEditingController();

  @override
  _BookShopsDialog createState() => _BookShopsDialog();
}

class _BookShopsDialog extends State<BookShopsDialog>{

  double width;
  double height;
  Dialog alertDialog;
  bool _firstTime = true;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    List<Book> books = new List();
    books.add(widget.book);
    books.add(widget.book);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    alertDialog = new Dialog(
      //title: const Text('Add List Title:'),
      backgroundColor: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        child: //_getCardOptionBar()
        _getCardContent(0)
        /*Swiper(
          //containerHeight: 25.0,
          itemBuilder: (BuildContext context, int index) {
            return _getCardContent(index);
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: false,
          itemCount: widget.book.shops_items.length,
          pagination: null,
          control: null,
          viewportFraction: 0.85,
          scale: 0.9,
        )*/
      )
    );
    return alertDialog;
  }

  _getCardOptionBar(){
    var _controller = new TabController(length: 3, vsync: widget.page);
    final tab = new TabBar(
      tabs: <Tab>[
        new Tab(text: 'Tab 1',),
        new Tab(text: 'Tab 2',),
        new Tab(text: 'Tab 3', ),
      ],
      controller: _controller,
      labelColor: Colors.black,
      indicatorColor: Colors.blueGrey,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: tab.preferredSize,
        child: new Card(
          elevation: 10.0,
          color: Colors.white,
          child: tab,
        ),
      ),
      body: new TabBarView(
          controller: _controller,
          children: [
            _get_book_info(0),
            _get_book_info(1),
            _get_book_info(2)

          ]
      ),
    );



    return Scaffold(

      body: Column(
        children: [
          //tab,
          FriendsPage(User.getMockUser().friends),
          //FriendsPage(User.getMockUser().friends),
          //FriendsPage(User.getMockUser().friends)

        ],
      ),
    );
    /*return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.grey,
          bottom: new TabBar(
              //controller: controller,
              tabs: <Tab>[
                new Tab(icon: new Icon(Icons.arrow_forward)),
                new Tab(icon: new Icon(Icons.arrow_downward)),
                new Tab(icon: new Icon(Icons.arrow_back)),
              ]
          )
      ),
      /*body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new first.First(),
            new second.Second(),
            new third.Third(),
            new fourth.Fourth(),
            new fifth.Fifth()
          ]
      ),*/
    );*/
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
              widget.book,
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
            child: _getCardOptionBar()
          )

          /*Padding(
            padding: EdgeInsets.fromLTRB(15, 220, 0, 0),
            child: ListView(
              children: _getCardOptionBar()
              //get_book_info(index)
            ),
          )*/
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
              widget.book.editorial,
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
              widget.book.ean,
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
              widget.book.isbn,
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
                widget.book.language,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ],
          )
      ),
    ];

    return bookDataSheet;
  }

  _get_book_info(int index){
    var aux = widget.book.shops_items.entries.toList();
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

    for(Item item in items){
      infoItems.add(ShopItemCard(item));
      infoItems.add(
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
            child: Container(color: Colors.white, height: 2, width: width),
          )
      );
    }

    return ListView.builder
      (
        //physics: NeverScrollableScrollPhysics(),
        itemCount: infoItems.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return infoItems[index];
        }
    );

    return Column(
      children: infoItems,
    );
  }

}