import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/Pages/ProfilePages/profile_page.dart';
import 'package:bookifyapp/Pages/ReadingPage/reading_page.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import 'DiscoverPage/discover_page.dart';

class MainTabPage extends StatefulWidget {
  MainTabPage({Key key}) : super(key: key);

  @override
  _MainTabPage createState() => _MainTabPage();
}

class _MainTabPage extends State<MainTabPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_library,
                color: index == 0 ? kSecondaryDarkColor : kThirdDarkColor,
              ),
              title: Text(
                READING_OPTION,
                style: TextStyle(
                    color: index == 0 ? kSecondaryDarkColor : kThirdDarkColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: index == 1 ? kSecondaryDarkColor : kThirdDarkColor,
              ),
              title: Text(
                DISCOVER_OPTION,
                style: TextStyle(
                    color: index == 1 ? kSecondaryDarkColor : kThirdDarkColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: index == 2 ? kSecondaryDarkColor : kThirdDarkColor,
              ),
              title: Text(
                PROFILE_OPTION,
                style: TextStyle(
                    color: index == 2 ? kSecondaryDarkColor : kThirdDarkColor),
              ),
            ),
          ],
          backgroundColor: Colors.white54,
          iconSize: (4.4 * SizeConfig.heightMultiplier),
        ),
      ),

      children: _getPages(),
      // Called when one of the [items] is tapped.
      onItemTap: (index) {
        setState(() {
          this.index = index;
        });
      },
    );
  }

  _getPages() {
    return [
      ReadingPage(),
      DiscoverPage(kPrimaryLightColor),
      ProfilePage(
          Provider.of<User>(context, listen: false), ProfileType.user_profile),
    ];
  }
}
