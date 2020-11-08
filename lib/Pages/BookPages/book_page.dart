import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Pages/chapters_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:bookifyapp/LayoutWidgets/info_row.dart';
import 'package:bookifyapp/Enums/row_type.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/summary_text.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/horizontal_book_list.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/friends_preview.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/book_shops_dialog.dart';
import 'package:provider/provider.dart';
import '../../InfoToast.dart';
import '../../Models/User.dart';
import '../../SizeConfig.dart';
import '../comment_page.dart';


class BookPage extends StatefulWidget {
  final String title;
  final Book book;
  final List<Book> auxBooksForPrototype;

  const BookPage(this.title, this.book, this.auxBooksForPrototype)
      : assert(title != null);

  @override
  _BookPage createState() => _BookPage(
      this.title,
      this.book,
      this.auxBooksForPrototype);
}

class _BookPage extends State<BookPage> with TickerProviderStateMixin{

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
  void initState(){
    super.initState();
    addIconBackgroundColor = kPrimaryDarkColor;

    var user = Provider.of<User>(context, listen: false);
    isInPendingList = user.isInPendingList(book.toLecture());
    isInReadingList = user.isInReadingList(book.toLecture());

    if(isInReadingList) {
      addIcon = Icons.local_library;
      addIconBackgroundColor = Colors.blueGrey[500];
    } else {
      changeAddButtonColors();
    }

  }

  void changeAddButtonColors(){
    if(isInPendingList){
      addIcon = Icons.remove_circle;
      addIconColor = Colors.redAccent;
    } else {
      addIcon  = Icons.add_circle_outline;
      addIconColor = kPrimaryLightColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      body: Container(
        key: UniqueKey(),
        child: _buildBookPage(context),
      ),
      appBar: AppBar(
          backgroundColor: kPrimaryDarkColor,
          title: Text(
              book.title,
              overflow: TextOverflow.ellipsis,
          ),
      ),
    );
  }

  _getBookCoverStack(width){
    return Stack(
      key: UniqueKey(),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: (21.94 * SizeConfig.heightMultiplier)), //140
          child: ArcBannerImage(this.book.picture),
        ),

