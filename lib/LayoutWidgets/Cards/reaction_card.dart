import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReactionCard extends StatelessWidget {
  Reaction reaction;
  ReactionCard(this.reaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
                this.reaction.image,
                height: 50,
                width: 50,
              ),

              /*Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              ),*/

              Text(this.reaction.name,
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
      )
    );
  }
}