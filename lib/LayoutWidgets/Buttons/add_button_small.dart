import 'package:flutter/material.dart';

class AddButtonSmall extends StatelessWidget {

  AddButtonSmall();

  @override
  Widget build(BuildContext context) {
    return _getAddButton();
  }

  _getAddButton(){
    /*double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;*/
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Icon(
          Icons.add,
          color: Colors.black),
    );
  }

}