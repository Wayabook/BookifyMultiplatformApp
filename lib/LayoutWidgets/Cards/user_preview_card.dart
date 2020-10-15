
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPreviewCard extends StatelessWidget {

  User user;
  double height;
  double fontSize;
  double padding;
  bool card;
  bool isAuthor;
  bool isFriend;
  bool fromDialog;



  Function(int pos) removeComment;

  UserPreviewCard(
      this.user,
      {
        this.height = 100,
        this.fontSize = 30,
        this.padding = 10,
        this.card = true,
        this.isAuthor = false,
        this.fromDialog = true,
        //this.isFriend = false,
        this.removeComment
      });

  _makeListTile(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius:  card ? BorderRadius.circular(7.0) : BorderRadius.circular(0.0)
        ),
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
              padding: EdgeInsets.all(this.padding),
              child: ProfilePicture(user.profilePictureUrl,),
            ),
          ),

          Flexible(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    //color: Colors.black,
                    //height: 150,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLightColor,
                            fontSize: this.fontSize,),
                          maxLines: 1,
                        ),
                      ),
                    )
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookshelfPage(this.user)),
                          );
                        },
                        child: SmallButtonUnderlined("View Bookshelf")
                      )

                      /*Text(
                        "View Bookshelf",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),*/
                    ),
                  )
                ],
              )
            ),
          ),

          /*Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RaisedButton(
                onPressed: () {
                  /*showDialog(
                    context: context,
                    builder: (BuildContext context) => BookShopsDialog(this.book),
                  );*/
                },
                textColor: Colors.white,
                color: isFriend ? Colors.lightGreen[500] : Colors.blueGrey[300],
                child: Text(
                  isFriend ? "Friend" : "Add Friend",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //color: Colors.blue,
                    //decoration: TextDecoration.underline,
                  ),
                ),
                /*child: IconButton(
                  icon: Icon(
                      Icons.shop_two,
                      color: Colors.white
                  ),

                ),*/
                //Icon(Icons.add_circle_outline),
              ),
            ),
          ),*/
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
            color: kPrimaryDarkColor,
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
          color: kPrimaryDarkColor,
        ),
        child: _makeListTile(context),
      );
    }
  }
}