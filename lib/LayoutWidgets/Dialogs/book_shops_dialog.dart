import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/ShopItem/shop_item_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';

import '../../Design/SizeConfig.dart';


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
      tabs.add(new Tab(
        child: Text(
          key,
          style: TextStyle(fontSize: (2.05 * SizeConfig.textMultiplier)),
          overflow: TextOverflow.ellipsis,
        ),
      ));
      tabBarViews.add(_get_book_info(index));
    }

    var _controller = new TabController(length: tabs.length, vsync: widget.page);
    final tab = new TabBar(
      tabs: tabs,
      controller: _controller,
      labelColor: Colors.black,
      indicatorColor: kPrimaryDarkColor,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: tab.preferredSize,
        child: Card(
          elevation: (2.43 * SizeConfig.widthMultiplier), //10
          color: kPrimaryLightColor,
          child: tab,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            (3.64 * SizeConfig.widthMultiplier),//15
            0,
            (3.64 * SizeConfig.widthMultiplier),//15
            0
        ),
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
              top: (21.94 * SizeConfig.heightMultiplier), //140
              child: Container(
                  width: width,
                  height: height - (21.94 * SizeConfig.heightMultiplier),
                  color: kPrimaryLightColor,
                  child:  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                      ),
                    ),
                  )
              )
          ),

          Positioned(
            top: 0,
            left: (width / 2) - ((29.45 * SizeConfig.heightMultiplier) / 2),
            child: BookCover(
              widget.book,
              showInfo: false,
              height: (29.45 * SizeConfig.heightMultiplier), //180
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
                (3.64 * SizeConfig.widthMultiplier), //15
                (34.36 * SizeConfig.heightMultiplier), //210
                (3.64 * SizeConfig.widthMultiplier), //15
                (2.43 * SizeConfig.widthMultiplier), //10
            ),
            child: Container(color: kPrimaryDarkColor, height: (0.48 * SizeConfig.widthMultiplier), width: width), //2
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                (36.01 * SizeConfig.heightMultiplier), //220
                0,
                0),
            child: _getCardOptionBar()
          )
        ],
      ),
    );
  }

  List<Widget> get_book_data_sheet(String cover_type, Item item){
    List<Widget> bookDataSheet = [

      Padding(
          padding: EdgeInsets.fromLTRB(
              0,
              (1.21 * SizeConfig.widthMultiplier), //5
              0,
              (1.21 * SizeConfig.widthMultiplier), //5
          ),
          child: Container(
            height: (2.92 * SizeConfig.heightMultiplier), //20
            width: width,
            //color: Colors.black,
            child: Text(
              'Ficha Tecnica:',
              style: TextStyle(
                  fontSize: (2.94 * SizeConfig.textMultiplier), //18
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(
          vertical: (1.21 * SizeConfig.widthMultiplier), //5
          horizontal: 0
        ),
        child: Row(
          children: <Widget>[
            Text(
              'Editorial:',
              style: TextStyle(
                  fontSize: (2.05 * SizeConfig.textMultiplier), //14
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.book.editorial,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: (2.05 * SizeConfig.textMultiplier), //14
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: (1.21 * SizeConfig.widthMultiplier), //5
        ),
        child: Row(
          children: <Widget>[
            Text(
              'EAN:',
              style: TextStyle(
                  fontSize: (2.05 * SizeConfig.textMultiplier), //14
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              item.ean,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: (2.05 * SizeConfig.textMultiplier), //14
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical:  (1.21 * SizeConfig.widthMultiplier), //5
        ),
        child: Row(
          children: <Widget>[
            Text(
              'IBAN:',
              style: TextStyle(
                  fontSize: (2.05 * SizeConfig.textMultiplier), //14
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              item.isbn,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: (2.05 * SizeConfig.textMultiplier), //14
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),

      Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: (1.21 * SizeConfig.widthMultiplier), //5
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Idioma:',
                style: TextStyle(
                    fontSize: (2.05 * SizeConfig.textMultiplier), //14
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.book.language,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: (2.05 * SizeConfig.textMultiplier), //14
                ),
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
          padding: EdgeInsets.fromLTRB(
              0,
              (1.21 * SizeConfig.widthMultiplier), //5
              0,
              0
          ),
          child: Column(
            children: get_book_data_sheet(cover_type, items[0])
          )
      ),

      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: (2.43 * SizeConfig.widthMultiplier), //10
        ),
        child: Container(color: kPrimaryDarkColor, height: (0.48 * SizeConfig.widthMultiplier), width: width), //2
      ),
    ];

    for(Item item in items){
      infoItems.add(ShopItemCard(item));
      infoItems.add(
          Padding(
            padding: EdgeInsets.fromLTRB(0, (0.48 * SizeConfig.widthMultiplier), 0, 0),
            child: Container(color: kPrimaryLightColor, height: (0.48 * SizeConfig.widthMultiplier), width: width),
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