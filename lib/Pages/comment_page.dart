import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/sub_comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CommentPage extends StatelessWidget{

  MainCommentCard mainCommentCard;
  List<SubCommentCard> subComments;
  String newComment;

  CommentPage();

  /*Dialog alertDialog;
  bool _firstTime = true;
  BuildContext context;
  double width;
  double height;*/



  @override
  Widget build(BuildContext context) {
    subComments = new List();
    subComments.add(new SubCommentCard());
    subComments.add(new SubCommentCard());
    subComments.add(new SubCommentCard());

    mainCommentCard = MainCommentCard(subComments: true, subCommentsList: subComments,);


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //child:  _createListView(),
        child: Column(
          children: [
            Flexible(
              flex: 9,
              child: mainCommentCard,
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
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          //border: InputBorder,
                            hintText: 'Add Comment...'
                        ),
                        onChanged: (value){
                          newComment = value;
                        },
                      ),
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
    mainCommentCard.addSubComment(newComment);
  }
}
