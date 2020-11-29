import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/book_card.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../InfoToast.dart';

class BookCardActionButton extends StatefulWidget {

  //Lecture book;
  //BookCardType type;
  //BookCardInfo(this.book, this.type);
  final Lecture book;
  final ListType listType;
  final BookCardType type;
  final TickerProvider tickerProvider;
  final String listTitle;
  final Function(ListType listType, Lecture book, {bool added}) onBookCardActionButtonPressed;
  final Function(BuildContext context) onBookCompletedProcess;
  final BookCard bookCard;

  BookCardActionButton(
      this.book,
      this.type,
      this.listType,
      this.tickerProvider,
      this.listTitle,
      {
        this.bookCard,
        this.onBookCardActionButtonPressed,
        this.onBookCompletedProcess}
  );


  @override
  _BookCardActionButton createState() => _BookCardActionButton();
}

class _BookCardActionButton extends State<BookCardActionButton>{

  /**
   * Missing:
   * Initialize user
   * Call functions from parent widgets.
   * */

  User user;
  Color buttonColor;
  double buttonSize; // = 50.0;

  // Rotation controller
  int animationControllerDuration;
  AnimationController animationController;
  Animation<double> animation;

  // Vertical List Search
  IconData iconData;
  bool isInPendingList;
  bool isInReadingList;
  bool added;
  bool _visible;


  @override
  Widget build(BuildContext context) {

    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: (18.24 * SizeConfig.imageSizeMultiplier), //75
            width: (18.24 * SizeConfig.imageSizeMultiplier), //75
            child: _buildFloatingActionButton()
        )
    );
  }

  _buildFloatingActionButton(){
    return FloatingActionButton(
      heroTag: UniqueKey(),
      backgroundColor: kPrimaryLightColor,
      child: (widget.type == BookCardType.book_card_in_vertical_list) ?
      RotationTransition(
        turns: animation,
        child: Icon(
          Icons.beenhere,
          color: !widget.book.finished ? buttonColor : Colors.lightGreen,
          size: !widget.book.finished ? buttonSize : (18.24 * SizeConfig.imageSizeMultiplier), // 75
        ),
      ) :
      Icon(
        iconData,
        color: buttonColor,
        size: (12.16 * SizeConfig.imageSizeMultiplier), //50
      ),
      onPressed: (){
        if((widget.type == BookCardType.book_card_in_vertical_list)) {
          setState(() {
            buttonColor = Colors.lightGreen;
          });
          setState(() {
            animationController.forward();
          });
        } else {
          if (widget.listType == ListType.normal || widget.listType == ListType.preview_friends) {
            setState(() {
              if(!isInReadingList){
                if(!isInPendingList){
                  setState(() {
                    widget.onBookCardActionButtonPressed(widget.listType, widget.book);
                    //var user = Provider.of<User>(context, listen: false);
                    //user.addLectureToPendingList(widget.book.toLecture());

                    iconData = Icons.check;
                    buttonColor = Colors.green;
                    //InfoToast.showBookAddedCorrectlyToast(widget.book.title);
                  });
                } else {
                  //var user = Provider.of<User>(context, listen: false);
                  //user.removeLectureFromPendingList(widget.book.toLecture());

                  iconData = Icons.add;
                  //InfoToast.showBookRemovedCorrectlyToast(widget.book.title);
                }
                isInPendingList = !isInPendingList;
              }
            });
          } else if (
            widget.listType == ListType.add_custom_list ||
            widget.listType == ListType.edit_custom_list ||
            widget.listType == ListType.first_time_form ||
            widget.listType == ListType.received_recommendation_form ||
            widget.listType == ListType.send_recommendation_form
            ) {

            setState(() {
              added = !added;
              if(added){
                iconData = Icons.check;
                buttonColor = Colors.green;
              } else {
                iconData = Icons.add;
                buttonColor = kPrimaryDarkColor;
              }
              widget.onBookCardActionButtonPressed(widget.listType, widget.book, added: added);
              //widget.addOrRemoveBookFromTemporalCustomList(widget.book, added);
            });

          }
        }
      },
    );
  }

  _initializeWidgetsInSearchVerticalList(){

    user = Provider.of<User>(context, listen: false);
    if (widget.listType == ListType.first_time_form ||
        widget.listType == ListType.received_recommendation_form ||
        widget.listType == ListType.send_recommendation_form
    ){
      added = false;
      iconData = added ? Icons.check : Icons.add;
      buttonColor = added ? Colors.green : kPrimaryDarkColor;
    } else if(
    widget.listType != ListType.add_custom_list &&
        widget.listType != ListType.edit_custom_list &&
        widget.listType != ListType.first_time_form) {
      isInPendingList = user.isInPendingList(widget.book.toLecture());
      isInReadingList = user.isInReadingList(widget.book.toLecture());

      if (isInPendingList || isInReadingList) {
        iconData = Icons.check;
        buttonColor = isInReadingList ? Colors.green : kPrimaryDarkColor;
      } else {
        iconData = Icons.add;
        buttonColor = kPrimaryDarkColor;
      }
    } else {
      added = user.isLectureInList(widget.book.toLecture(), widget.listTitle);
      iconData = added ? Icons.check : Icons.add;
      buttonColor = added ? Colors.green : kPrimaryDarkColor;
    }
  }

  _initializeWidgetsInVerticalList(){
    buttonColor = kPrimaryDarkColor;
    buttonSize = (12.16 * SizeConfig.imageSizeMultiplier); //50

    animationControllerDuration = 1500;
    this._visible = true;
    animationController = AnimationController(
        duration: Duration(milliseconds: animationControllerDuration),
        vsync: widget.tickerProvider
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    )..addStatusListener((status) async {
      if(status == AnimationStatus.completed){
        setState(() {
          var user = Provider.of<User>(context, listen: false);
          user.increaseChapter(widget.book);
          if(widget.book.finished){
            buttonSize = (18.24 * SizeConfig.imageSizeMultiplier); // 75
            this._visible = false;
          } else {
            this.buttonColor = kPrimaryDarkColor;
          }
        });
        if(widget.book.finished)
          bookCompletedProcess();
      }
    });
  }

  void bookCompletedProcess(){
    widget.onBookCardActionButtonPressed(widget.listType, widget.book);
    var user = Provider.of<User>(context, listen: false);
    user.moveLectureFromReadingListToReadList(widget.book);
    InfoToast.showFinishedCongratulationsMessage(widget.book.title);
    /*setState(() {
      var user = Provider.of<User>(context, listen: false);
      user.moveLectureFromReadingListToReadList(widget.book);
      InfoToast.showFinishedCongratulationsMessage(widget.book.title);
    });*/
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }

  @override
  void initState() {
    if(widget.type == BookCardType.book_card_in_vertical_list){
      _initializeWidgetsInVerticalList();
    } else if(widget.type == BookCardType.book_card_in_vertical_search_list) {
      _initializeWidgetsInSearchVerticalList();
    }
    super.initState();
  }

  @override
  void dispose() {
    if(widget.type == BookCardType.book_card_in_vertical_list)
      animationController.dispose();
    super.dispose();
  }
}