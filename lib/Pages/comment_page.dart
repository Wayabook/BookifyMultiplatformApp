import 'package:bookifyapp/LayoutWidgets/Cards/main_comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CommentPage extends StatelessWidget{


  CommentPage();

  /*Dialog alertDialog;
  bool _firstTime = true;
  BuildContext context;
  double width;
  double height;*/



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
              child: MainCommentCard(subComments: true,),
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
                      ),
                    ),

                    Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.send,
                        color: Colors.yellow,
                        size: 30,
                      ),
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

  _getAddCommentSection(){
    return Card(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        color: Colors.blueGrey,
        child: Row(
          children: [
            TextField(
              decoration: InputDecoration(
                //border: InputBorder,
                  hintText: 'Add Comment...'
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.send,
                color: Colors.yellow,
                size: 30,
              ),
            ),
          ],
        ),
    );
    return Row(

    );
  }
}
