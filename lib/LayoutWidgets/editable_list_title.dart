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
  //bool withButton;
  //ButtonType buttonType;
  //Function(String) goToPageFromParent;

  EditableListTitle(
      this.title,
  /*    {
        this.withButton = false,
        this.buttonType = ButtonType.view_all,
        this.goToPageFromParent
      }*/
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
            child: Container(color: Colors.white, height: 2, width: width),
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

  /*_getTitle(){
    return Align(
      alignment: Alignment.topLeft,
      child:  Text(
        title,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  _getRowWithButton(BuildContext context){
    return Row(
      children: [
        Flexible(
          flex: 6,
          child:  _getTitle(),
        ),

        Flexible(
          flex: 4,
          child:  Align(
              alignment: Alignment.bottomRight,
              child:  Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: this.buttonType == ButtonType.edit_list ? _getEditListButton(context) : _getViewAllButton(context),
              )
          ),
        )
      ],
    );
  }

  _getViewAllButton(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookshelfPage(Provider.of<User>(context, listen: false))),
        );
      },
      child: Text(
        "View All",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }*/

  /*_getEditListButton(BuildContext context){
    return GestureDetector(
      onTap: () async {
        if(buttonType == ButtonType.view_all) {
          final result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>
              AddCustomListPage(Provider
                  .of<User>(context, listen: false)
                  .bookshelf, title, ListType.edit_custom_list)));
        } else if (buttonType == ButtonType.edit_list) {
          this.goToPageFromParent(title);
        }
      },
      child: Text(
        "Edit",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );

  }*/
}