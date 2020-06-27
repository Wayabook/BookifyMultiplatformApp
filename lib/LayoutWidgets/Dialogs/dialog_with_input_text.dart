
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';

class DialogWithInputText extends StatelessWidget{

  User user;
  DialogWithInputText(this.user);

  AlertDialog alertDialog;
  bool _firstTime = true;

  final TextEditingController inputController = TextEditingController();

  /*TextField listTitle = TextField(
        decoration: InputDecoration(
            filled: true,
            enabledBorder:  OutlineInputBorder(
              borderSide: error != false ?  BorderSide(color: Colors.greenAccent, width: 2.0) : BorderSide(color: Colors.red, width: 2.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            hintText:  "List Title"
        ),
        controller: inputController,
  );*/

  /*@override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }*/


  @override
  Widget build(BuildContext context) {
    alertDialog = new AlertDialog(
      title: const Text('Add List Title:'),
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
                labelText:  "List Title",
                errorText: validateListTitle(inputController.text),
            ),
            controller: inputController,
          ),
          //_buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
              "Accept",
              style: TextStyle(color: Colors.blue,)
          ),
          onPressed: () {
              String listTitle = "";
              if (inputController.text.isNotEmpty && inputController.text.toString() != "List Title") {
                listTitle = inputController.text.toString();
              } else {
                listTitle = "Custom list";
              }
              //Navigator.pop(context);
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddCustomListPage(this.user.bookshelf, listTitle)));
          },
        ),
        FlatButton(
          child: Text(
              "Cancel",
              style: TextStyle(color: Colors.red,)
          ),
          onPressed: () {
            Navigator.pop(context);
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
        text: 'Add a custom list of books from your Bookshelf, and share it with your friends.\n\n',
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget _buildLogoAttribution() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new Image.asset(
              "assets/flutter.png",
              width: 32.0,
            ),
          ),
          const Expanded(
            child: const Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: const Text(
                'Popup window is like a dialog box that gains complete focus when it appears on screen.',
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}