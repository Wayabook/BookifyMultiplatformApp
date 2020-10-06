import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/profile_page.dart';
import 'package:provider/provider.dart';



class BooskelfGridList extends StatefulWidget {

  User user;
  bool scrollToLastPosition;

  BooskelfGridList(this.user,  { this.scrollToLastPosition = false });

  @override
  _BooskelfGridList createState() => _BooskelfGridList();
}

class _BooskelfGridList extends State<BooskelfGridList> with TickerProviderStateMixin{

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
            return _makeHeader(keys[index == 0 ? index : (index~/2)], width, (index == 0 || index == 2));
          } else {
            var auxIndex = index;
            var key = keys[((auxIndex-1)~/2)];
            return GridView.count(
              key: UniqueKey(),
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio:  (MediaQuery.of(context).size.width / 4) / (MediaQuery.of(context).size.height / 4),
              children: List.generate(widget.user.lectures[key].length, (index) {
                return BookCard(widget.user.lectures[key][index], BookCardType.book_card_in_grid);
              }),
            );
          }
        }
    );
  }

  goToEditListPage(String title) async {

    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>
        AddCustomListPage(Provider
            .of<User>(context, listen: false)
            .bookshelf, title, ListType.edit_custom_list)));

    /*setState(() {
      User user = Provider.of<User>(context, listen: false);
      widget.user.lectures[title] = user.lectures[title];
    });*/
  }

  _makeHeader(String title, width, [reading]) {
    if (reading)
      return ListTitle(title);
    if(!showEditButton)
      return ListTitle(title, withButton: true, buttonType: ButtonType.copy_list, goToPageFromParent: goToEditListPage,);
    return ListTitle(title, withButton: true, buttonType: ButtonType.edit_list, goToPageFromParent: goToEditListPage,);
    //return (reading || !showEditButton) ?   ListTitle(title):
    //ListTitle(title, withButton: true, buttonType: ButtonType.edit_list, goToPageFromParent: goToEditListPage,);
  }

}