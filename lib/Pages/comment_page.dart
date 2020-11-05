import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Interfaces/RemoveCommentInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/sub_comment_card.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Chapter.dart';
import 'package:bookifyapp/Models/MainComment.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bookifyapp/Models/Comment.dart';
import 'package:provider/provider.dart';

import '../InfoToast.dart';

  class CommentPage extends StatefulWidget {

  bool subCommentsPage;
  bool inactiveAddCommentOption;
  MainComment mainComment;
  String chapterTitle;
  int chapterNumber;
  Book book;
  bool showAllCommentsOfChapter;

  CommentPage(
      this.mainComment,
      {
        this.chapterNumber,
        this.subCommentsPage = true,
        this.inactiveAddCommentOption = false,
        this.chapterTitle = "",
        this.showAllCommentsOfChapter = false,
      }
  );

  CommentPage.showingAllBookComments(this.book,
  {
    this.chapterNumber,
    this.subCommentsPage = true,
    this.chapterTitle = "",
    this.showAllCommentsOfChapter = false,
    this.inactiveAddCommentOption = false,
  }
  );

  @override
  _CommentPage createState() => _CommentPage();
}

class _CommentPage
    extends State<CommentPage>
    implements RemoveCommentInterface{

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
    comments = new List();
    subComments = new List();

    if(widget.mainComment != null){
      if(widget.subCommentsPage){

        mainCommentCard = MainCommentCard(
          widget.mainComment,
          chapterTitle: widget.chapterTitle,
          chapterNumber: widget.chapterNumber,
          removeCommentFunction: removeComment,
          positionKey: 0,
          seeAllComments: widget.inactiveAddCommentOption,
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
        comments.addAll(subComments);
      }
    } else {
      int position = 0;
      int chapterNumber = 0;
      if(widget.book != null){
        if(widget.showAllCommentsOfChapter){
          Chapter chapter = widget.book.chapters[widget.chapterNumber];
          for(Comment comment in chapter.comments){
            comments.add(MainCommentCard(
              comment,
              fromDialog: true,
              chapterTitle: chapter.title,
              chapterNumber: chapterNumber,
              removeCommentFunction: removeComment,
              positionKey: position,
              seeAllComments: widget.inactiveAddCommentOption,
            ));
            position += 1;
            chapterNumber += 1;
          }
        } else {
          for(Chapter chapter in widget.book.chapters){
            for(Comment comment in chapter.comments){
              comments.add(MainCommentCard(
                comment,
                fromDialog: true,
                chapterTitle: chapter.title,
                chapterNumber: chapterNumber,
                removeCommentFunction: removeComment,
                positionKey: position,
                seeAllComments: widget.inactiveAddCommentOption,
              ));
              position += 1;
              chapterNumber += 1;
            }
          }
        }
      } else {
        publishContainerColor = Colors.yellow[100];
        publishTextColor = Colors.grey[300];
      }
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

  _getSubcommentsListView(){
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: this.comments.length,
        itemBuilder: (BuildContext context, int index) {
          return this.comments[index];
        }
    );
  }

  _getColumnWithListViewAndAddCommentOption(){
    return Column(
      children: [
        Flexible(
          flex: 9,
          child: _getSubcommentsListView(),
        ),

        Flexible(
            flex: 0,
            child: Card(
              color: kPrimaryDarkColor,
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
    );
  }

  @override
  Widget build(BuildContext context) {
   if(widget.mainComment != null){
     if(widget.subCommentsPage){
       return Scaffold(
         body: Container(
           color: kPrimaryDarkColor,
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           child: widget.inactiveAddCommentOption ? _getSubcommentsListView() : _getColumnWithListViewAndAddCommentOption(),
         ),
         appBar: AppBar(
             backgroundColor: kPrimaryDarkColor,
             title: Text(widget.subCommentsPage ?  widget.chapterTitle : 'Add Comment...')
         ),
       );
     } /*else {

     }*/
   } else {
     if(widget.book != null){
       return Scaffold(
         body: Container(
           color: kPrimaryDarkColor,
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
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
         appBar: AppBar(
             backgroundColor: kPrimaryDarkColor,
             title: Text((
               !widget.showAllCommentsOfChapter && widget.book != null) ? widget.book.title : widget.chapterTitle,
               overflow: TextOverflow.ellipsis,
             )
         ),
       );
     } else {
       return Scaffold(
         body: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           color: kPrimaryDarkColor,
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
         appBar: AppBar(
             backgroundColor: kPrimaryDarkColor,
             title: Text("Add comment")
         ),
       );
     }
   }
  }

  void removeComment(int key){
    if(key != 0){
      setState(() {
        comments.removeAt(key);
        InfoToast.showCommentRemovedCorrectly(false);
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
