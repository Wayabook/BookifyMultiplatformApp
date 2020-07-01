import 'package:bookifyapp/Enums/list_type.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/friends_preview.dart';


class VerticalBookListSearch extends StatefulWidget {

  VerticalBookListSearch(this.books, this.type, {this.title}); // : super(key: key);

  final List<Book> books;
  final ListType type;
  final String title;
  /*final List<Book> readingBooks;
  final List<Book> pendingBooks;*/

  @override
  _VerticalBookListSearch createState() => _VerticalBookListSearch();
}

class _VerticalBookListSearch extends State<VerticalBookListSearch> {

  String _chapter_title = "2048 personas han guardado este libro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, //Color.fromRGBO(58, 66, 86, 1.0),
      body: _makeBody(),
    );
    /*if(widget.type == ListType.add_custom_list){
      return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(
          children: <Widget>[
            ListTitle("List Title"),
            _makeBody(),
          ],
        ),
      );
      //ListTitle(title)
    } else {
      return Scaffold(
        backgroundColor: Colors.blueGrey, //Color.fromRGBO(58, 66, 86, 1.0),
        body: _makeBody(),
      );
    }*/
  }

  _makeListTile(index) {
    if (widget.type == ListType.normal){
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
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
                                    right: new BorderSide(width: 1.0, color: Colors.blueGrey),
                                    left: new BorderSide(width: .075, color: Colors.blueGrey),
                                    bottom: new BorderSide(width: .075, color: Colors.blueGrey),
                                    top: new BorderSide(width: .075, color: Colors.blueGrey)
                                )
                            ),

                            child: Container(
                                color: Colors.black,
                                height: 150,
                                width: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.network(
                                      widget.books[index].picture
                                  ),
                                )
                            ) //Icon(Icons.autorenew, color: Colors.white),
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
                                  widget.books[index].title,
                                  style: TextStyle(
                                    //color: Colors.white,
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
                                widget.books[index].author,
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

                                        Icon(
                                          Icons.bookmark,
                                          color: Colors.blueGrey,
                                          size: 20,
                                        ),

                                        AutoSizeText(
                                          _chapter_title.substring(0, 18) + "...",
                                          style: TextStyle( fontWeight: FontWeight.bold,),
                                          maxLines: 1,
                                        ),

                                        /*AutoSizeText(
                                        "+ 28",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      ),*/
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
                            backgroundColor: Colors.white,
                            child: Icon(
                              //buttonType == ButtonType.read ?
                              //Icons.beenhere : Icons.arrow_drop_up,
                              Icons.add,
                              color: Colors.blueGrey,
                              size: 50,
                            ),
                          ),
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
              color: Colors.white,
              borderRadius:  BorderRadius.circular(7.0)
          ),//Color.fromRGBO(64, 75, 96, .9),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: _getFriendsPreview(index)
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
                                  widget.books[index].title,
                                  style: TextStyle(
                                    //color: Colors.white,
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
                                widget.books[index].author,
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

                                        Icon(
                                          Icons.bookmark,
                                          color: Colors.blueGrey,
                                          size: 20,
                                        ),

                                        AutoSizeText(
                                          _chapter_title.substring(0, 18) + "...",
                                          style: TextStyle( fontWeight: FontWeight.bold,),
                                          maxLines: 1,
                                        ),

                                        /*AutoSizeText(
                                        "+ 28",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      ),*/
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
                            backgroundColor: Colors.white,
                            child: Icon(
                              //buttonType == ButtonType.read ?
                              //Icons.beenhere : Icons.arrow_drop_up,
                              Icons.add,
                              color: Colors.blueGrey,
                              size: 50,
                            ),
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

  _getFriendsPreview(int index){
    if(widget.books[index].friends_reading != null  &&
        widget.books[index].friends_reading.length > 0){
      /*return Positioned(
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: FriendsPreview(widget.books[index].friends_reading),

        ),
      );*/
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
                        right: new BorderSide(width: 1.0, color: Colors.blueGrey),
                        left: new BorderSide(width: .075, color: Colors.blueGrey),
                        bottom: new BorderSide(width: .075, color: Colors.blueGrey),
                        top: new BorderSide(width: .075, color: Colors.blueGrey)
                    )
                ),

                child: Container(
                    color: Colors.black,
                    height: 150,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                          widget.books[index].picture
                      ),
                    )
                ) //Icon(Icons.autorenew, color: Colors.white),
            ),
          ),

          Positioned(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: FriendsPreview(widget.books[index].friends_reading),
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
                    right: new BorderSide(width: 1.0, color: Colors.blueGrey),
                    left: new BorderSide(width: .075, color: Colors.blueGrey),
                    bottom: new BorderSide(width: .075, color: Colors.blueGrey),
                    top: new BorderSide(width: .075, color: Colors.blueGrey)
                )
            ),

            child: Container(
                color: Colors.black,
                height: 150,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(
                      widget.books[index].picture
                  ),
                )
            ) //Icon(Icons.autorenew, color: Colors.white),
        ),
      );
    }
  }

  _makeCard(int index) {
    return  Card(
      /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),*/
      elevation: 10,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:  Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: _makeListTile(index),
      ),
    );
  }

  _makeBody() {
    if (widget.type == ListType.add_custom_list){
      return Stack(
        children: <Widget>[
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.books.length + 1,
              itemBuilder: (BuildContext context, int index) {
                  if(index == 0)
                    return ListTitle(widget.title);
                  return _makeCard(index - 1);
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 50,
              width:  MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: FlatButton(
                      child: Text(
                          "Accept",
                          style: TextStyle(color: Colors.blue,)
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: FlatButton(
                      child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red,)
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.books.length,
          itemBuilder: (BuildContext context, int index) {
            return _makeCard(index);
          },
        ),
      );
    }
  }

  /*_makeHeader(String title){
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
            child:  Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Container(color: Colors.white, height: 2, width: width),
          ),
        ],
      ),
    );
  }*/
}