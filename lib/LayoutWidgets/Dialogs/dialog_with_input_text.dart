
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class DialogWithInputText extends StatelessWidget{

  DialogWithInputText();

  AlertDialog alertDialog;
  bool error = false;

  /*static InputDecoration inputDecoration = InputDecoration(
      filled: true,
      enabledBorder: const OutlineInputBorder(
      borderSide: error != false ?  BorderSide(color: Colors.greenAccent, width: 2.0) : BorderSide(color: Colors.red, width: 2.0),
      ),
      errorBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      hintText:  "List Title"
  );*/

  static TextEditingController inputController = TextEditingController();

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


  @override
  Widget build(BuildContext context) {
    alertDialog = new AlertDialog(
      title: const Text('Add List Title:'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          TextFormField(
            decoration: InputDecoration(
                filled: true,
                enabledBorder:  OutlineInputBorder(
                  borderSide: error == false ?  BorderSide(color: Colors.greenAccent, width: 2.0) : BorderSide(color: Colors.red, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                hintText:  error == false ? "List Title" : "List Title must be introduced",
            ),
            controller: inputController,
            validator: (String value){
              if(value.isEmpty){
                return "List Name is required";
              // ignore: missing_return
              }
              return "";
            },
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
              if (inputController.value.text.isEmpty || inputController.value.text.toString() == "List Title") {
                error = true;
              } else {
                Navigator.pop(context);
              }
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