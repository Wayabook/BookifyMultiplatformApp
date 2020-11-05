import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';


class FriendsPreview extends StatelessWidget {

  final List<User> friendsReading;
  final String defaultUserUrl = 'https://cdn2.iconfinder.com/data/icons/user-interface-180/128/User-Interface-209-512.png';

  FriendsPreview(this.friendsReading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      child: _getCircleAvatars(),
    );
  }

  _getCircleAvatars(){
    if(friendsReading.length > 2) {
      var num = friendsReading.length - 2;
      return  Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: kPrimaryDarkColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.friendsReading[1].profilePictureUrl), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: kPrimaryDarkColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage:  NetworkImage(this.friendsReading[0].profilePictureUrl),
                  //backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/13257788?s=460&u=aaeef51a634fb1db0d1dc7337ec9e4515e9a314f&v=4'), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: kPrimaryDarkColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  child: Text("+" + num.toString()), // Provide your custom image
                ),
              ),
            ),

          ]
      );
    } else if (friendsReading.length == 2) {
      return  Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.defaultUserUrl), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage:  NetworkImage(this.friendsReading[0].profilePictureUrl),
                  //backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/13257788?s=460&u=aaeef51a634fb1db0d1dc7337ec9e4515e9a314f&v=4'), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.friendsReading[0].profilePictureUrl), // Provide your custom image
                ),
              ),
            ),

          ]
      );
    } else if (friendsReading.length == 1) {
      return  Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.defaultUserUrl), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.defaultUserUrl),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.friendsReading[0].profilePictureUrl), // Provide your custom image
                ),
              ),
            ),

          ]
      );
    }
  }

}

