import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
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

import '../InfoToast.dart';
import '../Models/User.dart';
import 'comment_page.dart';


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
      body: Container(
        child: _buildBookPage(context),
      ),
      appBar: AppBar(
          backgroundColor: kPrimaryDarkColor,
          title: Text(
              'Details of $title',
              overflow: TextOverflow.ellipsis,
          ),
      ),
    );
  }

  _buildBookPage(BuildContext context){

    double width = MediaQuery.of(context).size.width;
    double width_per_child = (width - 30 - (10 * 2)) / 3;
    return ListView(
      children: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140.0),
              child: ArcBannerImage(this.book.picture),
            ),

            Positioned(
              bottom: 30.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BookCover(
                    book,
                    height: 180.0,
                  ),
                ],
              ),
            ),
          ],
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                        topLeft: Radius.circular(25.0),
                      )
                  ),
                  color: addIconBackgroundColor,
                  child: IconButton(
                    icon: Icon(
                      addIcon,
                      color: addIconColor
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => BookShopsDialog(this.book, this),
                    );
                  },
                  color: kPrimaryDarkColor,
                  child: IconButton(
                    icon: Icon(
                      Icons.shop_two,
                      color: kPrimaryLightColor
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => ChaptersPage(this.book),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        )
                  ),
                  color: kPrimaryDarkColor,
                  child: IconButton(
                    icon:Icon(
                        Icons.list,
                        color: kPrimaryLightColor
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: kPrimaryDarkColor, height: 2, width: width),
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              InfoRow(RowType.image,  "GENDER", "images/genre1.png",  "Romance", width_per_child, 105),

              Container(color: kPrimaryDarkColor, height: 105, width: 2,),

              InfoRow(RowType.text,  "PUBLICATION", "2017",  "Year", width_per_child, 105),

              Container(color: kPrimaryDarkColor, height: 105, width: 2,),

              InfoRow(RowType.text,  "EXTENSION", "128",  "Pages", width_per_child, 105),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: kPrimaryDarkColor, height: 2, width: width),
        ),

        _getFriendsPreview(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //color: Colors.black,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 2, 5, 0),
              child:  Row(
                children: <Widget>[
                  Text(
                    'Summary:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),

                  Expanded(
                    child: Text(
                      '4/5',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              )
            ),

            SizedBox(height: 8.0),

            SummaryTextWidget(
              text: this.book.summary,
            ),

            SizedBox(height: 8.0),

            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.comment,
                      size: 25,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      widget.book.getBookTotalNumberOfComments().toString() + " comentarios",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: SmallButtonUnderlined("View All"),
                        onTap: () async {
                          final String result = await Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => CommentPage.showingAllBookComments(this.book, inactiveAddCommentOption: true,)));
                        },
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        ),

        Column(
          children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5, 2, 2, 2),
            child:  Align(
              alignment: Alignment.topLeft,
              child: Text(
                "More books of" + "Author X:",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
            ),
          ),

          HorizontalBookList(Book.toLectureList(auxBooksForPrototype), ListType.normal),
          ],
        ),

        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(5, 2, 2, 2),
              child:  Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "More of X Genre:",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            HorizontalBookList(Book.toLectureList(auxBooksForPrototype), ListType.normal),
          ],
        ),

      ],
    );
  }

  _getFriendsPreview(){
    //FriendsPreview(book.friends_reading),
    if(book.friends_reading != null && book.friends_reading.length > 0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //color: Colors.black,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 2, 5, 0),
              child:  Text(
                'Added by:',

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
          ),

          SizedBox(height: 8.0),

          FriendsPreview(book.friends_reading)
        ],
      );
    }
  }

}

