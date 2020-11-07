import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/Pages/Profile/profile_page.dart';
import 'package:bookifyapp/Pages/reading_page.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import 'discover_page.dart';


class MainTabPage extends StatefulWidget {

  MainTabPage({Key key}) : super(key: key);

  @override
  _MainTabPage createState() => _MainTabPage();
}

class _MainTabPage extends State<MainTabPage> {

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.local_library),
      title: Text('Reading'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('Discover'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('Profile'),
    ),

  ];

  @override
  void initState(){

    super.initState();
  }

  changeCurrentIndex(int position){
    /*setState(() {
      _currentIndex = position;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          backgroundColor: Colors.white54,
          iconSize: (4.4 * SizeConfig.heightMultiplier),
        ),
      ),

      children: _getPages(),
      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }



  _getPages(){
    return [
      ReadingPage(),
      DiscoverPage(kPrimaryLightColor, "Discover Page"),
      ProfilePage(Provider.of<User>(context, listen: false), ProfileType.user_profile),
    ];
  }

}