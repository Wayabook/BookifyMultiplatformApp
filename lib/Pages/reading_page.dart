import 'package:flutter/material.dart';


class ReadingPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ReadingPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child:  Text(
        this.text,
        style: optionStyle,
      ),
    );
  }
}