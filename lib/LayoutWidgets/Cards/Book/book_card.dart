import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Book/option_card.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/recommendation_dialog.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Pages/BookPage/book_page.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Pages/SearchPage/search_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:bookifyapp/Pages/bookshelf_page.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import '../../../InfoToast.dart';
import '../../../SizeConfig.dart';


class BookCard extends StatefulWidget {

  BuildContext context;
  BookCardType type;
  Lecture book;
  User user;

  BookCard(this.book, this.type, {this.user});

  BookCard.option(this.type, {this.user});

  @override
  _BookCard createState() => _BookCard(this.book, this.type, user: this.user);
}

class _BookCard extends State<BookCard>{

  BuildContext context;
  BookCardType type;
  Lecture book;
  User user;

  _BookCard(this.book, this.type, {this.user});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //return _getCard();
    return _getCardWidget();
  }

  @override
  void initState() {
    super.initState();
  }

  _getCardWidget(){
    return Card(
      key: UniqueKey(),
      color: Colors.transparent,
      margin: EdgeInsets.all((2.43 * SizeConfig.imageSizeMultiplier)), // 10
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((1.7 * SizeConfig.imageSizeMultiplier)),
      ),
      elevation: (2.43 * SizeConfig.imageSizeMultiplier), // 10
      child: (this.type == BookCardType.add_option ||
              this.type == BookCardType.without_add_option_and_progress_bar ||
              this.type == BookCardType.book_card_in_grid) ? Stack(children: _getStackWidgets()) : _getOptionCard()
    );
  }

  _getStackWidgets(){
    return <Widget>[
      _getStackTopPart(),
      _getStackBottomPart(),
    ];
  }

  _getStackBottomPart(){
    if(this.type == BookCardType.add_option) {
      return Positioned(
        top: 0,
        right: 0,
        child: AddButtonSmall(
          (this.user.isInPendingList(this.book.toLecture()) || this.user.isInReadingList(this.book.toLecture()))
              ? AddButtonSmall.iconChecked: AddButtonSmall.iconAdded,
          onButtonClicked: (){
            if(!this.user.isInReadingList(this.book.toLecture())){
              if(!this.user.isInPendingList(this.book.toLecture())){
                setState(() {
                  this.user.addLectureToPendingList(this.book.toLecture());
                  InfoToast.showBookAddedCorrectlyToast(widget.book.title);
                });
              }
            }
          },
        ),
      );
    } else if (this.type == BookCardType.without_add_option_and_progress_bar || this.type == BookCardType.book_card_in_grid) {
      return Positioned(
        bottom: (0.24 * SizeConfig.imageSizeMultiplier), // 1
        right: (0.24 * SizeConfig.imageSizeMultiplier),
        left: (0.24 * SizeConfig.imageSizeMultiplier),
        child: Center(
          child: LinearPercentIndicator(
            lineHeight: (0.73 * SizeConfig.heightMultiplier), // 5
            percent: !this.book.finished ? this.book.progress : 1.0,
            progressColor: !this.book.finished ? Colors.lightGreen : Colors.deepPurple,
          ),
        ),
      );
    }

  }

  _getStackTopPart(){
    if(this.type == BookCardType.book_card_in_grid){
      return  Padding(
        padding: EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BookPage("title", this.book, _getBooks())));
            },
            child: Image.network(
              this.book.picture, fit: BoxFit.fill, height: (29.28 * SizeConfig.heightMultiplier),
            ),
          ),
        ),
      );
    } else if (this.type == BookCardType.add_option ||
               this.type == BookCardType.without_add_option ||
               this.type == BookCardType.without_add_option_and_progress_bar){
      return Padding(
        padding: EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BookPage("title", this.book, _getBooks())));
            },
            child: Image.network(this.book.picture),
          ),
        ),
      );

  }
  }

  _getCard(){
    if(this.type == BookCardType.add_option){
      return Card(
        key: UniqueKey(),
        color: Colors.transparent,
        margin: EdgeInsets.all((2.43 * SizeConfig.imageSizeMultiplier)), // 10
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((1.7 * SizeConfig.imageSizeMultiplier)),
        ),
        elevation: (2.43 * SizeConfig.imageSizeMultiplier), // 10
        child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => BookPage("title", this.book, _getBooks())));
                    },
                    child: Image.network(this.book.picture),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: AddButtonSmall(
                  (this.user.isInPendingList(this.book.toLecture()) || this.user.isInReadingList(this.book.toLecture()))
                      ? AddButtonSmall.iconChecked: AddButtonSmall.iconAdded,
                  onButtonClicked: (){
                    if(!this.user.isInReadingList(this.book.toLecture())){
                      if(!this.user.isInPendingList(this.book.toLecture())){
                        setState(() {
                          this.user.addLectureToPendingList(this.book.toLecture());
                          InfoToast.showBookAddedCorrectlyToast(widget.book.title);
                        });
                      }
                    }
                  },
                ),
              )
            ]
        ),
      );
    } else if (this.type == BookCardType.without_add_option) {
      return Card(
        key: UniqueKey(),
        color: Colors.transparent,
        margin: EdgeInsets.all((2.43 * SizeConfig.imageSizeMultiplier)), // 10
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((1.7 * SizeConfig.imageSizeMultiplier)),
        ),
        elevation: (2.43 * SizeConfig.imageSizeMultiplier), // 10
        child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => BookPage("title", this.book,
                              _getBooks())));
                    },
                    child: Image.network(this.book.picture),
                  ),
                ),
              ),
            ]
        ),
      );
    } else if (this.type == BookCardType.without_add_option_and_progress_bar) {
      return Card(
        key: UniqueKey(),
        color: Colors.transparent,
        margin: EdgeInsets.all((2.43 * SizeConfig.imageSizeMultiplier)), // 10
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((1.7 * SizeConfig.imageSizeMultiplier)),
        ),
        elevation: (2.43 * SizeConfig.imageSizeMultiplier), // 10
        child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                          MaterialPageRoute(builder: (context) => BookPage(
                              "title", this.book, _getBooks())));
                    },
                    child: Image.network(
                        this.book.picture),
                  ),
                ),
              ),

              Positioned(
                bottom: (0.24 * SizeConfig.imageSizeMultiplier), // 1
                right: (0.24 * SizeConfig.imageSizeMultiplier),
                left: (0.24 * SizeConfig.imageSizeMultiplier),
                child: Center(
                  child: LinearPercentIndicator(
                    lineHeight: (0.73 * SizeConfig.heightMultiplier), // 5
                    percent: !this.book.finished ? this.book.progress : 1.0,
                    progressColor: !this.book.finished ? Colors.lightGreen : Colors.deepPurple,
                  ),
                ),
              )
            ]
        ),
      );
    } else if (this.type == BookCardType.book_card_in_grid){
      return Card(
        key: UniqueKey(),
        color: Colors.transparent,
        margin: EdgeInsets.all((2.43 * SizeConfig.imageSizeMultiplier)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.45 * SizeConfig.imageSizeMultiplier),
        ),
        elevation: (2.43 * SizeConfig.imageSizeMultiplier), // 10
        child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => BookPage("title", this.book, _getBooks())));
                    },
                    child: Image.network(
                      this.book.picture, fit: BoxFit.fill, height: (29.28 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 1,
                right: 1,
                left: 1,
                child:  Center(
                  child: LinearPercentIndicator(
                    //width: double.infinity,
                    lineHeight: (0.73 * SizeConfig.heightMultiplier), //
                    percent: !this.book.finished ? this.book.progress : 1.0,
                    progressColor: !this.book.finished ? Colors.lightGreen : Colors.deepPurple,
                  ),
                ),
              )
            ]
        ),
      );
    } else {
      return GestureDetector(
        onTap: () async {
          onOptionCardPressed();
        },
        child: OptionCard(this.type)
      );

    }
  }

  _getOptionCard(){
    return GestureDetector(
        onTap: () async {
          onOptionCardPressed();
        },
        child: OptionCard(this.type)
    );
  }

  onOptionCardPressed() async {
    if(this.type == BookCardType.disover){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    } else if (this.type == BookCardType.view_all){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookshelfPage(this.user)),
      );
    } else if (this.type == BookCardType.add_custom_list){
      var result = await showDialog(
        context: context,
        builder: (BuildContext context) => DialogWithInputText(
            'Add List Title:',
            'Add a custom list of books from your Bookshelf, and share it with your friends.\n\n',
            'List Title'
        ),
      );
      if(result != DialogWithInputText.CANCEL_TAP){
        await _pushAddCustomListPage(result);
      }
    } else if(this.type == BookCardType.recommend_book){
      _pushRecommendBooksPage();
    }

  }

  sendRecommendedBooks(List<Book> recommendedBooks) async {
    List<Recommendation> recommendations = new List();
    User recommender = Provider.of<User>(context, listen: false);
    for(Book book in recommendedBooks){
      recommendations.add(new Recommendation(recommender, book));
    }
    // show popup and on accept send it to user.
    await showDialog(
        context: context,
        builder: (BuildContext context) => RecommendationDialog(
            Recommendation.getMockRecommendation(), type: ListType.send_recommendation_form, sendToUser: this.user,),
    );
    /**
     * Missing
     * This part will be implemented in futher steps.
     * */
  }

  _pushRecommendBooksPage() async{
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>
        AddCustomListPage(
            this.user.bookshelf,
            "Recommendation",
            ListType.send_recommendation_form,
            sendRecommendedBooks: sendRecommendedBooks,
        )));
  }

  _pushAddCustomListPage(String listTitle) async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddCustomListPage(this.user.bookshelf, listTitle, ListType.add_custom_list)));
    if(result == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookshelfPage(Provider.of<User>(context, listen: false), scrollToLastPosition: true,)),
      );
      //Navigator.pop(context);
    }
  }

  List<Book> _getBooks(){
    return Book.getAppMockBooks();
  }
}

