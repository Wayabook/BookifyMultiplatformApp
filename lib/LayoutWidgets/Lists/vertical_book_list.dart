import 'package:bookifyapp/LayoutWidgets/Cards/book_card_in_vertical_list.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:provider/provider.dart';


class VerticalBookList/*<T extends Book>*/ extends StatefulWidget {

  VerticalBookList(this.readingBooks, this.pendingBooks); // : super(key: key);

  List<Lecture> readingBooks;
  List<Lecture> pendingBooks;

  @override
  _VerticalBookList createState() => _VerticalBookList(this.readingBooks, this.pendingBooks);
}

class _VerticalBookList extends State<VerticalBookList> with TickerProviderStateMixin {

  int positionToChange;
  List<Widget> items;
  List<Lecture> readingBooks;
  List<Lecture> pendingBooks;

  _VerticalBookList(this.readingBooks, this.pendingBooks);


  @override
  void initState(){
    super.initState();
    updateLists();
    updateUILists();
  }


  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  changeLecturePositionContent(positionInList, book) async {
    //await wait(3);
    setState(() {

      //var user = Provider.of<User>(context, listen: false);
      //user.moveLectureFromReadingListToReadList(book);

      //updateLists();

      /*items = new List();
      for(int index = 0; index < widget.readingBooks.length + widget.pendingBooks.length + 2; index++){
        if (index == 0) {
          items.add(_makeHeader('Reading:'));
        } else if (index <= widget.readingBooks.length) {
          items.add(_makeCard(index - 1, widget.readingBooks, ButtonType.read));
        } else if (index == widget.readingBooks.length + 1) {
          items.add(_makeHeader('Pending:'));
        } else {
          items.add(_makeCard(index - 2 - widget.readingBooks.length, widget.pendingBooks, ButtonType.read));
        }
      }*/
    });
  }

  void updateLists(){
    var user = Provider.of<User>(context, listen: false);
    widget.readingBooks = user.getLectureListByName("Reading");
    widget.pendingBooks = user.getLectureListByName("Pending");
  }

  void updateUILists(){
    items = new List();
    for(int index = 0; index < widget.readingBooks.length + widget.pendingBooks.length + 2; index++){
      if (index == 0) {
        items.add(_makeHeader('Reading:'));
      } else if (index <= widget.readingBooks.length) {
        items.add(_makeCard(index - 1, widget.readingBooks, ButtonType.read));
      } else if (index == widget.readingBooks.length + 1) {
        items.add(_makeHeader('Pending:'));
      } else {
        items.add(_makeCard(index - 2 - widget.readingBooks.length, widget.pendingBooks, ButtonType.read));
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    updateLists();
    updateUILists();

    return Scaffold(
      backgroundColor: Colors.blueGrey, //Color.fromRGBO(58, 66, 86, 1.0),
      body: _makeBody(),
    );
  }

  _makeCard(int index, List<Book> books, ButtonType buttonType) {
    return BookCardInVerticalList(books[index], buttonType, index, this);
  }

  _makeBody() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: FutureBuilder(
        builder: (context, projectSnap) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: this.readingBooks.length + pendingBooks.length + 2,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: width,
                height: (index == 0) || (index == this.readingBooks.length + 1) ? 80 : 160 ,
                key: UniqueKey(),
                padding: EdgeInsets.all(0),
                child: items[index],
              );
            },
          );
        },

      ),
    );
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.readingBooks.length + widget.pendingBooks.length + 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: width,
            height: (index == 0) || (index == widget.readingBooks.length + 1) ? 80 : 160 ,
            key: UniqueKey(),
            padding: EdgeInsets.all(0),
            child: items[index],
          );
        },
      ),
    );
  }

  _makeHeader(String title){
    return ListTitle(title);
  }
}