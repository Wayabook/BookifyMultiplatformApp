import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/LayoutWidgets/Abstracts/book_card_factory.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/recommendation_dialog.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/BookPage/book_page.dart';
import 'package:bookifyapp/Pages/SearchPage/search_page.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../InfoToast.dart';
import '../OptionCard/option_card.dart';

// ignore: must_be_immutable
class BookCard extends StatefulWidget with BookCardFactory {
  BookCardType type;
  Lecture book;
  User user;

  _BookCard bookCard = _BookCard();

  BookCard(this.book, this.type, {this.user});

  @override
  Widget build({
    BuildContext context,
  }) {
    return this;
  }

  @override
  bookCompletedProcess() {
    /*** Doesn't need implementation in this case. */
  }

  @override
  _BookCard createState() => bookCard;
}

class _BookCard extends State<BookCard> {
  static const double DEFAULT_PADDING_FACTOR = 0.24;
  static const double DEFAULT_BORDER_RADIUS_FACTOR = 1.7;
  static const double DEFAULT_LINE_HEIGHT_FACTOR = 0.73;
  static const double BOOK_COMPLETED_INDICATOR = 1.0;

  _BookCard();

  @override
  Widget build(BuildContext context) {
    return _getCardWidget(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getCardWidget(BuildContext context) {
    return Card(
        key: UniqueKey(),
        color: Colors.transparent,
        margin: EdgeInsets.all(
            (PADDING_FACTOR_10 * SizeConfig.imageSizeMultiplier)), // 10
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              (DEFAULT_BORDER_RADIUS_FACTOR * SizeConfig.imageSizeMultiplier)),
        ),
        elevation: (PADDING_FACTOR_10 * SizeConfig.imageSizeMultiplier), // 10
        child: (widget.type == BookCardType.add_option ||
                widget.type ==
                    BookCardType.without_add_option_and_progress_bar ||
                widget.type == BookCardType.book_card_in_grid)
            ? Stack(children: _getStackWidgets())
            : _getOptionCard());
  }

  _getStackWidgets() {
    return <Widget>[
      _getStackTopPart(),
      _getStackBottomPart(),
    ];
  }

  _getStackBottomPart() {
    if (widget.type == BookCardType.add_option) {
      return Positioned(
        top: PADDING_FACTOR_0,
        right: PADDING_FACTOR_0,
        child: AddButtonSmall(
          (widget.user.isInPendingList(widget.book.toLecture()) ||
                  widget.user.isInReadingList(widget.book.toLecture()))
              ? AddButtonSmall.iconChecked
              : AddButtonSmall.iconAdded,
          onButtonClicked: () {
            if (!widget.user.isInReadingList(widget.book.toLecture())) {
              if (!widget.user.isInPendingList(widget.book.toLecture())) {
                setState(() {
                  widget.user.addLectureToPendingList(widget.book.toLecture());
                  InfoToast.showBookAddedCorrectlyToast(widget.book.title);
                });
              }
            }
          },
        ),
      );
    } else if (widget.type ==
            BookCardType.without_add_option_and_progress_bar ||
        widget.type == BookCardType.book_card_in_grid) {
      return Positioned(
        bottom: (DEFAULT_PADDING_FACTOR * SizeConfig.imageSizeMultiplier),
        right: (DEFAULT_PADDING_FACTOR * SizeConfig.imageSizeMultiplier),
        left: (DEFAULT_PADDING_FACTOR * SizeConfig.imageSizeMultiplier),
        child: Center(
          child: LinearPercentIndicator(
            lineHeight:
                (DEFAULT_LINE_HEIGHT_FACTOR * SizeConfig.heightMultiplier), // 5
            percent: !widget.book.finished
                ? widget.book.progress
                : BOOK_COMPLETED_INDICATOR,
            progressColor:
                !widget.book.finished ? Colors.lightGreen : Colors.deepPurple,
          ),
        ),
      );
    }
  }

  _getStackTopPart() {
    if (widget.type == BookCardType.book_card_in_grid) {
      return Padding(
        padding: EdgeInsets.all(PADDING_FACTOR_0),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BookPage("title", widget.book, _getBooks())));
            },
            child: Image.network(
              widget.book.picture,
              fit: BoxFit.fill,
              height: (CONTAINER_FACTOR_200 * SizeConfig.heightMultiplier),
            ),
          ),
        ),
      );
    } else if (widget.type == BookCardType.add_option ||
        widget.type == BookCardType.without_add_option ||
        widget.type == BookCardType.without_add_option_and_progress_bar) {
      return Padding(
        padding: EdgeInsets.all(PADDING_FACTOR_0),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BookPage("title", widget.book, _getBooks())));
            },
            child: Image.network(widget.book.picture),
          ),
        ),
      );
    }
  }

  _getOptionCard() {
    return GestureDetector(
        onTap: () async {
          onOptionCardPressed();
        },
        child: OptionCard(widget.type));
  }

  onOptionCardPressed() async {
    if (widget.type == BookCardType.disover) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage(
                Book.getUserMockBooks(), User.getMockAlterantiveUsers())),
      );
    } else if (widget.type == BookCardType.view_all) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookshelfPage(widget.user)),
      );
    } else if (widget.type == BookCardType.add_custom_list) {
      var result = await showDialog(
        context: context,
        builder: (BuildContext context) => DialogWithInputText(
            'Add List Title:',
            'Add a custom list of books from your Bookshelf, and share it with your friends.\n\n',
            'List Title'),
      );
      if (result != DialogWithInputText.CANCEL_TAP) {
        await _pushAddCustomListPage(result);
      }
    } else if (widget.type == BookCardType.recommend_book) {
      _pushRecommendBooksPage();
    }
  }

  sendRecommendedBooks(List<Book> recommendedBooks) async {
    List<Recommendation> recommendations = new List();
    User recommender = Provider.of<User>(context, listen: false);
    for (Book book in recommendedBooks) {
      recommendations.add(new Recommendation(recommender, book));
    }
    // show popup and on accept send it to user.
    await showDialog(
      context: context,
      builder: (BuildContext context) => RecommendationDialog(
        Recommendation.getMockRecommendation(),
        type: ListType.send_recommendation_form,
        sendToUser: widget.user,
      ),
    );
    /**
     * Missing
     * This part will be implemented in futher steps.
     * */
  }

  _pushRecommendBooksPage() async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddCustomListPage(
              widget.user.bookshelf,
              "Recommendation",
              ListType.send_recommendation_form,
              sendRecommendedBooks: sendRecommendedBooks,
            )));
  }

  _pushAddCustomListPage(String listTitle) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddCustomListPage(
            widget.user.bookshelf, listTitle, ListType.add_custom_list)));
    if (result == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookshelfPage(
                  Provider.of<User>(context, listen: false),
                  scrollToLastPosition: true,
                )),
      );
    }
  }

  /*bookCompletedProcess() {
    setState(() {
      widget.user.moveLectureFromReadingListToReadList(widget.book);
      InfoToast.showFinishedCongratulationsMessage(widget.book.title);
    });
  }*/

  List<Book> _getBooks() {
    return Book.getAppMockBooks();
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }
}
