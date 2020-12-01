import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButtonSmall extends StatefulWidget {

  static IconData iconChecked = Icons.check;
  static IconData iconAdded = Icons.add;

  IconData _iconData;
  Function onButtonClicked;
  AddButtonSmall(this._iconData, {this.onButtonClicked});

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
  }

  @override
  Widget build(BuildContext context) {
    return _getAddButton();
  }

  _getAddButton(){
    return  GestureDetector(
      onTap: (){
        setState(() {
          if (iconData != AddButtonSmall.iconChecked){
            iconData = AddButtonSmall.iconChecked;
            if(widget.onButtonClicked != null){
              widget.onButtonClicked();
            }
          }
        });
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: (4.39 * SizeConfig.heightMultiplier), //30
          width: (7.29 * SizeConfig.widthMultiplier), //30
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular((1.7 * SizeConfig.imageSizeMultiplier))), // 7
            border: Border.all(
                color: addButtonIconColor,
                width: (0.24 * SizeConfig.widthMultiplier)
            ),
            color: kPrimaryLightColor,
          ),
          child: Icon(
              iconData,
              size: (5.83 * SizeConfig.imageSizeMultiplier), //24
              color: addButtonIconColor),
        ),
      ),
    );
  }

}