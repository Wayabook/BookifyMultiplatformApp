import 'package:flutter/material.dart';
import 'package:bookifyapp/Enums/row_type.dart';

class InfoRow extends StatelessWidget {
  final RowType rowType;
  final String title;
  final String content;
  final String subTitle;
  final double width;
  final double height;

  InfoRow(
      this.rowType,
      this.title,
      this.content,
      this.subTitle,
      this.width,
      this.height
  );

  @override
  Widget build(BuildContext context) {
    if (this.rowType == RowType.image){
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
          child: Container(
            height: this.height,
            width: this.width,
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Container(
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    this.content,
                    height: 50,
                    width: 50,
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Container(
                      child: Text(
                        this.subTitle,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
          child: Container(
            height: this.height,
            width: this.width,
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Container(
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    /*child: Container(
                      height: 50,
                      width: 50,
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),*/
                    child: Text(
                      this.content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Container(
                      child: Text(
                        this.subTitle,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}