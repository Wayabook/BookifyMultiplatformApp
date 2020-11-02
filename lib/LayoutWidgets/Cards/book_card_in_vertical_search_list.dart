

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:bookifyapp/Models/Shop.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../InfoToast.dart';
import '../friends_preview.dart';

class BookCardInVerticalSearchList extends StatefulWidget{

  Book book;
  final ListType type;
  String listTitle;
  Function(Book book, bool add) addOrRemoveBookFromTemporalCustomList;
  String _addedBy = " personas han guardado este libro";
  Color backgroundColor;
  double cardHeight;

  BookCardInVerticalSearchList(
      this.book,
      this.type,
  {
    this.addOrRemoveBookFromTemporalCustomList,
    this.listTitle = "",
    this.backgroundColor = kPrimaryDarkColor,
    this.cardHeight = 160
  }
  );

  @override
  _BookCardInVerticalSearchList createState() => _BookCardInVerticalSearchList();
}

class _BookCardInVerticalSearchList extends State<BookCardInVerticalSearchList>{

  User user;
  IconData iconData;
  Color buttonColor;
  bool isInPendingList;
  bool isInReadingList;
  bool added;

  @override
  void initState() {
    super.initState();


    user = Provider.of<User>(context, listen: false);
    if (widget.type == ListType.first_time_form || widget.type == ListType.recommendation_form){
      added = false;
      iconData = added ? Icons.check : Icons.add;
      buttonColor = added ? Colors.green : kPrimaryDarkColor;
    } else if(widget.type != ListType.add_custom_list && widget.type != ListType.edit_custom_list && widget.type != ListType.first_time_form) {
      isInPendingList = user.isInPendingList(widget.book.toLecture());
      isInReadingList = user.isInReadingList(widget.book.toLecture());

      if (isInPendingList || isInReadingList) {
        iconData = Icons.check;
        buttonColor = isInReadingList ? Colors.green : kPrimaryDarkColor;
      } else {
        iconData = Icons.add;
        buttonColor = kPrimaryDarkColor;
      }
    } else {
      added = user.isLectureInList(widget.book.toLecture(), widget.listTitle);
      iconData = added ? Icons.check : Icons.add;
      buttonColor = added ? Colors.green : kPrimaryDarkColor;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:  Container(
        height: widget.cardHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
        ),
        child: _makeListTile(),
      ),
    );
  }

  _makeListTile() {
    if (widget.type == ListType.normal){
      return Container(
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius:  BorderRadius.circular(7.0)
          ),//Color.fromRGBO(64, 75, 96, .9),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 9,
                        child: Container(
                          width: 90,
                          //padding: EdgeInsets.only(right: 12.0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(width: 1.0, color: kPrimaryDarkColor),
                                  left: new BorderSide(width: .075, color: kPrimaryDarkColor),
                                  bottom: new BorderSide(width: .075, color: kPrimaryDarkColor),
                                  top: new BorderSide(width: .075, color: kPrimaryDarkColor)
                              )
                          ),

                          child: Container(
                              color: Colors.black,
                              height: 150,
                              width: double.infinity,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: GestureDetector(
                                    onTap: (){
                                    },
                                    child: Image.network(
                                      widget.book.picture,

                                    ),
                                  )
                              )
                          ),
                        ),
                      ),

                      Flexible(
                          flex: 1,
                          child: Center(
                            child: LinearPercentIndicator(
                              //width: //150.0,
                              lineHeight: 5.0,
                              percent: 0.5,
                              progressColor: Colors.lightGreen,
                            ),
                          )
                      )
                    ],
                  ),
                ),

                /*onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => BookPage("title", widget.books[index],
                              _getBooks())));
                    },*/
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      //color: Colors.black,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Container(
                                child: Text(
                                  widget.book.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Text(
                                widget.book.author,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 4,
                            child:  Align(
                                alignment: Alignment.bottomCenter,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[

                                        Flexible(
                                          flex: 3,
                                          child: Icon(
                                            Icons.bookmark,
                                            color: kPrimaryDarkColor,
                                            size: 20,
                                          ),
                                        ),

                                        Flexible(
                                          flex: 7,
                                          child: AutoSizeText(
                                            (widget.book.addedByNumberOfPeople.toString() + widget._addedBy),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle( fontWeight: FontWeight.bold,),
                                            maxLines: 1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Flexible(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 75,
                          width: 75,
                          child: _getFloatingActionButton(widget.book),
                        )
                    )
                ),
              ],
            ),
          )
      );

    } else if (widget.type == ListType.preview_friends){
      return Container(
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius:  BorderRadius.circular(7.0)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: _getFriendsPreview()
                ),

                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      //color: Colors.black,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Container(
                                child: Text(
                                  widget.book.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Text(
                                widget.book.author,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 4,
                            child:  Align(
                                alignment: Alignment.bottomCenter,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[

                                        Flexible(
                                          flex: 3,
                                          child: Icon(
                                            Icons.bookmark,
                                            color: kPrimaryDarkColor,
                                            size: 20,
                                          ),
                                        ),

                                        Flexible(
                                          flex: 7,
                                          child: AutoSizeText(
                                            (widget.book.addedByNumberOfPeople.toString() + widget._addedBy),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle( fontWeight: FontWeight.bold,),
                                            maxLines: 1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Flexible(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 75,
                          width: 75,
                          child: _getFloatingActionButton(widget.book),
                        )
                    )
                ),
              ],
            ),
          )
      );
    } else if (widget.type == ListType.add_custom_list ||
        widget.type == ListType.edit_custom_list ||
        widget.type == ListType.first_time_form ||
        widget.type == ListType.recommendation_form){


      return Container(
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius:  BorderRadius.circular(7.0)
          ),//Color.fromRGBO(64, 75, 96, .9),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: _getFriendsPreview()
                ),

                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      //color: Colors.black,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Container(
                                child: Text(
                                  widget.book.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Text(
                                widget.book.author,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 4,
                            child:  Align(
                                alignment: Alignment.bottomCenter,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[

                                        Flexible(
                                          flex: 3,
                                          child: Icon(
                                            Icons.bookmark,
                                            color: kPrimaryDarkColor,
                                            size: 20,
                                          ),
                                        ),

                                        Flexible(
                                          flex: 7,
                                          child: AutoSizeText(
                                            (widget.book.addedByNumberOfPeople.toString() + widget._addedBy),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle( fontWeight: FontWeight.bold,),
                                            maxLines: 1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Flexible(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 75,
                          width: 75,
                          child: FloatingActionButton(
                            heroTag: UniqueKey(),
                            backgroundColor: kPrimaryLightColor,
                            child: Icon(
                              iconData,
                              color: buttonColor,
                              size: 50,
                            ),
                            onPressed: () {
                              setState(() {
                                added = !added;
                                if(added){
                                  iconData = Icons.check;
                                  buttonColor = Colors.green;
                                } else {
                                  iconData = Icons.add;
                                  buttonColor = kPrimaryDarkColor;
                                }
                                widget.addOrRemoveBookFromTemporalCustomList(widget.book, added);
                              });
                            },
                          ),
                        )
                    )
                ),
              ],
            ),
          )
      );
    }
  }

  _getFriendsPreview(){
    if(widget.book.friends_reading != null  &&
        widget.book.friends_reading.length > 0){

      return Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Container(
                width: 90,
                //padding: EdgeInsets.only(right: 12.0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: kPrimaryDarkColor),
                        left: new BorderSide(width: .075, color: kPrimaryDarkColor),
                        bottom: new BorderSide(width: .075, color: kPrimaryDarkColor),
                        top: new BorderSide(width: .075, color: kPrimaryDarkColor)
                    )
                ),

                child: Container(
                    color: Colors.black,
                    height: 150,
                    width: double.infinity,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                builder: (context) => BookPage("title", widget.book,
                                    _getBooks())));
                          },
                          child: Image.network(
                            widget.book.picture,

                          ),
                        )
                    )
                )
            ),
          ),

          Positioned(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: FriendsPreview(widget.book.friends_reading),
              )
          ),
        ],
      );

    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Container(
            width: 90,
            //padding: EdgeInsets.only(right: 12.0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: kPrimaryDarkColor),
                    left: new BorderSide(width: .075, color: kPrimaryDarkColor),
                    bottom: new BorderSide(width: .075, color: kPrimaryDarkColor),
                    top: new BorderSide(width: .075, color: kPrimaryDarkColor)
                )
            ),

            child: Container(
                color: Colors.black,
                height: 150,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(
                      widget.book.picture
                  ),
                )
            )
        ),
      );
    }
  }

  _getFloatingActionButton(Book book) {
    List<String> heroes = (book.title + book.author + book.chapters.length.toString()).split(' ');
    heroes.shuffle();
    return FloatingActionButton(
      heroTag: heroes.join(','),
      backgroundColor: kPrimaryLightColor,
      child: Icon(
        iconData,
        color: buttonColor,
        size: 50,
      ),
      onPressed: () {
        setState(() {
          if(!isInReadingList){
            if(!isInPendingList){
              setState(() {
                var user = Provider.of<User>(context, listen: false);
                user.addLectureToPendingList(widget.book.toLecture());

                iconData = Icons.check;
                InfoToast.showBookAddedCorrectlyToast(widget.book.title);
              });
            } else {
              var user = Provider.of<User>(context, listen: false);
              user.removeLectureFromPendingList(widget.book.toLecture());

              iconData = Icons.add;
              InfoToast.showBookRemovedCorrectlyToast(widget.book.title);
            }
            isInPendingList = !isInPendingList;
          }
        });
      },
    );
  }

  List<Book> _getBooks(){
   return Book.getAppMockBooks();
  }
}