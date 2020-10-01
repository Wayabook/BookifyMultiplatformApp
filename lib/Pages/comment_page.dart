import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/sub_comment_card.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:provider/provider.dart';

  class CommentPage extends StatefulWidget {

  bool subCommentsPage;
  MainComment mainComment;
  String chapterTitle;
  int chapterNumber;

  CommentPage(
      this.mainComment,
      {
        this.chapterNumber,
        this.subCommentsPage = true,
        this.chapterTitle = "",
      });

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
  User user;
  TextEditingController textEditingController;
  Color publishContainerColor;
  Color publishTextColor;

  @override
  void initState() {

    scrollController = new ScrollController();
    textEditingController = new TextEditingController();

    if(widget.subCommentsPage){

      comments = new List();
      subComments = new List();
      mainCommentCard = MainCommentCard(
        widget.mainComment,
        chapterTitle: widget.chapterTitle,
        chapterNumber: widget.chapterNumber,
        removeCommentFunction: removeComment,
        positionKey: 0,
      );
      comments.add(mainCommentCard);

      for(int i=0; i < widget.mainComment.answers.length; i++){
        Comment comment  = widget.mainComment.answers[i];
        subComments.add(
            SubCommentCard(
                comment,
                textEditingController: this.textEditingController,
                removeCommentFunction: removeComment,
                positionKey: (i + 1),
            )
        );
      }

      /*for(Comment comment in widget.mainComment.answers){
        subComments.add(
            SubCommentCard(
                comment,
                textEditingController: this.textEditingController
            )
        );
      }*/
      comments.addAll(subComments);

    } else {

      publishContainerColor = Colors.yellow[100];
      publishTextColor = Colors.grey[300];

    }

    _getTextField();
    super.initState();
  }

  _getTextField(){
    textField = TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          //border: InputBorder,
          hintText: widget.subCommentsPage ? 'Add Comment...' : widget.chapterTitle,
          floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      maxLines: null,
      expands: widget.subCommentsPage ? false : true,
      keyboardType: TextInputType.multiline,
      onChanged: (value){
        newComment = value;
        if(!widget.subCommentsPage){
          setState(() {
            publishContainerColor = Colors.yellow;
            publishTextColor = Colors.black;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.subCommentsPage){
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
        appBar: AppBar(title: Text(widget.subCommentsPage ?  widget.chapterTitle : 'Add Comment...')),
      );

    } else {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey,
          child: Column(
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
                          "PUBLICAR",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: publishTextColor,
                          ),
                        ),
                      )
                    ),
                    onTap: (){
                      Navigator.pop(context, newComment);
                    },
                  )
              ),
            ],
          ),
        ),
        appBar: AppBar(title: Text("Add comment")),
      );
    }
    //return  MainCommentCard(subComments: true,);
  }

  void removeComment(int key){
    if(key != 0){
      setState(() {
        comments.removeAt(key);
      });
    }
  }


  _addComment(){
    FocusScope.of(context).requestFocus(FocusNode());
    var user = Provider.of<User>(context, listen: false);
    SubCommentCard subCommentCard = SubCommentCard(
      new Comment(user, newComment),
      removeCommentFunction: removeComment,
      positionKey: this.comments.length,
    );
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
