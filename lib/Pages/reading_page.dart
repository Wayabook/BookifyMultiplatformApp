import 'package:flutter/material.dart';


class ReadingPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";


  ReadingPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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

            DescriptionTextWidget(text: description),
          ],
        ),
        appBar: AppBar(
          title: Text(this.text),
        ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
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

                /*
                 Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'more',
                  style: textTheme.body1
                  .copyWith(fontSize: 16.0, color: theme.accentColor),
                ),

                Icon(
                  Icons.keyboard_arrow_down,
                  size: 18.0,
                  color: theme.accentColor,
                ),
             ],
            ),
                * */
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