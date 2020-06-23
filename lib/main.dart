// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'Pages/discover_page.dart';
import 'Pages/profile_page.dart';
import 'Pages/reading_page.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = [
    ReadingPage(Colors.white, "Reading Page"),
    DiscoverPage(Colors.white, "Discover Page"),
    ProfilePage(Colors.white, "Profile Page")
  ];

  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }*/

  /*@override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('BottomNavigationBar Sample'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
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
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
      ),
      children: _widgetOptions,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // Here's the custom scaffold widget
    // It takes a normal scaffold with mandatory bottom navigation bar
    // and children who are your pages
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),

      // Children are the pages that will be shown by every click
      // They should placed in order such as
      // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
      children: _widgetOptions,

      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }

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

}

class Page extends StatelessWidget {
  final String title;

  const Page(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text(title);

    return Scaffold(
      body: Container(
        child: Center(
            child: FlatButton(
                onPressed: () => _openDetailsPage(context), child: text)),
      ),
      appBar: AppBar(
        title: text,
      ),
    );
  }

  //Use the navigator like you usually do with .of(context) method
  _openDetailsPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

//  _openDetailsPage(BuildContext context) => mainNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

}

class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Scaffold(
      body: Container(
        child: Center(child: text),
      ),
      appBar: AppBar(title: text),
    );
  }
}
