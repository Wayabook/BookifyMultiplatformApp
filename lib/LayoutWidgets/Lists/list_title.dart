import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTitle extends StatelessWidget{

  final String title;
  bool withButton;
  ButtonType buttonType;

  ListTitle(
      this.title,
      {
        this.withButton = false,
        this.buttonType = ButtonType.view_all
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
            child: withButton ? _getRowWithButton(context) : _getTitle(),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Container(color: Colors.white, height: 2, width: width),
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
  }

  _getEditListButton(BuildContext context){
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddCustomListPage(Provider.of<User>(context, listen: false).bookshelf, title, ListType.edit_custom_list)));
        //Navigator.pop(context);
        /*if(result == 0){
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookshelfPage(Provider.of<User>(context, listen: false), scrollToLastPosition: true,)),
          );
          Navigator.pop(context);
        }*/
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

  }
}