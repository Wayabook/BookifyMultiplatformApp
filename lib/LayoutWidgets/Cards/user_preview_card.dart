
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPreviewCard extends StatelessWidget {

  User user;
  double height;
  double fontSize;
  bool card;
  bool isAuthor;
  bool fromDialog;

  Function(int pos) removeComment;

  UserPreviewCard(
      this.user,
      {
        this.height = 100,
        this.fontSize = 30,
        this.card = true,
        this.isAuthor = false,
        this.fromDialog = true,
        this.removeComment
      });

  _makeListTile(BuildContext context) {
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
        child: _getRow(context),
    );
  }

  _getRow(BuildContext context){
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
        children: <Widget>[
          Flexible(
            flex: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: ProfilePicture(
                    user.profilePictureUrl,
                    circleRadius: this.height,
                    circleBorderWidth: 0.0,
                  ),
                ),

                Flexible(
                  flex: 6,
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
                ),
              ],
            )
          ),

          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: (this.isAuthor && this.fromDialog) ,
                maintainSize: false,
                maintainAnimation: false,
                maintainState: false,
                child:  IconButton(
                  onPressed: (){
                    _showDeleteAlertDialog(context);
                  },
                  icon: Icon(
                      Icons.close,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  _showDeleteAlertDialog(BuildContext context){
    Widget cancelButton = FlatButton(
      //color: Colors.redAccent,
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget acceptButton = FlatButton(
      child: Text(
        "Accept",
        style: TextStyle(color: Colors.red),
      ),
      onPressed:  () {
        this.removeComment(0);
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Delete Comment"),
      content: Text("Are you sure you want to delete this comment?"),
      actions: [
        cancelButton,
        acceptButton
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
          child: _makeListTile(context),
        ),
      );
    } else {
      User currentUser = Provider.of<User>(context, listen: false);
      this.isAuthor = currentUser.isEqual(this.user);
      return Container(
        height: this.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: _makeListTile(context),
      );
    }
  }
}