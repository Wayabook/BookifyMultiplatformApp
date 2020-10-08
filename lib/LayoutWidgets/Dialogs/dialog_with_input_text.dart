
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

class DialogWithInputText extends StatelessWidget{

  static const int ACCEPT_TAP = 0;
  static const int CANCEL_TAP = 1;
  //User user;
  String title;
  String description;
  String entryTextDescription;

  DialogWithInputText(
      this.title,
      this.description,
      this.entryTextDescription
  );

  AlertDialog alertDialog;
  bool _firstTime = true;

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    alertDialog = new AlertDialog(
      title: Text(this.title),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          TextField(
            decoration: InputDecoration(
                filled: true,
                enabledBorder:  OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                labelText:  this.entryTextDescription,
                errorText: validateListTitle(inputController.text),
            ),
            controller: inputController,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
              "Accept",
              style: TextStyle(color: Colors.blue,)
          ),
          onPressed: () async {
              String listTitle = "";
              if (inputController.text.isNotEmpty && inputController.text.toString() != this.entryTextDescription) {
                listTitle = inputController.text.toString();
              } else {
                listTitle = "Custom list";
              }
              Navigator.of(context).pop(listTitle);
              //Navigator.pop(context);
              /*final result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddCustomListPage(this.user.bookshelf, listTitle, ListType.add_custom_list)));
              if(result == 0){
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookshelfPage(Provider.of<User>(context, listen: false), scrollToLastPosition: true,)),
                );
                Navigator.pop(context);
              }*/
          },
        ),
        FlatButton(
          child: Text(
              "Cancel",
              style: TextStyle(color: Colors.red,)
          ),
          onPressed: () {
            Navigator.of(context).pop(CANCEL_TAP);
          },
        ),
      ],
    );
    return alertDialog;
  }

  String validateListTitle(String value) {
    if ((value.length == 0) &&  !_firstTime && value != "List Title") {
      return "List Title must be introduced";
    }
    _firstTime = false;
    return null;
  }



  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: this.description,
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}