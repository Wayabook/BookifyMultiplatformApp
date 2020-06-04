import 'package:flutter/material.dart';
import 'book_page.dart';


class DiscoverPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  DiscoverPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child:  new Column(
        children: <Widget>[
          Text(
            this.text,
            style: optionStyle,
          ),

          Center(
            child: FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BookPage("title")));
            },
            ),
          ),
      ])
    );
  }

  //Use the navigator like you usually do with .of(context) method
  _openBooksPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => BookPage("title")));

  // Exemple: https://github.com/ayham95/Custom-navigator/tree/master/custom_scaffold_example
}