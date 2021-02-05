import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_user_list.dart';
import 'package:bookifyapp/Models/User.dart';

class FriendsPage extends StatefulWidget {
  FriendsPage(this.friends);

  List<User> friends;

  @override
  _FriendsPage createState() => _FriendsPage();
}

class _FriendsPage extends State<FriendsPage> {
  List<User> _friends = [];

  TextEditingController controller = new TextEditingController();

  String filter = "";
  String persons = "";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text(
    "Search...",
    style: TextStyle(color: kThirdDarkColor),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {
      _friends = widget.friends;
    });
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          filter = "";
          persons = "";
          _friends = widget.friends;
        });
      } else {
        setState(() {
          filter = controller.text;
          persons = controller.text;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((filter.isNotEmpty)) {
      List<User> tmpList = new List<User>();
      for (int i = 0; i < _friends.length; i++) {
        if (_friends[i].name.toLowerCase().contains(filter.toLowerCase())) {
          tmpList.add(_friends[i]);
        }
      }
      _friends = tmpList;
    }

    final appBody = Container(child: VerticalUserList(_friends));

    final appTopAppBar = AppBar(
      backgroundColor: kPrimaryDarkColor,
      elevation: 0.1,
      title: appBarTitle,
      iconTheme: IconThemeData(
        color: kThirdDarkColor, //change your color here
      ),
      actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          color: kThirdDarkColor,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                    hintText: SEARCH_BY_NAME + "...",
                    hintStyle: new TextStyle(color: kThirdDarkColor),
                  ),
                  style: new TextStyle(
                    color: kThirdDarkColor,
                  ),
                  autofocus: true,
                  cursorColor: kThirdDarkColor,
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text(
                  SEARCH_BY_NAME,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: kThirdDarkColor),
                );
                _friends = widget.friends;
                controller.clear();
              }
            });
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appTopAppBar,
      body: appBody,
    );
  }
}
