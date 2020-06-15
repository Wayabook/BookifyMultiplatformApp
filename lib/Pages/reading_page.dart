import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/search_page.dart';


class ReadingPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ReadingPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              color: color,
              child:  Text(
                this.text,
                style: optionStyle,
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(this.text),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: Icon(Icons.search)
            )
          ],
        ),
    );
  }
}