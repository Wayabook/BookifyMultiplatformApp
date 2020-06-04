import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final String title;

  const BookPage(this.title) : assert(title != null);

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