        Positioned(
          bottom: (7.29 * SizeConfig.widthMultiplier), // 30
          left: (3.89 * SizeConfig.widthMultiplier), //16
          right: (3.89 * SizeConfig.widthMultiplier), //16,
          child: Align(
            alignment: Alignment.center,
            child:  BookCover(
              book,
              height: (26.35 * SizeConfig.heightMultiplier), // 180
            ),
          )
        ),
      ],
    );
  }

  _getBookTopRelatedButtons(){
    return Center(
      key: UniqueKey(),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                0,
                (2.43 * SizeConfig.widthMultiplier), //10
                0
            ),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  if(!isInReadingList){
                    var user = Provider.of<User>(context, listen: false);
                    if(isInPendingList){
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
                    topLeft: Radius.circular((6.08 * SizeConfig.imageSizeMultiplier)), //25
                  )
              ),
              color: addIconBackgroundColor,
              child:  SizedBox(
                height: (7 * SizeConfig.heightMultiplier),
                width: (15 * SizeConfig.widthMultiplier),
                child:  IconButton(
                  iconSize: (5.83 * SizeConfig.imageSizeMultiplier), //24
                  icon: Icon(
                    addIcon,
                    color: addIconColor,
                    //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, (2.43 * SizeConfig.widthMultiplier), 0), //10
            child: RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => BookShopsDialog(this.book, this),
                );
              },
              color: kPrimaryDarkColor,
              child: SizedBox(
                height: (7 * SizeConfig.heightMultiplier),
                width: (15 * SizeConfig.widthMultiplier),
                child: IconButton(
                  iconSize: (5.83 * SizeConfig.imageSizeMultiplier), //24
                  icon: Icon(
                    Icons.shop_two,
                    color: kPrimaryLightColor,
                    //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, (2.43 * SizeConfig.widthMultiplier), 0), //10
            child: RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ChaptersPage(this.book),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular((6.08 * SizeConfig.imageSizeMultiplier)), //25
                  )
              ),
              color: kPrimaryDarkColor,
              child: SizedBox(
                height: (7 * SizeConfig.heightMultiplier),
                width: (15 * SizeConfig.widthMultiplier),
                child: IconButton(
                  iconSize: (5.83 * SizeConfig.imageSizeMultiplier), //24
                  icon:Icon(
                    Icons.list,
                    color: kPrimaryLightColor,
                    //size: (5.83 * SizeConfig.imageSizeMultiplier), //24
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

  _getBookInfoRow(widthPerChild){
    return Center(
      key: UniqueKey(),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: <Widget>[

          InfoRow(
              RowType.image,
              "GENDER",
              "images/genre1.png",
              "Romance",
              widthPerChild,
              (16.83 * SizeConfig.heightMultiplier)), //115

          Container(
            color: kPrimaryDarkColor,
            height: (16.83 * SizeConfig.heightMultiplier),
            width: (0.48 * SizeConfig.widthMultiplier), //2
          ), //2

          InfoRow(
              RowType.text,
              "PUBLICATION",
              "2017",
              "Year",
              widthPerChild,
              (16.83 * SizeConfig.heightMultiplier)
          ), //115

          Container(
            color: kPrimaryDarkColor,
            height: (16.83 * SizeConfig.heightMultiplier),
            width: (0.48 * SizeConfig.widthMultiplier), //2
          ),

          InfoRow(
              RowType.text,
              "EXTENSION",
              "128",
              "Pages",
              widthPerChild,
              (16.83 * SizeConfig.heightMultiplier)
          ), //115


        ],
      ),
    );
  }

  _getPaddingContainer(width){
    return Padding(
      key: UniqueKey(),
      padding: EdgeInsets.symmetric(
          horizontal: (3.64 * SizeConfig.widthMultiplier),//15
          vertical: (1.46 * SizeConfig.heightMultiplier)// 10
      ),
      child: Container(
          color: kPrimaryDarkColor,
          height: (0.48 * SizeConfig.widthMultiplier), //2
          width: width
      ),
    );
  }

  _getDescriptionSummary(){
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //color: Colors.black,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
                (1.21 * SizeConfig.widthMultiplier), //5
                (0.29 * SizeConfig.heightMultiplier), //2
                (1.21 * SizeConfig.widthMultiplier), //5
                0
            ),
            child:  Row(
              children: <Widget>[
                Text(
                  'Summary:',
                  style: TextStyle(
                      fontSize: (4.37 * SizeConfig.textMultiplier), // 18
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),

                Expanded(
                  child: Text(
                    '4/5',
                    style: TextStyle(
                        fontSize: (4.37 * SizeConfig.textMultiplier), // 18
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            )
        ),

        SizedBox(height: (1.29 * SizeConfig.heightMultiplier)), // 8

        SummaryTextWidget(
          text: this.book.summary,
        ),

        SizedBox(height: (1.29 * SizeConfig.heightMultiplier)), // 8

        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: (1.21 * SizeConfig.widthMultiplier), //5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.comment,
                  size: (6.08 * SizeConfig.imageSizeMultiplier), //25
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.book.getBookTotalNumberOfComments().toString() + " comentarios",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (2.05 * SizeConfig.textMultiplier), //14
                  ),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      child: SmallButtonUnderlined("View All"),
                      onTap: () async {
                        await Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => CommentPage.showingAllBookComments(this.book, inactiveAddCommentOption: true,)));
                      },
                    )
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  _getAuthorRelatedBooks(){
    return Column(
      key: UniqueKey(),
      children: <Widget>[
        Container(
          /*margin: EdgeInsets.fromLTRB(
            (1.21 * SizeConfig.widthMultiplier), //5
            (0.29 * SizeConfig.heightMultiplier), // 2
            (0.48 * SizeConfig.widthMultiplier), //2
            (0.29 * SizeConfig.heightMultiplier), // 2
          ),*/
          child:  Align(
            alignment: Alignment.topLeft,
            child: ListTitle(
              "More books of" + "Author X:",
              barAndTitleColor: Colors.black,
            ),
          ),
        ),

        Container(
          key: UniqueKey(),
          child: HorizontalBookList(Book.toLectureList(auxBooksForPrototype), ListType.normal),
        )
      ],
    );
  }

  _getGenreRelatedBooks(){
    return Column(
      key: UniqueKey(),
      children: <Widget>[
        Container(
          /*margin: EdgeInsets.fromLTRB(
            (1.21 * SizeConfig.widthMultiplier), //5
            (0.29 * SizeConfig.heightMultiplier), // 2
            (0.48 * SizeConfig.widthMultiplier), //2
            (0.29 * SizeConfig.heightMultiplier), // 2
          ),*/
          child:  Align(
            alignment: Alignment.topLeft,
            child: ListTitle(
                "More of X Genre:",
                barAndTitleColor: Colors.black,
              ),
            /*child: Text(
              "More of X Genre:",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),*/
          ),
        ),

        Container(
          key: UniqueKey(),
          child: HorizontalBookList(Book.toLectureList(auxBooksForPrototype), ListType.normal),
        )
      ],
    );
  }

  _initializeItems(width){
    double widthPerChild = (width - (7.29 * SizeConfig.widthMultiplier) - (4.86 * SizeConfig.widthMultiplier)) / 3;
    items = new List();
    items.add(_getBookCoverStack(width));
    items.add(_getBookTopRelatedButtons());
    items.add(_getPaddingContainer(width));
    items.add(_getBookInfoRow(widthPerChild));
    items.add(_getPaddingContainer(width));
    User user = Provider.of<User>(context, listen: false);
    if((book.friends_reading != null && book.friends_reading.length > 0) || user.isBookRecommended(book))
      items.add(_getFriendsPreview(user.isBookRecommended(book)));
    items.add(_getDescriptionSummary());
    items.add(_getAuthorRelatedBooks());
    items.add(_getGenreRelatedBooks());
  }

  _buildBookPage(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    _initializeItems(width);

    return ListView.builder(
      key: UniqueKey(),
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }

  _getFriendsPreview(bool isARecommendation){
    User user = Provider.of<User>(context, listen: false);
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
              (1.21 * SizeConfig.widthMultiplier), //5
              (0.29 * SizeConfig.heightMultiplier), //2
              (1.21 * SizeConfig.widthMultiplier), //5
              0
          ),
          child:  Text(
            isARecommendation ? 'Recommended by' : 'Added by:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),

        SizedBox(height: (1.29 * SizeConfig.heightMultiplier)), // 8

        FriendsPreview(isARecommendation ? user.getBookRecommenders(book) : book.friends_reading)
      ],
    );
  }

}

