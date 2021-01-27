import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';

import '../../Design/SizeConfig.dart';


class FriendsPreview extends StatelessWidget {

  final List<User> friendsReading;
  final String defaultUserUrl = 'https://cdn2.iconfinder.com/data/icons/user-interface-180/128/User-Interface-209-512.png';

  FriendsPreview(this.friendsReading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (PADDING_FACTOR_80 * SizeConfig.widthMultiplier), //80
      height: (PADDING_FACTOR_45 * SizeConfig.heightMultiplier), //45
      child: _getFriendsPreview(),
    );
  }


  _getCircleAvatarsWithImage(String url){
    return CircleAvatar(
      backgroundColor: kPrimaryDarkColor,
      radius: (TEXT_FACTOR_18 * SizeConfig.textMultiplier), //18
      child: CircleAvatar(
        radius: (TEXT_FACTOR_18 * SizeConfig.textMultiplier), //18
        backgroundColor: kPrimaryLightColor,
        backgroundImage: NetworkImage(url), // Provide your custom image
      ),
    );
  }

  _getCircleAvatarsWithNumber(String num){
    return CircleAvatar(
      backgroundColor: kPrimaryDarkColor,
      radius: (TEXT_FACTOR_18 * SizeConfig.textMultiplier), //18
      child: CircleAvatar(
        radius:  (TEXT_FACTOR_18 * SizeConfig.textMultiplier), //18
        backgroundColor: kPrimaryLightColor,
        child: Text(
          "+" + num,
          style: TextStyle(
            fontSize:  (TEXT_FACTOR_18 * SizeConfig.textMultiplier), //18
          ),
        ), // Provide your custom image
      ),
    );
  }

  _getFriendsPreview(){
    var num = friendsReading.length > 2 ? friendsReading.length - 2 : -1;

    Widget circle1 = friendsReading.length > 2 ? _getCircleAvatarsWithImage(this.friendsReading[1].profilePictureUrl) :
                                                 _getCircleAvatarsWithImage(this.defaultUserUrl);

    Widget circle2 = friendsReading.length == 1 ?  _getCircleAvatarsWithImage(this.defaultUserUrl):
                                                  _getCircleAvatarsWithImage(this.friendsReading[0].profilePictureUrl);

    Widget circle3 = friendsReading.length > 2 ? _getCircleAvatarsWithNumber(num.toString()) :
    ((friendsReading.length == 2) ? _getCircleAvatarsWithImage(this.friendsReading[1].profilePictureUrl) :
                                    _getCircleAvatarsWithImage(this.friendsReading[0].profilePictureUrl));


    return  Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: circle1
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      (PADDING_FACTOR_15 * SizeConfig.widthMultiplier), //15
                      (PADDING_FACTOR_0),
                      (PADDING_FACTOR_0),
                      (PADDING_FACTOR_0),
                  ),
                  child: circle2
              )
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      (PADDING_FACTOR_35 * SizeConfig.widthMultiplier), //30
                      (PADDING_FACTOR_0),
                      (PADDING_FACTOR_0),
                      (PADDING_FACTOR_0),
                  ),
                  child: circle3
              )
          ),

        ]
    );
  }

}

