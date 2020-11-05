import 'package:bookifyapp/Design/constants.dart';
import 'package:flutter/material.dart';

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
        hintText: this.title,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      onChanged: (value){
        this.title = value;
      },
    );
    return textField;
  }
}