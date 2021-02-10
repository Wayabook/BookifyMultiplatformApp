import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/abstract_markable_card.dart';
import 'package:bookifyapp/Models/Reaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import '../../../Design/SizeConfig.dart';

class ReactionCard extends StatefulWidget {
  static const String PERCENTAGE_SYMBOL = "%";
  Reaction reaction;
  ReactionCard(this.reaction);

  @override
  _ReactionCard createState() => _ReactionCard();
}

class _ReactionCard extends State<ReactionCard> with AbstractMarkableCard {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: changeText,
        child: getCard(
            tapped,
            kGreenLightColor,
            kSecondaryLightColor,
            text,
            widget.reaction.reactionIcon,
            (PADDING_FACTOR_8 * SizeConfig.heightMultiplier),
            (PADDING_FACTOR_45 * SizeConfig.heightMultiplier),
            (PADDING_FACTOR_45 * SizeConfig.heightMultiplier),
            card: true));
  }
}
