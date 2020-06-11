import 'package:flutter/material.dart';


class ReadingPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ReadingPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
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

            Column(
              children: <Widget>[
                Text("GENDER"),
                Image.asset('images/genre1.png'),
                Text("Poetry"),
              ],
            ),


          ],
        ),
        appBar: AppBar(
          title: Text(this.text),
        ),
    );
  }
}