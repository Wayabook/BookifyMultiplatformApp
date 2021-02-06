import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/BookPage/Components/book_info_row.dart';
import 'package:bookifyapp/Pages/BookPage/Components/book_list_container.dart';
import 'package:bookifyapp/Pages/chapters_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:bookifyapp/LayoutWidgets/info_row.dart';
import 'package:bookifyapp/Enums/row_type.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/summary_text.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/friends_preview.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/book_shops_dialog.dart';
import 'package:provider/provider.dart';
import '../../InfoToast.dart';
import '../../Models/User.dart';
import '../../Design/SizeConfig.dart';
import '../CommentPage/comment_page.dart';
import 'Components/friens_preview_column.dart';

class BookPage extends StatefulWidget {
  final String title;
  final Book book;
  final List<Book> auxBooksForPrototype;

  const BookPage(this.title, this.book, this.auxBooksForPrototype)
      : assert(title != null);

  @override
  _BookPage createState() =>
      _BookPage(this.title, this.book, this.auxBooksForPrototype);
}

class _BookPage extends State<BookPage> with TickerProviderStateMixin {
  static const ICON_HEIGHT_MULTIPLIER = 7;
  static const ICON_WIDTH_MULTIPLIER = 15;

  final String title;
  final Book book;
  final List<Book> auxBooksForPrototype;
  IconData addIcon;
  Color addIconColor, addIconBackgroundColor;
  bool isInPendingList;
  bool isInReadingList;
  List<Widget> items;

  _BookPage(this.title, this.book, this.auxBooksForPrototype);

  @override
  void initState() {
    super.initState();
    addIconBackgroundColor = kForthDarkColor;

    var user = Provider.of<User>(context, listen: false);
    isInPendingList = user.isInPendingList(book.toLecture());
    isInReadingList = user.isInReadingList(book.toLecture());

    if (isInReadingList) {
      addIcon = Icons.local_library;
      addIconBackgroundColor = kForthDarkColor;
      addIconColor = kThirdDarkColor;
    } else {
      changeAddButtonColors();
    }
  }

