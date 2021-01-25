import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Enums/row_type.dart';

class InfoRow extends StatelessWidget {

  RowType rowType;
  String title;
  String content;
  String subTitle;
  double width;
  double height;
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

  Widget _getTopPart(){
    return Align(
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
    );
  }

  Widget _getCenterPart() {
    if (this.rowType == RowType.image) {
      return Align(
        alignment: Alignment.center,
        child: Image.asset(
          this.content,
          height: (7.32 * SizeConfig.heightMultiplier), // 50
          width: (12.16 * SizeConfig.widthMultiplier), // 50
        ),
      );
    } else  if (this.rowType == RowType.icon_image) {
      return Align(
        alignment: Alignment.center,
        child: Icon(
          this.icon,
          color: color,
          size: (12.16 * SizeConfig.widthMultiplier), // 50
        ),
      );
    } else {
      return Align(
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
      );
    }
  }

  Widget _getBottomPart(){
    if (this.rowType == RowType.icon_image) {
      return  Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              (1.2 * SizeConfig.widthMultiplier), // 5
              (0.2 * SizeConfig.heightMultiplier), // 2
              (1.2 * SizeConfig.widthMultiplier), // 5
              0
          ),
          child: Container(
            child: Text(
              this.subTitle != null ?  this.subTitle : "0",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: color,
                  fontSize: (2.9 * SizeConfig.textMultiplier) // 20
              ),
            ),
          ),
        ),
      );
    } else {
      return  Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all((1.21 * SizeConfig.widthMultiplier)), // 5
          child: Container(
            child: Text(
              this.subTitle != null ?  this.subTitle : "0",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: (2.05 * SizeConfig.textMultiplier), // 14
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Center(
        child: Container(
          height: this.height,
          width: this.width,
          child: Column(
            children: <Widget>[
              _getTopPart(),

              _getCenterPart(),

              _getBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}