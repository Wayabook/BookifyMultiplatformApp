import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class BookCardActionButton extends StatefulWidget {
  static const IconData ICON_CHECK = Icons.check;
  static const IconData ICON_ADD = Icons.add;
  static const IconData ICON_BEEN_HERE = Icons.beenhere;

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
    this.listTitle, {
    this.onBookCardActionButtonPressed,
    this.onBookCompletedProcess,
    this.added,
  });

  @override
  _BookCardActionButton createState() => _BookCardActionButton();
}

class _BookCardActionButton extends State<BookCardActionButton> {
  static const double IMAGE_SIZE_MULTIPLIER = 18.24;
  static const int DEFAULT_ANIMATION_DURATION = 1500;
  static const int DEFAULT_CONFETTI_CONTROLLER_DURATION = 2;

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
  bool toDispose = false;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
              height:
                  (IMAGE_SIZE_MULTIPLIER * SizeConfig.imageSizeMultiplier), //75
              width:
                  (IMAGE_SIZE_MULTIPLIER * SizeConfig.imageSizeMultiplier), //75
              child: _buildFloatingActionButton()),
        ));
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      backgroundColor: kPrimaryLightColor,
      child: (widget.type == BookCardType.book_card_in_vertical_list)
          ? RotationTransition(
              turns: animation,
              child: Icon(
                BookCardActionButton.ICON_BEEN_HERE,
                color: !widget.book.finished
                    ? buttonColor
                    : bookCardActionButtonColor2,
                size: !widget.book.finished
                    ? buttonSize
                    : (IMAGE_SIZE_MULTIPLIER *
                        SizeConfig.imageSizeMultiplier), //75
              ),
            )
          : Icon(
              iconData,
              color: buttonColor,
              size: (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier), //50
            ),
      onPressed: _onButtonPressed,
    );
  }

  _onButtonPressed() async {
    toDispose = true;
    if ((widget.type == BookCardType.book_card_in_vertical_list)) {
      setState(() {
        buttonColor = bookCardActionButtonColor2;
      });
      await animationController.forward();
      setState(() {
        widget.onBookCardActionButtonPressed(widget.listType, widget.book,
            type: widget.type);
        if (widget.book.finished) {
          buttonSize =
              (IMAGE_SIZE_MULTIPLIER * SizeConfig.imageSizeMultiplier); // 75
          this._visible = false;
        } else {
          this.buttonColor = bookCardActionButtonColor2;
        }
      });

      if (widget.book.finished) bookCompletedProcess();
    } else {
      setState(() {
        _changeAddedState(setState: true);
        widget.onBookCardActionButtonPressed(widget.listType, widget.book,
            added: added);
      });
    }
  }

  _changeAddedState({setState = false}) {
    if (setState) added = !added;
    iconData =
        added ? BookCardActionButton.ICON_CHECK : BookCardActionButton.ICON_ADD;
    buttonColor =
        added ? bookCardActionButtonColor : bookCardActtionButtonDefaultColor;
  }

  _initializeWidgetsInSearchVerticalList() {
    added = widget.added;
    _changeAddedState();
  }

  _initializeWidgetsInVerticalList() {
    buttonColor = bookCardActtionButtonDefaultColor;
    buttonSize = (TEXT_FACTOR_50 * SizeConfig.imageSizeMultiplier); //50

    animationControllerDuration = DEFAULT_ANIMATION_DURATION;
    this._visible = true;
    animationController = AnimationController(
        duration: Duration(milliseconds: animationControllerDuration),
        vsync: widget.tickerProvider);

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    );
    /*..addStatusListener((status) async {
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

    if (widget.type == BookCardType.book_card_in_vertical_list) {
      _confettiController = new ConfettiController(
        duration: new Duration(seconds: DEFAULT_CONFETTI_CONTROLLER_DURATION),
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
    if (widget.type == BookCardType.book_card_in_vertical_list) {
      _initializeWidgetsInVerticalList();
    } else if (widget.type == BookCardType.book_card_in_vertical_search_list) {
      _initializeWidgetsInSearchVerticalList();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (toDispose) animationController?.dispose();
    super.dispose();
  }
}
