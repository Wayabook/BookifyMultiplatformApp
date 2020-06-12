import 'package:flutter/material.dart';


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

            Container(color: Colors.blueGrey, height: 2, width: width,),

            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("GENDER"),
                    Image.asset(
                      'images/genre1.png',
                      height: 50,
                      width: 50,
                    ),
                    Text("Poetry"),
                  ],
                ),
                Container(color: Colors.blueGrey, height: 50, width: 2,),

                Column(
                  children: <Widget>[
                    Text("GENDER"),
                    Image.asset(
                      'images/genre1.png',
                      height: 50,
                      width: 50,
                    ),
                    Text("Poetry"),
                  ],
                ),
                Container(color: Colors.blueGrey, height: 50, width: 2,),

                Column(
                  children: <Widget>[
                    Text("GENDER"),
                    Image.asset(
                      'images/genre1.png',
                      height: 50,
                      width: 50,
                    ),
                    Text("Poetry"),
                  ],
                ),
              ],
            ),

            Container(color: Colors.blueGrey, height: 2, width: width,),


          ],
        ),
        appBar: AppBar(
          title: Text(this.text),
        ),
    );
  }
}