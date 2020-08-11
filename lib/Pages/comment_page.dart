import 'dart:async';

import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/sub_comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CommentPage extends StatefulWidget {


  CommentPage();

/*Dialog alertDialog;
  bool _firstTime = true;
  BuildContext context;
  double width;
  double height;*/

  @override
  _CommentPage createState() => _CommentPage();
}

class _CommentPage extends State<CommentPage>{

  List<Widget> comments;
  List<SubCommentCard> subComments;
  MainCommentCard mainCommentCard;
  TextField textField;
  String newComment;
  ScrollController scrollController;

  @override
  void initState() {

    scrollController = new ScrollController();
    comments = new List();

    mainCommentCard = MainCommentCard();
    subComments = new List();
    subComments.add(new SubCommentCard());
    subComments.add(new SubCommentCard());
    subComments.add(new SubCommentCard());
    subComments.add(new SubCommentCard());
    subComments.add(new SubCommentCard());

    comments.add(mainCommentCard);
    comments.addAll(subComments);

    _getTextField();
    super.initState();
  }

  _getTextField(){
    textField = TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          //border: InputBorder,
          hintText: 'Add Comment...',
          floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      onChanged: (value){
        newComment = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //child:  _createListView(),
        child: Column(
          children: [
            Flexible(
              flex: 9,
              child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: this.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return this.comments[index];
                  }
              ),
            ),


            Flexible(
              flex: 0,
              child: Card(
                color: Colors.blueGrey,
                //margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Row(
                  children: [
                    Flexible(
                      flex: 9,
                      child: textField,
                    ),

                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        child: Icon(
                          Icons.send,
                          color: Colors.yellow,
                          size: 30,
                        ),
                        onTap: _addComment,
                      )
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text("01 : Chapter name")),
    );
    //return  MainCommentCard(subComments: true,);
  }


  _addComment(){
    FocusScope.of(context).requestFocus(FocusNode());
    SubCommentCard subCommentCard = SubCommentCard(text: newComment,);
    setState(() {
      this.comments.add(subCommentCard);
    });
    _scrollToLastPosition();

  }

  _scrollToLastPosition(){
    Timer(
      Duration(seconds: 1),
          () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
  }
}
