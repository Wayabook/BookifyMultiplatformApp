import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';

import '../SizeConfig.dart';


class FriendsPreview extends StatelessWidget {

  final List<User> friendsReading;
  final String defaultUserUrl = 'https://cdn2.iconfinder.com/data/icons/user-interface-180/128/User-Interface-209-512.png';

  FriendsPreview(this.friendsReading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (19.46 * SizeConfig.widthMultiplier), //80
      height: (7.36 * SizeConfig.heightMultiplier), //45
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
                radius: (4.37 * SizeConfig.textMultiplier), // 18
                child: CircleAvatar(
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.friendsReading[1].profilePictureUrl), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB((3.64 * SizeConfig.widthMultiplier), 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryDarkColor,
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  child: CircleAvatar(
                    radius: (4.37 * SizeConfig.textMultiplier), // 18
                    backgroundColor: kPrimaryLightColor,
                    backgroundImage:  NetworkImage(this.friendsReading[0].profilePictureUrl),
                    //backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/13257788?s=460&u=aaeef51a634fb1db0d1dc7337ec9e4515e9a314f&v=4'), // Provide your custom image
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB((8.75 * SizeConfig.widthMultiplier), 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryDarkColor,
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  child: CircleAvatar(
                    radius:  (4.37 * SizeConfig.textMultiplier), // 18
                    backgroundColor: kPrimaryLightColor,
                    child: Text(
                      "+" + num.toString(),
                      style: TextStyle(
                        fontSize:  (4.37 * SizeConfig.textMultiplier), // 18
                      ),
                    ), // Provide your custom image
                  ),
                ),
              )
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
                radius: (4.37 * SizeConfig.textMultiplier), // 18
                child: CircleAvatar(
                  radius:  (4.37 * SizeConfig.textMultiplier), // 18
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.defaultUserUrl), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB((3.64 * SizeConfig.widthMultiplier), 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryLightColor,
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  child: CircleAvatar(
                    radius: (4.37 * SizeConfig.textMultiplier), // 18
                    backgroundColor: kPrimaryLightColor,
                    backgroundImage:  NetworkImage(this.friendsReading[0].profilePictureUrl),
                    //backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/13257788?s=460&u=aaeef51a634fb1db0d1dc7337ec9e4515e9a314f&v=4'), // Provide your custom image
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB((8.75 * SizeConfig.widthMultiplier), 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryLightColor,
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  child: CircleAvatar(
                    radius: (4.37 * SizeConfig.textMultiplier), // 18
                    backgroundColor: kPrimaryLightColor,
                    backgroundImage:  NetworkImage(this.friendsReading[1].profilePictureUrl),
                    //backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/13257788?s=460&u=aaeef51a634fb1db0d1dc7337ec9e4515e9a314f&v=4'), // Provide your custom image
                  ),
                ),
              )
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
                radius: (4.37 * SizeConfig.textMultiplier), // 18
                child: CircleAvatar(
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  backgroundColor: kPrimaryLightColor,
                  backgroundImage: NetworkImage(this.defaultUserUrl), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB((3.64 * SizeConfig.widthMultiplier), 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryLightColor,
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  child: CircleAvatar(
                    radius: (4.37 * SizeConfig.textMultiplier), // 18
                    backgroundColor: kPrimaryLightColor,
                    backgroundImage: NetworkImage(this.defaultUserUrl),
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB((8.75 * SizeConfig.widthMultiplier), 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: kPrimaryLightColor,
                  radius: (4.37 * SizeConfig.textMultiplier), // 18
                  child: CircleAvatar(
                    radius: (4.37 * SizeConfig.textMultiplier), // 18
                    backgroundColor: kPrimaryLightColor,
                    backgroundImage: NetworkImage(this.friendsReading[0].profilePictureUrl), // Provide your custom image
                  ),
                ),
              )
            ),
          ]
      );
    }
  }

}

