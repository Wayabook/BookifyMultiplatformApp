import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/Models/Item.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Pages/profile_page.dart';

class ShopItemCard extends StatelessWidget {

  Item item;
  ShopItemCard(this.item); // : super(key: key);

  //final List<User> users;
  /*final List<Book> readingBooks;
  final List<Book> pendingBooks;*/

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: new EdgeInsets.fromLTRB(0, 0, 15, 0),
      child:  Container(
        height: 100,
        child: _makeListTile(),
      ),
    );
  }

  _makeListTile() {
    final double circleRadius = 100.0;
    final double circleBorderWidth = 8.0;
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
                child: ProfilePicture("https://i.pinimg.com/280x280_RS/77/56/01/77560124a4abb4053f4f95c9153ef565.jpg"),
              ),

              Flexible(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    //color: Colors.black,
                    //height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child:  AutoSizeText(
                            "14.5",
                            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,),
                            maxLines: 1,
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child:  AutoSizeText(
                            "€",
                            style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,),
                            maxLines: 1,
                          ),
                        ),

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )
                      ],

                      /*AutoSizeText(
                        _chapter_title.substring(0, 18) + "...",
                        style: TextStyle( fontWeight: FontWeight.bold,),
                        maxLines: 1,
                      ),*/
                    ),

                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
