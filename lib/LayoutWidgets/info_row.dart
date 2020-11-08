import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Enums/row_type.dart';

class InfoRow extends StatelessWidget {
  final RowType rowType;
  final String title;
   String content;
  final String subTitle;
  final double width;
  final double height;
  IconData icon;
  Color color = Colors.black;

  InfoRow(
      this.rowType,
      this.title,
      this.content,
      this.subTitle,
      this.width,
      this.height
  );

  InfoRow.withIcon(
      this.rowType,
      this.title,
      this.icon,
      this.subTitle,
      this.width,
      this.height,
      this.color,
  );

  @override
  Widget build(BuildContext context) {

    if (this.rowType == RowType.image) {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Center(
          child: Container(
            height: this.height,
            width: this.width,
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), // 5
                    child: Container(
                      child: Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (2.05 * SizeConfig.textMultiplier), // 14
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
                    height: (7.32 * SizeConfig.heightMultiplier), // 50
                    width: (12.16 * SizeConfig.widthMultiplier), // 50
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), // 5
                    child: Container(
                      child: Text(
                        this.subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (2.05 * SizeConfig.textMultiplier), // 14
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
    } else if (this.rowType == RowType.icon_image){
      return Padding(
        padding: EdgeInsets.all(0),
        child: Center(
          child: Container(
            height: this.height,
            width: this.width,
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), // 5
                    child: Container(
                      child: Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (2.05 * SizeConfig.textMultiplier), // 14
                          fontWeight: FontWeight.bold,
                          color: this.color
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    this.icon,
                    color: color,
                    size: (12.16 * SizeConfig.widthMultiplier), // 50
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        (1.2 * SizeConfig.widthMultiplier), // 5
                        (0.2 * SizeConfig.heightMultiplier), // 2
                        (1.2 * SizeConfig.widthMultiplier), // 5
                        0
                    ),
                    child: Container(
                      child: Text(
                        this.subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: color,
                          fontSize: (2.9 * SizeConfig.textMultiplier) // 20
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
        padding: EdgeInsets.all(0),
        child: Center(
          child: Container(
            height: this.height,
            width: this.width,
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), //5
                    child: Container(
                      child: Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (2.05 * SizeConfig.textMultiplier), // 14
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), // 5
                    child: Text(
                      this.content,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (4.68 * SizeConfig.textMultiplier) // 32
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), // 5
                    child: Container(
                      child: Text(
                        this.subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (2.05 * SizeConfig.textMultiplier), // 14
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