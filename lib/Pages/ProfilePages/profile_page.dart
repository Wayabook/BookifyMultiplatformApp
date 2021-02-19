import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Interfaces/TitleButtonInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/friend_button.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/book_card_factory.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/recommendation_dialog.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Pages/ProfilePages/Components/lecture_info_row.dart';
import 'package:bookifyapp/Pages/ProfilePages/friends_page.dart';
import 'package:bookifyapp/Pages/GenrePages/genres_page.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_info.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_genres_list.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'dart:math';
import '../bookshelf_page.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  User user;
  ProfileType profileType;
  bool isFriend;

  ProfilePage(this.user, this.profileType, {this.isFriend = false});

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> implements TitleButtonInterface {
  String randomBackgroundImage;
  BuildContext context;
  double widthPerChild;
  double width;
  List<Widget> items;

  @override
  void initState() {
    super.initState();
    _updateList();
  }

  _updateList() {
    items = new List();
    items.add(_getTopStack());
    items.add(_getFriendButtonContainer());
    items.add(LectureInfoRow(widget.user, this.widthPerChild));
    items.add(_getHorizontalLineSeparator());
    items.add(_getGenresTitle());
    items.add(_getGenresHorizontalList());
    items.add(_getBookshelfTitle());
    items.add(HorizontalBookList(
      widget.user.getNLecturesFromBookshelf(5),
      ListType.view_all,
      user: widget.user,
    ));
    items.add(BookCardFactory(
            widget.profileType == ProfileType.user_profile
                ? BookCardType.add_custom_list
                : BookCardType.recommend_book,
            null,
            user: widget.user)
        .build(context: context));
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    widthPerChild = (width -
            (7.29 * SizeConfig.widthMultiplier) -
            (4.86 * SizeConfig.widthMultiplier)) /
        (0.72 * SizeConfig.widthMultiplier);

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      body: _getBody(),
      appBar: widget.profileType == ProfileType.friend_profile
          ? AppBar(
              backgroundColor: kPrimaryDarkColor,
              iconTheme: IconThemeData(
                color: kThirdDarkColor, //change your color here
              ),
            )
          : null,
    );
  }

  _getRandomBackgroundImage() {
    final _random = new Random();
    List<String> listNames = widget.user.bookLists.keys.toList();
    String randomListName = listNames[_random.nextInt(listNames.length)];
    int r = 0;
    if (widget.user.bookLists[randomListName].length > 1) {
      r = 0 +
          _random.nextInt(widget.user.bookLists[randomListName].length - 1 - 0);
    }
    randomBackgroundImage = widget.user.bookLists[randomListName][r].picture;
  }

  _getTopStack() {
    //_getRandomBackgroundImage();
    randomBackgroundImage =
        "https://imagessl0.casadellibro.com/a/l/t5/50/9788491819950.jpg";
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom:
                  (PADDING_FACTOR_120 * SizeConfig.heightMultiplier)), // 120
          child: ArcBannerImage(randomBackgroundImage),
        ),
        Positioned(
          bottom: PADDING_FACTOR_0,
          left: (PADDING_FACTOR_16 * SizeConfig.widthMultiplier), // 16
          right: (PADDING_FACTOR_16 * SizeConfig.widthMultiplier), // 16
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 2,
                  child: _getOptionButtonContainer(
                    BADGETS_TITLE,
                    Icons.security,
                    () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => RecommendationDialog(
                            Recommendation.getMockRecommendation()),
                      );
                    },
                  )),
              Flexible(
                child: ProfileInfo(widget.user),
                flex: 6,
              ),
              Flexible(
                  flex: 2,
                  child: _getOptionButtonContainer(
                    FRIENDS_TITLE,
                    Icons.people,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FriendsPage(widget.user.friends)),
                      );
                    },
                  ))
            ],
          ),
        ),
      ],
    );
  }

  _getOptionButtonContainer(text, icon, onTapFunction) {
    return Center(
        child: GestureDetector(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: kThirdDarkColor,
                    size:
                        (ICON_FACTOR_30 * SizeConfig.imageSizeMultiplier), // 30
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize:
                            (TEXT_FACTOR_12 * SizeConfig.textMultiplier), // 12
                        fontWeight: FontWeight.bold,
                        color: kThirdDarkColor),
                  ),
                ),
              ],
            ),
            onTap: onTapFunction));
  }

  _getFriendButtonContainer() {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
            (PADDING_FACTOR_0), // 0
            (PADDING_FACTOR_15 * SizeConfig.widthMultiplier), // 15
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier) // 10
            ),
        child: FriendButton(
            widget.user, widget.profileType, widget.isFriend, this.width));
  }

  _getHorizontalLineSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (3.64 * SizeConfig.widthMultiplier), //15
          vertical: (1.46 * SizeConfig.heightMultiplier) // 10
          ),
      child: Container(
        color: kThirdDarkColor,
        height: (0.29 * SizeConfig.heightMultiplier),
      ),
    );
  }

  _getGenresTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
          (PADDING_FACTOR_0)),
      child: Align(
          alignment: Alignment.topLeft,
          child: widget.profileType == ProfileType.user_profile
              ? ListTitle(
                  GENRES_OF_INTEREST,
                  withButton: true,
                  user: widget.user,
                  buttonType: ButtonType.edit_genres_list,
                  onListTitleButtonTapped: onTitleButtonPressed,
                )
              : ListTitle(GENRES_OF_INTEREST)),
    );
  }

  _getBookshelfTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
          (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
          (PADDING_FACTOR_0)),
      child: Align(
          alignment: Alignment.topLeft,
          child: ListTitle(
            BOOKSHELF_TITLE,
            withButton: true,
            user: widget.user,
            onListTitleButtonTapped: onTitleButtonPressed,
          )),
    );
  }

  _getGenresHorizontalList() {
    return HorizontalGenresList(
      widget.user.interestedGenres,
      widget.profileType == ProfileType.user_profile
          ? ListType.add_genre
          : ListType.normal,
      onTitleButtonPressed: onTitleButtonPressed,
    );
  }

  _getBody() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }

  @override
  onTitleButtonPressed(ButtonType buttonType, BuildContext context,
      {String title}) async {
    if (buttonType == ButtonType.view_all) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookshelfPage(widget.user)),
      );
    } else if (buttonType == ButtonType.edit_genres_list) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GenresPage(widget.user)),
      );
      InfoToast.showInterestsSavedCorrectly();
    }

    setState(() {
      _updateList();
    });
  }
}
