import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_accept_and_cancel_options.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
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

import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  User user;
  ProfileType profileType;
  bool isFriend;

  ProfilePage(this.user, this.profileType, { this.isFriend = false});

  @override
  _ProfilePage createState() => _ProfilePage();
}


class _ProfilePage extends State<ProfilePage>{
  String randomBackgroundImage;
  BuildContext context;
  double width_per_child;
  double width;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    width_per_child = (width - 30 - (10 * 2)) / 3;

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      body: _getBody(),
      appBar: widget.profileType == ProfileType.friend_profile ?
      AppBar(backgroundColor: kPrimaryDarkColor,) : null,
    );
  }

  _getRandomBackgroundImage(){
    final _random = new Random();
    List<String> listNames = widget.user.bookLists.keys.toList();
    String randomListName = listNames[_random.nextInt(listNames.length)];
    int r = 0;
    if(widget.user.bookLists[randomListName].length > 1){
      r = 0 + _random.nextInt(widget.user.bookLists[randomListName].length - 1 - 0);
    }
    randomBackgroundImage = widget.user.bookLists[randomListName][r].picture;
  }

  _getBody(){

    _getRandomBackgroundImage();

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
                                  color: kPrimaryLightColor,
                                  size: 30,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child:Text(
                                  "BADGETS",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryLightColor),
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
                  ),
                  Flexible(
                    child: ProfileInfo(widget.user),
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
                                  color: kPrimaryLightColor,
                                  size: 30,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child:Text(
                                  "FRIENDS",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryLightColor),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FriendsPage(widget.user.friends)),
                            );
                          },
                        )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),



        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 15, 10),
          child: _getFriendButton()
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              InfoRow.withIcon(
                  RowType.icon_image,
                  "BOOKS READ",
                  Icons.book,
                  widget.user.booksRead.toString(),
                  width_per_child,
                  105,
                  kPrimaryLightColor),

              Container(color: kPrimaryLightColor, height: 105, width: 2,),

              InfoRow.withIcon(
                  RowType.icon_image,
                  "CHAPS READ",
                  Icons.collections_bookmark,
                  widget.user.chaptersRead.toString(),
                  width_per_child, 105,
                  kPrimaryLightColor),

              Container(color: kPrimaryLightColor, height: 105, width: 2,),

              InfoRow.withIcon(
                  RowType.icon_image,
                  "PAGES READ",
                  Icons.description,
                  widget.user.pagesRead.toString(),
                  width_per_child,
                  105,
                  kPrimaryLightColor),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: kPrimaryLightColor, height: 2, width: width),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
          child:  Align(
            alignment: Alignment.topLeft,
            child: ListTitle("Genres of Interest")
          ),
        ),

        HorizontalGenresList(
            widget.user.interestedGenres,
            widget.profileType == ProfileType.user_profile ? ListType.add_genre : ListType.normal
        ),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
          child:  Align(
            alignment: Alignment.topLeft,
            child: ListTitle(
              "Bookshelf",
              withButton: true,
              user: widget.user,
            )
          ),
        ),

        HorizontalBookList(widget.user.getNLecturesFromBookshelf(5), ListType.view_all, user: widget.user,),

        BookCard.option(
          widget.profileType == ProfileType.user_profile ?  BookCardType.add_custom_list : BookCardType.recommend_book,
          user: widget.user,
        ),

        //BookCard.option(BookCardType.settings),


        //_addSettingsWidget()

      ],
    );
  }

  _getFriendButton(){
    if(widget.profileType == ProfileType.friend_profile){
      return Column(
        children: [
          Align(
            alignment: Alignment.center,
            child:  RaisedButton(
              onPressed: () async {
                if(widget.isFriend){
                  int result = await showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogWithAcceptAndCancelOptions(
                        "Delete Friend",
                        "Are you sure you want to delete friend?",
                        TextStyle(color: Colors.red,),
                        TextStyle(color: Colors.blue,)
                    ),
                  );
                  if(result == DialogWithAcceptAndCancelOptions.ACCEPT_TAP){
                    User user = Provider.of<User>(context, listen: false);
                    user.removeFriend(widget.user);
                    setState(() {
                      widget.isFriend = !widget.isFriend;
                    });
                  }
                } else {
                  User user = Provider.of<User>(context, listen: false);
                  user.addFriend(widget.user);
                  setState(() {
                    widget.isFriend = !widget.isFriend;
                  });
                }

              },
              textColor: kPrimaryLightColor,
              color: widget.isFriend ? Colors.lightGreen[500] : Colors.blueGrey[300],
              child: Text(
                widget.isFriend ? "Friend" : "Add Friend",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Container(color: kPrimaryLightColor, height: 2, width: width),
          )
        ],
      );
    } else {
      return Container(color: kPrimaryLightColor, height: 2, width: width);
    }
  }
}

