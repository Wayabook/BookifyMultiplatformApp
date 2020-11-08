import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/LayoutWidgets/Carousels/carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/Enums/list_type.dart';

import '../../SizeConfig.dart';



class DiscoverPage extends StatelessWidget {

  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<String> sectionsTitles = ["Latest Additions","Top Rated","More of  Novel Genre","More of Romance Genre"];

  DiscoverPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: kPrimaryDarkColor,
        child: ListView.builder(
          itemBuilder: (context, index) => _buildSection(context, index),
          itemCount: sectionsTitles.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true
        ),
      ),

      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        title: Text("Search book..."),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: Icon(Icons.search)
          )
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, int index) {
    String sectionTitle = sectionsTitles[index];
    if (index == 0) {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                (1.21 * SizeConfig.widthMultiplier), //5
                (0.29 * SizeConfig.heightMultiplier), // 2
                (0.48 * SizeConfig.widthMultiplier), //2
                (0.29 * SizeConfig.heightMultiplier), // 2
            ),
            child:  Align(
              alignment: Alignment.topLeft,
              child: ListTitle(sectionTitle),
            ),
          ),

          CarouselCard(Book.getAppMockBooks()),
        ],
      );

    } else {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                (1.21 * SizeConfig.widthMultiplier), //5
                (0.29 * SizeConfig.heightMultiplier), // 2
                (0.48 * SizeConfig.widthMultiplier), //2
                (0.29 * SizeConfig.heightMultiplier), // 2
            ),
            child:  Align(
              alignment: Alignment.topLeft,
              child: ListTitle(sectionTitle),
            ),
          ),
          HorizontalBookList(Book.toLectureList(Book.getAppMockBooks()), ListType.discover_option),
        ],
      );
    }
  }
}
