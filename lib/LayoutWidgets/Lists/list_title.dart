import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget{

  User user;
  bool withButton;
  final String title;
  double fontSize;
  ButtonType buttonType;
  Color barAndTitleColor;
  bool withPadding;
  Function(ButtonType buttonType, BuildContext context, {String title}) onListTitleButtonTapped;

  ListTitle(
      this.title,
      {
        this.withButton = false,
        this.buttonType = ButtonType.view_all,
        this.user,
        this.onListTitleButtonTapped,
        this.fontSize = 30,
        this.barAndTitleColor = kPrimaryLightColor,
        this.withPadding = true,
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: withPadding ?
            EdgeInsets.fromLTRB(10, 10, 2, 0) :
            EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: withButton ? _getRowWithButton(context) : _getTitle(),
          ),

          Padding(
            padding: withPadding ?
            EdgeInsets.fromLTRB(15, 10, 15, 10) :
            EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(color: this.barAndTitleColor, height: 2, width: width),
          ),
        ],
      ),
    );
  }

  _getTitle(){
    return Align(
      alignment: Alignment.topLeft,
      child:  Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: this.fontSize, fontWeight: FontWeight.bold, color: this.barAndTitleColor),
      ),
    );
  }

  _getRowWithButton(BuildContext context){
    return Row(
      children: [
        Flexible(
          flex: 8,
          child:  _getTitle(),
        ),

        Flexible(
          flex: 3,
          child:  Align(
            alignment: Alignment.bottomRight,
            child:  Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: (this.buttonType == ButtonType.edit_list || this.buttonType == ButtonType.copy_list) ?
              _getEditListButton(context) : _getViewAllButton(context),
            )
          ),
        )
      ],
    );
  }

  _getViewAllButton(BuildContext context){
    var buttonText = buttonType == ButtonType.edit_genres_list ? "Edit" : "View All";
    return GestureDetector(
      onTap: () {
        onListTitleButtonTapped(this.buttonType, context);
      },
      child: SmallButtonUnderlined(buttonText)
    );
  }

  _getEditListButton(BuildContext context){
    if(buttonType == ButtonType.copy_list){
      return _getEditOrCopyButton(context);
    } else {
      return Row(
        children: [
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:  _getEditOrCopyButton(context),
            ),
          ) ,

          Flexible(
            flex: 5,
            child: _getDeleteButton(context),
          )
        ],
      );
    }

  }

  _getDeleteButton(BuildContext context){
    return GestureDetector(
        onTap: () {
          onListTitleButtonTapped(ButtonType.delete_list, context, title: title);
          //this.goToPageFromParent2(title);
        },
        child: SmallButtonUnderlined("Delete", textColor: Colors.red,),
    );

  }

  _getEditOrCopyButton(BuildContext context){
    return GestureDetector(
        onTap: () async {
          onListTitleButtonTapped(buttonType, context, title: title);
        },
        child: buttonType == ButtonType.edit_list ?
        SmallButtonUnderlined("Edit") : SmallButtonUnderlined("Copy")
    );
  }

  //getED
}