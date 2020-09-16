import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Pages/friends_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_info.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/LayoutWidgets/info_row.dart';
import 'package:bookifyapp/Enums/row_type.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_genres_list.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/Pages/badgets_page.dart';

import 'package:bookifyapp/Pages/profile_page.dart';
import 'dart:math';


class ProfilePage extends StatelessWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  User user;
  ProfileType profileType;
  double width_per_child;
  double width;
  BuildContext context;
  String randomBackgroundImage;

  ProfilePage(this.user, this.profileType);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    width_per_child = (width - 30 - (10 * 2)) / 3;

    return Scaffold(
      body: _getBody(),
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
    );
  }

  _getRandomBackgroundImage(){
    final _random = new Random();
    List<String> listNames = user.bookLists.keys.toList();
    String randomListName = listNames[_random.nextInt(listNames.length)];
    int r = 0;
    if(this.user.bookLists[randomListName].length > 1){
      r = 0 + _random.nextInt(this.user.bookLists[randomListName].length - 1 - 0);
    }
    randomBackgroundImage = user.bookLists[randomListName][r].picture;
  }

  _getBody(){

    _getRandomBackgroundImage();
    /*var rnd = new Random();
    int r = 0;
    if(this.user.bookLists["Reading"].length > 1){
      r = 0 + rnd.nextInt(this.user.bookLists["Reading"].length - 1 - 0);
    }*/



    return ListView(
      children: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: ArcBannerImage(randomBackgroundImage),
            ),
            Positioned(
              bottom: 0.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child:
                    Center(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.security,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child:Text(
                                  "BADGETS",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BadgetsPage()),
                            );
                          },
                        )
                    ),
                    /*Container(
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.security,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child:Text(
                                  "BADGETS",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ),
                            ],
                          )
                      ),
                    )*/
                  ),
                  Flexible(
                    child: ProfileInfo(user),
                    flex: 6,
                  ),
                  Flexible(
                    flex: 2,
                    child:
                    Center(
                        child:GestureDetector(
                          child:  Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.people,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child:Text(
                                  "FRIENDS",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FriendsPage(user.friends)),
                            );
                          },
                        )
                    ),
                    /*Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.people,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child:Text(
                                "FRIENDS",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ),
                    ),*/
                  )
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              InfoRow.withIcon(RowType.icon_image,  "BOOKS READ", Icons.book,  user.booksRead.toString(), width_per_child, 105),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              InfoRow.withIcon(RowType.icon_image,  "CHAPS READ", Icons.collections_bookmark,  user.chaptersRead.toString(), width_per_child, 105),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              InfoRow.withIcon(RowType.icon_image,  "PAGES READ", Icons.description,  user.pagesRead.toString(), width_per_child, 105),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
          child:  Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Genres of Interest:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
        ),

        /*Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),*/


        HorizontalGenresList(
            user.interestedGenres,
            profileType == ProfileType.user_profile ? ListType.add_genre : ListType.normal
        ),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
          child:  Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Bookshelf:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
        ),

        /*Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),*/

        HorizontalBookList(user.bookLists["Reading"], ListType.view_all),

        BookCard.option(
            profileType == ProfileType.user_profile ?  BookCardType.add_custom_list : BookCardType.recommend_book
        ),

        //BookCard.option(BookCardType.settings),


        //_addSettingsWidget()

      ],
    );
  }

  _addSettingsWidget() {
    if (profileType == ProfileType.user_profile){
      return BookCard.option(BookCardType.settings);
    }
  }
}

// See multiple profiles
/*class CustomAvatars extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                ), // P// Provide your custom image
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                ), // Provide your custom image
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

