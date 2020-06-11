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

            InkWell(
              onTap: (){
                print("la verga");
              },
              child: Container(

                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Icon(
                    Icons.add,
                    color: Colors.black),
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: Text(this.text),
        ),
    );
  }
}