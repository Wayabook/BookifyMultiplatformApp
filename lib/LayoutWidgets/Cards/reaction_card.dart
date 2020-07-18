import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReactionCard extends StatefulWidget {
  Reaction reaction;
  ReactionCard(this.reaction);

  @override
  _ReactionCard createState() => _ReactionCard();
}

class _ReactionCard extends State<ReactionCard> {
  bool tapped = false;
  String text = "";

  void changeText() {
    setState(() {
      if(tapped = false){
        tapped = true;
      }
      text = "99";
    });
  }

  @override
  Widget build(BuildContext context) {
    text = widget.reaction.name;
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          onTap: changeText,
          child:  Card(
              color: Colors.blueGrey,
              margin: EdgeInsets.all(10),
              /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    widget.reaction.image,
                    height: 50,
                    width: 50,
                  ),

                  /*Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              ),*/

                  Text(
                    "$text",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  ),
                ],
              )
          ),
        )
    );
  }
}