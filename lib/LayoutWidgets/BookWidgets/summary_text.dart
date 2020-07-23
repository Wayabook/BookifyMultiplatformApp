import 'package:flutter/material.dart';

class SummaryTextWidget extends StatefulWidget {
  final String text;
  Color backgroundColor;

  SummaryTextWidget({@required this.text, this.backgroundColor = Colors.white});

  @override
  _SummaryTextWidgetState createState() => new _SummaryTextWidgetState();
}

class _SummaryTextWidgetState extends State<SummaryTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: widget.backgroundColor,
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf, textAlign: TextAlign.justify)
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf), textAlign: TextAlign.justify),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  flag ? "show more" : "show less",
                  style: new TextStyle(color: Colors.blue),
                ),

                Icon(
                  flag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                  size: 18.0,
                  color: Colors.blue,
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