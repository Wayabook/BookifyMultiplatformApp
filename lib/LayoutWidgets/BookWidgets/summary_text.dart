import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';

class SummaryTextWidget extends StatefulWidget {
  final String text;
  Color backgroundColor;

  SummaryTextWidget(
      {@required this.text, this.backgroundColor = kPrimaryLightColor});

  @override
  _SummaryTextWidgetState createState() => new _SummaryTextWidgetState();
}

class _SummaryTextWidgetState extends State<SummaryTextWidget> {
  static const DEFAULT_TEXT_LENGTH = 50;
  static const INIT_TEXT_LENGTH = 0;

  String firstHalf;
  String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > DEFAULT_TEXT_LENGTH) {
      firstHalf = widget.text.substring(INIT_TEXT_LENGTH, DEFAULT_TEXT_LENGTH);
      secondHalf =
          widget.text.substring(DEFAULT_TEXT_LENGTH, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: widget.backgroundColor,
      padding: new EdgeInsets.symmetric(
        horizontal: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
        vertical: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
      ),
      child: secondHalf.isEmpty
          ? new SizedBox(
              width: double.infinity,
              child: Text(firstHalf,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier),
                  )),
            )
          : new Column(
              children: <Widget>[
                new Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: (TEXT_FACTOR_14 * SizeConfig.textMultiplier), //14
                  ),
                ),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? SHOW_MORE : SHOW_LESS,
                        style: new TextStyle(
                          color: smallUnderlinedButtonColor,
                          fontSize: (2.94 * SizeConfig.textMultiplier), //18
                        ),
                      ),
                      Icon(
                        flag
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: (2.94 * SizeConfig.textMultiplier), //18
                        color: smallUnderlinedButtonColor,
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
