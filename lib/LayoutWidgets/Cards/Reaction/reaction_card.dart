import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

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
  }
  
  _getBorder(enabled){
    var width = 0.0;
    if(enabled)
      width = (0.48 * SizeConfig.imageSizeMultiplier); //2
    
    return Border(
      top: BorderSide(color: kPrimaryLightColor, width: width),
      bottom: BorderSide(color: kPrimaryLightColor, width: width),
      left: BorderSide(color: kPrimaryLightColor, width: width),
      right: BorderSide(color: kPrimaryLightColor, width: width),
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
              color: kPrimaryDarkColor,
              margin: EdgeInsets.all((2.43 * SizeConfig.widthMultiplier)), //10
              shape: tapped ? _getBorder(true) : _getBorder(false),
              elevation: (2.43 * SizeConfig.widthMultiplier), //10
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 8,
                    child: Image.asset(
                      widget.reaction.image,
                      height: (7.36 * SizeConfig.heightMultiplier), //45
                      width: (7.36 * SizeConfig.heightMultiplier), //45
                    ),
                  ),

                  Flexible(
                    flex: 2,
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kPrimaryLightColor,
                        fontSize: (1.29 * SizeConfig.heightMultiplier), //8
                      ),
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}