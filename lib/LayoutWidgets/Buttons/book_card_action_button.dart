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
  final Function(ListType listType, Lecture book,
                {bool added, BookCardType type}) onBookCardActionButtonPressed;
  final Function() onBookCompletedProcess;
  final bool added;

  BookCardActionButton(
      this.book,
      this.type,
      this.listType,
      this.tickerProvider,
      this.listTitle,
      {
        this.onBookCardActionButtonPressed,
        this.onBookCompletedProcess,
        this.added,
      }
  );


  @override
  _BookCardActionButton createState() => _BookCardActionButton();
}

class _BookCardActionButton extends State<BookCardActionButton>{

  Color buttonColor;
  double buttonSize;
  ConfettiController _confettiController;

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
        child:  Icon(
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
      onPressed: () async {
        if((widget.type == BookCardType.book_card_in_vertical_list)) {
          setState(() {
            buttonColor = Colors.lightGreen;
          });
          await animationController.forward();
          setState(() {
            widget.onBookCardActionButtonPressed(widget.listType, widget.book, type: widget.type);
            if(widget.book.finished){
              buttonSize = (18.24 * SizeConfig.imageSizeMultiplier); // 75
              this._visible = false;
            } else {
              this.buttonColor = kPrimaryDarkColor;
            }
          });
          if(widget.book.finished)
            bookCompletedProcess();
        } else {
          setState(() {
            _changeAddedState(setState: true);
            widget.onBookCardActionButtonPressed(widget.listType, widget.book, added: added);
          });
        }
      },
    );
  }

  _changeAddedState({setState = false}){
    if(setState)
      added = !added;
    iconData = added ? Icons.check : Icons.add;
    buttonColor = added ? Colors.green : kPrimaryDarkColor;
  }

  _initializeWidgetsInSearchVerticalList(){
    added = widget.added;
    _changeAddedState();
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
    );/*..addStatusListener((status) async {
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
    });*/

    if(widget.type == BookCardType.book_card_in_vertical_list){
      _confettiController = new ConfettiController(
        duration: new Duration(seconds: 2),
      );
    }
  }

  bookCompletedProcess() {
    widget.onBookCompletedProcess();
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