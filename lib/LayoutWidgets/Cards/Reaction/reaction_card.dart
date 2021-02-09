import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Design/SizeConfig.dart';

class ReactionCard extends StatefulWidget {
  static const String PERCENTAGE_SYMBOL = "%";
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
      if (tapped == false) {
        tapped = true;
        text = widget.reaction.percentage.toString() +
            ReactionCard.PERCENTAGE_SYMBOL;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    text = widget.reaction.name;
  }

  _getBorder(enabled) {
    var width = enabled
        ? (CONTAINER_FACTOR_2 * SizeConfig.imageSizeMultiplier)
        : 0.0; //2

    return Border(
      top: BorderSide(color: kSecondaryDarkColor, width: width),
      bottom: BorderSide(color: kSecondaryDarkColor, width: width),
      left: BorderSide(color: kSecondaryDarkColor, width: width),
      right: BorderSide(color: kSecondaryDarkColor, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          onTap: changeText,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Card(
                color: kPrimaryDarkColor,
                margin: EdgeInsets.all(
                    (PADDING_FACTOR_10 * SizeConfig.widthMultiplier)), //10
                shape: tapped ? _getBorder(true) : _getBorder(false),
                elevation:
                    (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 8,
                      child: Image.asset(
                        widget.reaction.reactionIcon,
                        height: (PADDING_FACTOR_45 *
                            SizeConfig.heightMultiplier), //45
                        width: (PADDING_FACTOR_45 *
                            SizeConfig.heightMultiplier), //45
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kThirdDarkColor,
                          fontSize: (PADDING_FACTOR_8 *
                              SizeConfig.heightMultiplier), //8
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
