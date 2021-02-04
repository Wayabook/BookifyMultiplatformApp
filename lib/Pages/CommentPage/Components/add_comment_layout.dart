import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/info_text.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';

class AddCommentLayout extends StatelessWidget {
  TextField textField;
  Color publishContainerColor;
  Color publishTextColor;
  String newComment;

  AddCommentLayout(this.textField, this.publishContainerColor,
      this.publishTextColor, this.newComment);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 9,
          child: Container(
            child: textField,
          ),
        ),
        Flexible(
            flex: 1,
            child: GestureDetector(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: publishContainerColor,
                  child: Center(
                    child: AutoSizeText(
                      PUBLISH_COMMENT,
                      style: TextStyle(
                        fontSize: (PADDING_FACTOR_30 *
                            SizeConfig.heightMultiplier), //30
                        fontWeight: FontWeight.bold,
                        color: publishTextColor,
                      ),
                    ),
                  )),
              onTap: () {
                Navigator.pop(context, newComment);
              },
            )),
      ],
    );
  }
}
