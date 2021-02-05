import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:bookifyapp/LayoutWidgets/Carousels/carousel_card.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/SearchPage/search_page.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:provider/provider.dart';

import '../../Design/SizeConfig.dart';

class DiscoverPage extends StatelessWidget {
  final Color color;
  List<String> sectionsTitles = [
    "Latest Additions",
    "Top Rated",
    "More of  Novel Genre",
    "More of Romance Genre"
  ];

  DiscoverPage(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryDarkColor,
        child: ListView.builder(
            itemBuilder: (context, index) => _buildSection(context, index),
            itemCount: sectionsTitles.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        iconTheme: IconThemeData(
          color: kThirdDarkColor, //change your color here
        ),
        title: Text(SEARCH_BOOK, style: TextStyle(color: kThirdDarkColor)),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(Book.getUserMockBooks(),
                          User.getMockAlterantiveUsers())),
                );
              },
              icon: Icon(
                Icons.search,
                color: kThirdDarkColor,
              ))
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
              (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
            ),
            child: Align(
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
              (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
              (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: ListTitle(sectionTitle),
            ),
          ),
          HorizontalBookList(
            Book.toLectureList(Book.getAppMockBooks()),
            ListType.discover_option,
            user: Provider.of<User>(context, listen: false),
          ),
        ],
      );
    }
  }
}
