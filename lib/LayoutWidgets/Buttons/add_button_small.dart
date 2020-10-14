import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddButtonSmall extends StatefulWidget {

  Book book;
  AddButtonSmall(this.book);

  @override
  _AddButtonSmall createState() => _AddButtonSmall();


}
class _AddButtonSmall extends State<AddButtonSmall>{

  IconData iconData;
  bool isInPendingList, isInReadingList;

  @override
  void initState() {
    super.initState();
    var user = Provider.of<User>(context, listen: false);
    isInPendingList = user.isInPendingList(widget.book.toLecture());
    isInReadingList = user.isInReadingList(widget.book.toLecture());

    if( isInPendingList || isInReadingList){
      iconData = Icons.check;
    } else {
      iconData = Icons.add;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getAddButton();
  }

  _getAddButton(){

    return GestureDetector(
      onTap: (){
        setState(() {
          if(!isInReadingList){
            if(!isInPendingList){
              setState(() {
                isInPendingList = true;
                var user = Provider.of<User>(context, listen: false);
                user.addLectureToPendingList(widget.book.toLecture());

                iconData = Icons.check;
                InfoToast.showBookAddedCorrectlyToast(widget.book.title);
              });
            }
          }
        });
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(color: Colors.black),
          color: kPrimaryLightColor,
        ),
        child: Icon(
            iconData,
            color: Colors.black),
      ),
    );
  }

}