import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
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
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    alertDialog = new Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        child: _getCardContent(context)
      )
    );
    return alertDialog;
  }

  _getCardOptionBar(){
    List<Tab> tabs = new List();
    List<Widget> tabBarViews = new List();
    var index = 0;
    for(String key in widget.book.shops_items.keys){
      tabs.add(new Tab(text: key,));
      tabBarViews.add(_get_book_info(index));
    }

    var _controller = new TabController(length: tabs.length, vsync: widget.page);
    final tab = new TabBar(
      tabs: tabs,
      controller: _controller,
      labelColor: Colors.black,
      indicatorColor: Colors.blueGrey,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: tab.preferredSize,
        child: Card(
          elevation: 10.0,
          color: kPrimaryLightColor,
          child: tab,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: TabBarView(
            controller: _controller,
            children: tabBarViews
        ),
      )
    );
  }


  _getCardContent(BuildContext context){

    return Container(
      //color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 140,
              child: Container(
                  width: width,
                  height: height-140,
                  color: kPrimaryLightColor,
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
            padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
            child: _getCardOptionBar()
          )
        ],
      ),
    );
  }

  List<Widget> get_book_data_sheet(String cover_type, Item item){
    List<Widget> bookDataSheet = [

      Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Container(
            height: 20,
            width: width,
            //color: Colors.black,
            child: Text(
              'Ficha Tecnica:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
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
              item.ean,
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
              item.isbn,
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
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Column(
            children: get_book_data_sheet(cover_type, items[0])
          )
      ),

      Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(color: Colors.blueGrey, height: 2, width: width),
      ),
    ];

    for(Item item in items){
      infoItems.add(ShopItemCard(item));
      infoItems.add(
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
            child: Container(color: kPrimaryLightColor, height: 2, width: width),
          )
      );
    }

    return ListView.builder
      (
        itemCount: infoItems.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return infoItems[index];
        }
    );
  }

}