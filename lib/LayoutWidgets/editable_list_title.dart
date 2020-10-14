import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditableListTitle extends StatelessWidget{

  String title;
  TextEditingController textEditingController = new TextEditingController();

  EditableListTitle(
      this.title,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
            child: _getTextField(),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Container(color: kPrimaryLightColor, height: 2, width: width),
          ),
        ],
      ),
    );
  }

  _getTextField(){
    TextField textField = TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //border: InputBorder,
        hintText: this.title,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      maxLines: null,
      //expands: widget.subCommentsPage ? false : true,
      keyboardType: TextInputType.multiline,
      onChanged: (value){
        this.title = value;
        /*newComment = value;
        if(!widget.subCommentsPage){
          setState(() {
            publishContainerColor = Colors.yellow;
            publishTextColor = Colors.black;
          });
        }*/
      },
    );
    return textField;
  }
}