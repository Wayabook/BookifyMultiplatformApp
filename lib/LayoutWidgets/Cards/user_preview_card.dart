
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPreviewCard extends StatelessWidget {

  User user;
  double height;
  double fontSize;
  bool card;

  UserPreviewCard(
      this.user,
      {
        this.height = 100,
        this.fontSize = 30,
        this.card = true
      });

  _makeListTile() {
    return Container(
        decoration: BoxDecoration(
            //color: Colors.black,
            borderRadius:  card ? BorderRadius.circular(7.0) : BorderRadius.circular(0.0)
        ),//Color.fromRGBO(64, 75, 96, .9),
        /*child: Padding(
            //padding:  EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          padding: card ? EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0) : EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: _getRow()
        )*/
        child: _getRow(),
    );
  }

  _getRow(){
    if(card){
      return Row(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ProfilePicture(user.profilePictureUrl,),
            ),
          ),

          Flexible(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                //color: Colors.black,
                //height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      user.name,
                      style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: this.fontSize,),
                      maxLines: 1,
                    ),
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
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfilePicture(
              user.profilePictureUrl,
            circleRadius: this.height,
            circleBorderWidth: 0.0,
          ),

          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              //color: Colors.black,
              //height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    user.name,
                    style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: this.fontSize,),
                    maxLines: 1,
                  ),
                ],

                /*AutoSizeText(
                        _chapter_title.substring(0, 18) + "...",
                        style: TextStyle( fontWeight: FontWeight.bold,),
                        maxLines: 1,
                      ),*/
              ),

            ),
          ),

        ],
      );


      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfilePicture("https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg",),
          /*Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              //color: Colors.black,
              //height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    user.name,
                    style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: this.fontSize,),
                    maxLines: 1,
                  ),
                ],
              ),

            ),
          ),*/
        ],
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    if (card) {
      return  Card(
        elevation: 10,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:  Container(
          height: this.height,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: _makeListTile(),
        ),
      );
    } else {
      return Container(
        height: this.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: _makeListTile(),
      );
    }
  }
}