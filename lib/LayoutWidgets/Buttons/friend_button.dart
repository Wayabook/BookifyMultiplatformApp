import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_accept_and_cancel_options.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FriendButton extends StatefulWidget {
  User user;
  ProfileType profileType;
  bool isFriend;
  double width;

  FriendButton(this.user, this.profileType, this.isFriend, this.width);

  @override
  _FriendButton createState() => _FriendButton();
}

class _FriendButton extends State<FriendButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.profileType == ProfileType.friend_profile) {
      return _getColumnButton();
    } else {
      return _getSimpleContainer();
    }
  }

  _onFriendButtonPressed() async {
    if (widget.isFriend) {
      int result = await showDialog(
        context: context,
        builder: (BuildContext context) => DialogWithAcceptAndCancelOptions(
            DELETE_FRIEND,
            DELETE_FRIEND_CONFIRMATION,
            TextStyle(
              color: Colors.red,
            ),
            TextStyle(
              color: Colors.blue,
            )),
      );
      if (result == DialogWithAcceptAndCancelOptions.ACCEPT_TAP) {
        User user = Provider.of<User>(context, listen: false);
        user.removeFriend(widget.user);
        setState(() {
          widget.isFriend = !widget.isFriend;
        });
      }
    } else {
      User user = Provider.of<User>(context, listen: false);
      user.addFriend(widget.user);
      setState(() {
        widget.isFriend = !widget.isFriend;
      });
    }
  }

  _getColumnButton() {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              height: (CONTAINER_FACTOR_35 * SizeConfig.heightMultiplier),
              minWidth: (CONTAINER_FACTOR_90 * SizeConfig.widthMultiplier),
              child: RaisedButton(
                onPressed: () async {
                  _onFriendButtonPressed();
                },
                textColor: kPrimaryLightColor,
                color: widget.isFriend
                    ? Colors.lightGreen[500]
                    : Colors.blueGrey[300],
                child: Text(
                  widget.isFriend ? FRIEND : ADD_FRIEND,
                  style: TextStyle(
                    fontSize:
                        (TEXT_FACTOR_14 * SizeConfig.textMultiplier), // 14
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(
                (PADDING_FACTOR_0),
                (PADDING_FACTOR_7 * SizeConfig.heightMultiplier),
                (PADDING_FACTOR_0),
                (PADDING_FACTOR_0)),
            child: Container(
                margin: EdgeInsets.fromLTRB(
                    (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                    (PADDING_FACTOR_0),
                    (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
                    (PADDING_FACTOR_0)),
                color: kThirdDarkColor,
                height: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
                width: widget.width))
      ],
    );
  }

  _getSimpleContainer() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
            (PADDING_FACTOR_0),
            (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
            (PADDING_FACTOR_0)),
        color: kThirdDarkColor,
        height: (CONTAINER_FACTOR_2 * SizeConfig.widthMultiplier), //2
        width: widget.width);
  }
}
