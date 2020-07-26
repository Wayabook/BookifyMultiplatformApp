import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget{


  CommentPage();

  /*Dialog alertDialog;
  bool _firstTime = true;
  BuildContext context;
  double width;
  double height;*/



  @override
  Widget build(BuildContext context) {
    return  MainCommentCard(subComments: true,);
  }
}
