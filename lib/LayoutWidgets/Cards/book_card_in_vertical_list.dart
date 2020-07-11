import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Enums/button_type.dart';
//import  'package:explode_view/explode_view.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';


class BookCardInVerticalList extends StatelessWidget {

  String chapter_title = "Nombre capitulo";
  BuildContext context;
  ButtonType buttonType;
  Book book;

  BookCardInVerticalList(this.book, this.buttonType);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Card(
      elevation: 10,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:  Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: _makeListTile(),
      ),
    );
  }

  _makeListTile() {
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
                                    book.picture
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
                                book.title,
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
                              book.author,
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
                                        chapter_title.substring(0, 15) + "...",
                                        style: TextStyle( fontWeight: FontWeight.bold,),
                                        maxLines: 1,
                                      ),

                                      AutoSizeText(
                                        "+ 28",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      ),
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
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 3.0,
                          percent: .5,
                          center: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(
                              buttonType == ButtonType.read ?
                              Icons.beenhere : Icons.arrow_drop_up,
                              color: Colors.blueGrey,
                              size: 50,
                            ),
                          ),
                          progressColor: Colors.green,
                        ),
                        /*child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: Icon(
                            buttonType == ButtonType.read ?
                            Icons.beenhere : Icons.arrow_drop_up,
                            color: Colors.blueGrey,
                            size: 50,
                          ),
                        ),*/
                      )
                  )
              ),
            ],
          ),
        )
    );
  }
}