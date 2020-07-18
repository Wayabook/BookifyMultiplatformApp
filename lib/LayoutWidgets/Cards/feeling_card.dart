import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeelingCard extends StatelessWidget {

  FeelingCard();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.all(10),
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
        elevation: 10,
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/genre1.png",
              height: 50,
              width: 50,
            ),

            Text("ANGRY",
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
    );
  }
}