  void changeAddButtonColors() {
    if (isInPendingList) {
      addIcon = Icons.remove_circle;
      addIconColor = Colors.redAccent;
    } else {
      addIcon = Icons.add_circle_outline;
      addIconColor = kThirdDarkColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      body: Container(
        key: UniqueKey(),
        color: kPrimaryDarkColor,
        child: _buildBookPage(context),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          book.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: kThirdDarkColor),
        ),
      ),
    );
  }

  _getBookCoverStack(width) {
    return Stack(
      key: UniqueKey(),
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom:
                  (CONTAINER_FACTOR_140 * SizeConfig.heightMultiplier)), //140
          child: ArcBannerImage(this.book.picture),
        ),
        Positioned(
            bottom: (PADDING_FACTOR_30 * SizeConfig.heightMultiplier), //30
            left: (PADDING_FACTOR_16 * SizeConfig.widthMultiplier), //16
            right: (PADDING_FACTOR_16 * SizeConfig.widthMultiplier), //16,
            child: Align(
              alignment: Alignment.center,
              child: BookCover(
                book,
                height:
                    (CONTAINER_FACTOR_180 * SizeConfig.heightMultiplier), // 180
              ),
            )),
      ],
    );
  }

  _getButtonPadding(raisedButton) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            (PADDING_FACTOR_0),
            (PADDING_FACTOR_0),
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
            (PADDING_FACTOR_0)),
        child: raisedButton);
  }

  _getBookTopButtons() {
    return Center(
      key: UniqueKey(),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Row contents vertically,
        children: <Widget>[
          _getButtonPadding(RaisedButton(
            onPressed: () {
              setState(() {
                if (!isInReadingList) {
                  var user = Provider.of<User>(context, listen: false);
                  if (isInPendingList) {
                    user.removeLectureFromPendingList(this.book.toLecture());
                    InfoToast.showBookRemovedCorrectlyToast(widget.book.title);
                  } else {
                    user.addLectureToPendingList(this.book.toLecture());
                    InfoToast.showBookAddedCorrectlyToast(widget.book.title);
                  }
                  isInPendingList = !isInPendingList;
                  changeAddButtonColors();
                }
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  (ICON_FACTOR_25 * SizeConfig.imageSizeMultiplier)), //25
            )),
            color: addIconBackgroundColor,
            child: SizedBox(
              height: (ICON_HEIGHT_MULTIPLIER * SizeConfig.heightMultiplier),
              width: (ICON_WIDTH_MULTIPLIER * SizeConfig.widthMultiplier),
              child: IconButton(
                iconSize:
                    (ICON_FACTOR_24 * SizeConfig.imageSizeMultiplier), //24
                icon: Icon(
                  addIcon,
                  color: addIconColor,
                  //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                ),
              ),
            ),
          )),
          _getButtonPadding(RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    BookShopsDialog(this.book, this),
              );
            },
            color: kForthDarkColor,
            child: SizedBox(
              height: (ICON_HEIGHT_MULTIPLIER * SizeConfig.heightMultiplier),
              width: (ICON_WIDTH_MULTIPLIER * SizeConfig.widthMultiplier),
              child: IconButton(
                iconSize:
                    (ICON_FACTOR_24 * SizeConfig.imageSizeMultiplier), //24
                icon: Icon(
                  Icons.shop_two,
                  color: kThirdDarkColor,
                  //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                ),
              ),
            ),
          )),
          _getButtonPadding(RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ChaptersPage(this.book),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                  (ICON_FACTOR_25 * SizeConfig.imageSizeMultiplier)), //25
            )),
            color: kForthDarkColor,
            child: SizedBox(
              height: (ICON_HEIGHT_MULTIPLIER * SizeConfig.heightMultiplier),
              width: (ICON_WIDTH_MULTIPLIER * SizeConfig.widthMultiplier),
              child: IconButton(
                iconSize:
                    (ICON_FACTOR_24 * SizeConfig.imageSizeMultiplier), //24
                icon: Icon(
                  Icons.list,
                  color: kThirdDarkColor,
                  //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  _getPaddingContainer(width) {
    return Padding(
      key: UniqueKey(),
      padding: EdgeInsets.symmetric(
          horizontal: (PADDING_FACTOR_15 * SizeConfig.widthMultiplier), //15
          vertical: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier) // 10
          ),
      child: Container(
          color: kThirdDarkColor,
          height: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
          width: width),
    );
  }

  _getDescriptionSummary() {
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
                (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
                (CONTAINER_FACTOR_2 * SizeConfig.heightMultiplier), //2
                (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
                (PADDING_FACTOR_0)),
            child: Row(
              children: <Widget>[
                Text(
                  'Summary:',
                  style: TextStyle(
                      fontSize:
                          (TEXT_FACTOR_18 * SizeConfig.textMultiplier), // 18
                      fontWeight: FontWeight.bold,
                      color: kThirdDarkColor),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Text(
                    '4/5',
                    style: TextStyle(
                        fontSize:
                            (TEXT_FACTOR_18 * SizeConfig.textMultiplier), // 18
                        fontWeight: FontWeight.bold,
                        color: kThirdDarkColor),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            )),

        SizedBox(height: (PADDING_FACTOR_8 * SizeConfig.heightMultiplier)), // 8

        SummaryTextWidget(
          text: this.book.summary,
          backgroundColor: kPrimaryDarkColor,
        ),

        SizedBox(height: (PADDING_FACTOR_8 * SizeConfig.heightMultiplier)), // 8

        Padding(
          padding: EdgeInsets.symmetric(
            vertical: PADDING_FACTOR_0,
            horizontal: (PADDING_FACTOR_5 * SizeConfig.widthMultiplier), //5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.comment,
                  color: kThirdDarkColor,
                  size: (ICON_FACTOR_25 * SizeConfig.imageSizeMultiplier), //25
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.book.getBookTotalNumberOfComments().toString() +
                      " comentarios",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                  ),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      child: SmallButtonUnderlined(VIEW_ALL),
                      onTap: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CommentPage.showingAllBookComments(
                                  this.book,
                                  inactiveAddCommentOption: true,
                                )));
                      },
                    )),
              )
            ],
          ),
        )
      ],
    );
  }

  _initializeItems(width) {
    double widthPerChild = (width -
            (7.29 * SizeConfig.widthMultiplier) -
            (4.86 * SizeConfig.widthMultiplier)) /
        3;
    items = new List();
    items.add(_getBookCoverStack(width));
    items.add(_getBookTopButtons());
    items.add(_getPaddingContainer(width));
    items.add(BookInfoRow(this.book, widthPerChild));
    items.add(_getPaddingContainer(width));
    User user = Provider.of<User>(context, listen: false);

    if ((book.friendsReading != null && book.friendsReading.length > 0) ||
        user.isBookRecommended(book))
      items.add(FriendsPreviewColumn(
          user, this.book, user.isBookRecommended(this.book)));
    items.add(_getDescriptionSummary());
    items.add(BookListContainer(
        "More books of" + "Author X:", auxBooksForPrototype, user));
    items
        .add(BookListContainer("More of X Genre:", auxBooksForPrototype, user));
  }

  _buildBookPage(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    _initializeItems(width);

    return ListView.builder(
      key: UniqueKey(),
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: kPrimaryDarkColor,
          child: items[index],
        );
      },
    );
  }
}
