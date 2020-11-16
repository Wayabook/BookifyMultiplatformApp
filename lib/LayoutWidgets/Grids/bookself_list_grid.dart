import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/Interfaces/TitleButtonInterface.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_accept_and_cancel_options.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/Title/list_title.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import '../../SizeConfig.dart';



class BooskelfGridList extends StatefulWidget {

  User user;
  bool scrollToLastPosition;

  BooskelfGridList(this.user,  { this.scrollToLastPosition = false });

  @override
  _BooskelfGridList createState() => _BooskelfGridList();
}

class _BooskelfGridList extends State<BooskelfGridList>
    with TickerProviderStateMixin
    implements TitleButtonInterface{

  bool showEditButton;

  @override
  initState() {
    super.initState();
    User user = Provider.of<User>(context, listen: false);
    showEditButton = user.isEqual(widget.user);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    List<String> keys = widget.user.lectures.keys.toList();
    return ListView.builder
      (
        controller: widget.scrollToLastPosition ?
        ScrollController(initialScrollOffset: (MediaQuery.of(context).size.height / 4) * (widget.user.lectures.keys.length * 2)) : ScrollController(),
        itemCount: widget.user.lectures.keys.length * 2,
        itemBuilder: (BuildContext ctxt, int index) {
          if (index % 2 == 0){
            String key = keys[index == 0 ? index : (index~/2)];
            return _makeHeader(key, width, User.uneditableLists().contains(key));
          } else {
            var auxIndex = index;
            var key = keys[((auxIndex-1)~/2)];
            return GridView.count(
              key: UniqueKey(),
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: (2.43 * SizeConfig.widthMultiplier), // 10
              crossAxisSpacing: (1.47 * SizeConfig.heightMultiplier),
              childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4),
              children: List.generate(widget.user.lectures[key].length, (index) {
                return BookCard(widget.user.lectures[key][index], BookCardType.book_card_in_grid);
              }),
            );
          }
        }
    );
  }

  @override
  void onTitleButtonPressed(ButtonType buttonType, BuildContext context, {String title}) {
    // TODO: implement onTitleButtonPressed
    if(buttonType == ButtonType.view_all) {
      _viewAllPressed(context, title);
    } else if (buttonType == ButtonType.edit_list) {
      _goToEditListPage(title);
    } else if (buttonType == ButtonType.copy_list) {
      _copyList(title);
      //this.goToPageFromParent(title);
    } else if (buttonType == ButtonType.delete_list){
      _deleteList(title);
    }
  }

  _viewAllPressed(BuildContext context, String title) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>
        AddCustomListPage(Provider
            .of<User>(context, listen: false)
            .bookshelf, title, ListType.edit_custom_list)));
  }

  _goToEditListPage(String title) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>
        AddCustomListPage(Provider
            .of<User>(context, listen: false)
            .bookshelf, title, ListType.edit_custom_list)));
  }

  _copyList(String title) async {
    var newTitle = await showDialog(
      context: context,
      builder: (BuildContext context) => DialogWithInputText(
          'Copy Friends List',
          'Are you sure you want to copy this list?\n\n',
          title,
      ),
    );
    if(newTitle != DialogWithInputText.CANCEL_TAP){
      User user = Provider.of<User>(context, listen: false);
      user.addCustomLectureList(newTitle, widget.user.getLectureListByName(title));
      InfoToast.showListCopiedCorrecltyToBookshelf(newTitle);
    }
  }

  _deleteList(String title) async {
    int result = await showDialog(
      context: context,
      builder: (BuildContext context) => DialogWithAcceptAndCancelOptions(
          "Delete List",
          "Are you sure you want to delete list?",
          TextStyle(color: Colors.red,),
          TextStyle(color: Colors.blue,)
      ),
    );
    if(result == DialogWithAcceptAndCancelOptions.ACCEPT_TAP){
      setState(() {
        User user = Provider.of<User>(context, listen: false);
        user.removeLectureListByName(title);
      });
      InfoToast.showListRemovedCorrecltyFromBookshelf(title);
    }
  }

  _makeHeader(String title, width, [reading]) {
    if (reading)
      return ListTitle(title);
    if(!showEditButton)
      return ListTitle(
        title,
        withButton: true,
        buttonType: ButtonType.copy_list,
        onListTitleButtonTapped: onTitleButtonPressed,
      );
    return ListTitle(
      title,
      withButton: true,
      buttonType: ButtonType.edit_list,
      onListTitleButtonTapped: onTitleButtonPressed,
    );
  }

}