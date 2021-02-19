import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/ShopItem/shop_item_card.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:flutter/painting.dart';

import '../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class BookShopsDialog<T extends TickerProviderStateMixin>
    extends StatefulWidget {
  Book book;
  T page;

  BookShopsDialog(this.book, this.page);

  final TextEditingController inputController = TextEditingController();

  @override
  _BookShopsDialog createState() => _BookShopsDialog();
}

class _BookShopsDialog extends State<BookShopsDialog> {
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
            height: height, width: width, child: _getCardContent(context)));
    return alertDialog;
  }

  _getCardOptionBar() {
    List<Tab> tabs = new List();
    List<Widget> tabBarViews = new List();
    var index = 0;
    for (String key in widget.book.shopsItems.keys) {
      tabs.add(new Tab(
        child: Text(
          key,
          style: TextStyle(
              fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier),
              color: kThirdDarkColor),
          overflow: TextOverflow.ellipsis,
        ),
      ));
      tabBarViews.add(_getBookInfo(index));
    }

    var _controller =
        new TabController(length: tabs.length, vsync: widget.page);
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
            elevation: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
            color: kPrimaryLightColor,
            child: tab,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (PADDING_FACTOR_15 * SizeConfig.widthMultiplier), //15,
            vertical: PADDING_FACTOR_0,
          ),
          child: TabBarView(controller: _controller, children: tabBarViews),
        ));
  }

  _getCardContent(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: (CONTAINER_FACTOR_140 * SizeConfig.heightMultiplier), //140
              child: Container(
                  width: width,
                  height: height -
                      (CONTAINER_FACTOR_140 * SizeConfig.heightMultiplier),
                  color: kPrimaryDarkColor,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: kThirdDarkColor,
                        size: (ICON_FACTOR_24 *
                            SizeConfig.imageSizeMultiplier), //24
                      ),
                    ),
                  ))),
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
              (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
            ),
            child: Container(
                color: kThirdDarkColor,
                height: (0.48 * SizeConfig.widthMultiplier),
                width: width), //2
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  PADDING_FACTOR_0,
                  (36.01 * SizeConfig.heightMultiplier), //220
                  PADDING_FACTOR_0,
                  PADDING_FACTOR_0),
              child: _getCardOptionBar())
        ],
      ),
    );
  }

  List<Widget> getBookDataSheet(String coverType, Item item) {
    List<Widget> bookDataSheet = [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PADDING_FACTOR_0,
          vertical: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier),
        ),
        child: Container(
          height: (PADDING_FACTOR_20 * SizeConfig.heightMultiplier), //20
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
            vertical: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
            horizontal: PADDING_FACTOR_0),
        child: Row(
          children: <Widget>[
            Text(
              'Editorial:',
              style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.book.editorial,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PADDING_FACTOR_0,
          vertical: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
        ),
        child: Row(
          children: <Widget>[
            Text(
              'EAN:',
              style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              item.ean,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PADDING_FACTOR_0,
          vertical: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
        ),
        child: Row(
          children: <Widget>[
            Text(
              'IBAN:',
              style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              item.isbn,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PADDING_FACTOR_0,
            vertical: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Idioma:',
                style: TextStyle(
                    fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.book.language,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                ),
                textAlign: TextAlign.left,
              ),
            ],
          )),
    ];

    return bookDataSheet;
  }

  _getBookInfo(int index) {
    var aux = widget.book.shopsItems.entries.toList();
    String coverType = aux[index].key;
    List<Item> items = aux[index].value;

    List<Widget> infoItems = <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(
              PADDING_FACTOR_0,
              (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
              PADDING_FACTOR_0,
              PADDING_FACTOR_0),
          child: Column(children: getBookDataSheet(coverType, items[0]))),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PADDING_FACTOR_0,
          vertical: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
        ),
        child: Container(
            color: kPrimaryDarkColor,
            height: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier),
            width: width), //2
      ),
    ];

    for (Item item in items) {
      infoItems.add(ShopItemCard(item));
      infoItems.add(Padding(
        padding: EdgeInsets.fromLTRB(
            PADDING_FACTOR_0,
            (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier),
            PADDING_FACTOR_0,
            PADDING_FACTOR_0),
        child: Container(
            color: kPrimaryDarkColor,
            height: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier),
            width: width),
      ));
    }

    return ListView.builder(
        itemCount: infoItems.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return infoItems[index];
        });
  }
}
