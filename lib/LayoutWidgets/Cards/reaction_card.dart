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
      if(tapped == false){
        tapped = true;
        text = widget.reaction.percentage.toString() + "%";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    text = widget.reaction.name;
    //color = Colors.transparent;
  }
  
  _getBorder(enabled){
    var width = 0.0;
    if(enabled)
      width = 2.0;
    
    return Border(
      top: BorderSide(color: Colors.white, width: width),
      bottom: BorderSide(color: Colors.white, width: width),
      left: BorderSide(color: Colors.white, width: width),
      right: BorderSide(color: Colors.white, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          onTap: changeText,
          child:  Card(
              color: Colors.blueGrey,
              margin: EdgeInsets.all(10),
              shape: tapped ? _getBorder(true) : _getBorder(false),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    widget.reaction.image,
                    height: 45,
                    width: 45,
                  ),

                  Text(
                    text,
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