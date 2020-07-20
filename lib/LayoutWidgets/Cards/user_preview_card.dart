
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPreviewCard extends StatelessWidget {

  User user;
  double height;
  UserPreviewCard(this.user, {height = 120});

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
                child: ProfilePicture("https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"),
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
                          style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,),
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
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      /*onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage(widget.users[index], ProfileType.friend_profile)));
      },*/
      child: Card(
        elevation: 10,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:  Container(
          height: this.height,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: _makeListTile(),
        ),
      ),
    );
  }
}