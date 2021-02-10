import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/book_card_action_button.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/book_card_factory.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/add_feedback_dialog.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/recommendation_dialog.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/friends_preview.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/BookPage/book_page.dart';
import 'package:bookifyapp/Pages/SearchPage/search_page.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../InfoToast.dart';
import '../BookCardInfo/book_card_info.dart';
import '../OptionCard/option_card.dart';

class BookCardInVerticalList extends StatefulWidget with BookCardFactory {
  BookCardType type;
  Lecture book;
  User user;

  //Vertical List
  TickerProvider tickerProvider;
  ButtonType buttonType;
  int position;

  //Vertical SearchList
  Function(Book book, bool add) addOrRemoveBookFromTemporalCustomList;
  ListType listType;
  String listTitle;

  _BookCard bookCard = _BookCard();

  BookCardInVerticalList(this.book, this.type, this.user, this.buttonType,
      this.position, this.tickerProvider);

  @override
  Widget build({
    BuildContext context,
  }) {
    return this;
  }

  @override
  bookCompletedProcess() {
    bookCard.bookCompletedProcess();
  }

  @override
  _BookCard createState() => bookCard;
}

class _BookCard extends State<BookCardInVerticalList> {
  static const double DEFAULT_PADDING_FACTOR = 0.24;
  static const double DEFAULT_BORDER_RADIUS_FACTOR = 1.7;
  static const double DEFAULT_LINE_HEIGHT_FACTOR = 0.73;
  static const double BOOK_COMPLETED_INDICATOR = 1.0;
  //BuildContext context;

  Card card;
  bool showEndLectureFrame = false;
  double buttonSize; // = 50.0;
  Widget content;
  bool visible;
  int animationControllerDuration;
  Color buttonColor;
  bool _visible;

  // Rotation controller
  AnimationController animationController;
  Animation<double> animation;

  // Confetti controller
  ConfettiController confettiController;

  // Vertical List Search
  //User user;
  IconData iconData;
  //Color buttonColor;
  bool isInPendingList;
  bool isInReadingList;
  bool added;

  _BookCard();

  @override
  Widget build(BuildContext context) {
    if (widget.type == BookCardType.book_card_in_vertical_list &&
        widget.book.finished) {
      setState(() {
        confettiController.play();
      });
    }
    //return _getCardWidget(context);
    return widget.getCardWidget(
        widget.type, _getVerticalListCardWidget(context));
  }

  @override
  void initState() {
    _initializeWidgetsInVerticalList();
    super.initState();
  }

  _initializeWidgetsInVerticalList() {
    confettiController = new ConfettiController(
      duration: new Duration(seconds: 2),
    );
  }

  /*void bookCompletedProcess(){
    //widget.changeLecturePositionContent(widget.position, widget.book);
    setState(() {
      //var user = Provider.of<User>(context, listen: false);
      this.user.moveLectureFromReadingListToReadList(book);
      InfoToast.showFinishedCongratulationsMessage(widget.book.title);
    });
  }*/

  _getVerticalListCardWidget(BuildContext ctx) {
    return GestureDetector(
        key: UniqueKey(),
        onTap: () async {
          await showDialog(
            context: context,
            builder: (BuildContext context) => AddFeedbackDialog(widget.book),
          );
          if (widget.book.finished) {
            bookCompletedProcess();
          }
        },
        child: Builder(
          builder: (BuildContext context) {
            return ConfettiWidget(
              blastDirectionality: BlastDirectionality.explosive,
              confettiController: confettiController,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 25,
              gravity: 0.05,
              shouldLoop: false,
              colors: [
                Colors.green,
                Colors.red,
                Colors.yellow,
                Colors.blue,
              ],
              child: Container(
                height: (26.18 * SizeConfig.heightMultiplier), // 160
                decoration: BoxDecoration(
                  color: kPrimaryDarkColor,
                ),
                child: _getVerticaListTile(),
              ),
            );
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getVerticaListTile() {
    return Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(
                (1.7 * SizeConfig.imageSizeMultiplier)) // 7
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (1.21 * SizeConfig.widthMultiplier), //5
            vertical: (1.46 * SizeConfig.heightMultiplier), //10
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: widget.getFirstRowItem(
                    widget.type, widget.listType, widget.book, () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          BookPage("title", widget.book, _getBooks())));
                }),
              ),
              Flexible(
                flex: 5,
                child: widget.getSecondRowItem(
                    widget.book, widget.type), //_getSecondRowItem(),
              ),
              Flexible(
                flex: 2,
                child: widget.getThirdRowItem(
                    widget.book,
                    widget.type,
                    widget.user,
                    widget.listType,
                    widget.tickerProvider,
                    widget.listTitle,
                    _onBookCardActionButtonPressed),
              ),
            ],
          ),
        ));
  }

  bookCompletedProcess() {
    setState(() {
      widget.user.moveLectureFromReadingListToReadList(widget.book);
      InfoToast.showFinishedCongratulationsMessage(widget.book.title);
    });
  }

  _onBookCardActionButtonPressed(ListType listType, Lecture book,
      {bool added: false, BookCardType type}) async {
    setState(() {
      widget.user.increaseChapter(book);
    });
  }

  List<Book> _getBooks() {
    return Book.getAppMockBooks();
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }
}
