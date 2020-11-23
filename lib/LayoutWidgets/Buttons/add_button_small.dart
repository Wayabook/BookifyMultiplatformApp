import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButtonSmall extends StatefulWidget {

  //Book book;
  IconData _iconData;
  _AddButtonSmall _addButtonSmall = _AddButtonSmall();
  AddButtonSmall(this._iconData);

  /*setIcon(IconData iconData) {
    _addButtonSmall.setIcon(iconData);
  }*/

  @override
  _AddButtonSmall createState() => _AddButtonSmall();


}
class _AddButtonSmall extends State<AddButtonSmall>{

  IconData iconData;
  bool isInPendingList, isInReadingList;

  @override
  void initState() {
    super.initState();
    this.iconData = widget._iconData;
    /*var user = Provider.of<User>(context, listen: false);
    isInPendingList = user.isInPendingList(widget.book.toLecture());
    isInReadingList = user.isInReadingList(widget.book.toLecture());

    if( isInPendingList || isInReadingList){
      iconData = Icons.check;
    } else {
      iconData = Icons.add;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return _getAddButton();
  }

  /*setIcon(IconData iconData){
    setState(() {
      this.iconData = iconData;
    });
  }*/

  _getAddButton(){
    return  Container(
      height: (4.39 * SizeConfig.heightMultiplier), //30
      width: (7.29 * SizeConfig.widthMultiplier), //30
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular((1.7 * SizeConfig.imageSizeMultiplier))), // 7
        border: Border.all(
            color: Colors.black,
            width: (0.24 * SizeConfig.widthMultiplier)
        ),
        color: kPrimaryLightColor,
      ),
      child: Icon(
          iconData,
          size: (5.83 * SizeConfig.imageSizeMultiplier), //24
          color: Colors.black),
    );
  }

}