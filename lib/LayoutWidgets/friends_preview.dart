import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/book_page.dart';


class FriendsPreview extends StatelessWidget {

  //CarouselCard({Key key}) : super(key: key);
  List<User> friends_reading;
  FriendsPreview(this.friends_reading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      //color: Colors.white,
      child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/16152037?s=460&u=39193767252f6f4b1d95dd075081a151dca70131&v=4'), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/13257788?s=460&u=aaeef51a634fb1db0d1dc7337ec9e4515e9a314f&v=4'), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/35029261?s=460&u=c54ea4c26c7f0659c014f362e538d2927f567a4f&v=4'), // Provide your custom image
                ),
              ),
            ),

          ]

      ),
    );
  }
}

