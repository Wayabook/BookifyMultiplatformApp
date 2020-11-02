import 'dart:async';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_info.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class RecommendationDialog extends StatefulWidget{

  List<Recommendation> _recommendations;

  RecommendationDialog(this._recommendations);

  @override
  _RecommendationDialog createState() => _RecommendationDialog();
}

class _RecommendationDialog
    extends State<RecommendationDialog> {


  Dialog alertDialog;
  double width;
  double height;
  ScrollController scrollController;
  List<Widget> widgets;
  Color _backgroundColor;
  List<Lecture> recommendationsAccepted;
  List<Book> keepingRecommendations;


  final TextEditingController inputController = TextEditingController();

  @override
  void initState(){

    super.initState();

    recommendationsAccepted = new List();
    keepingRecommendations = new List();
    scrollController = new ScrollController();
    _backgroundColor = kPrimaryLightColor;

    widgets = new List();

  }

  @override
  void dispose() {
    super.dispose();
  }

  void addOrDeleteRecommendation(Book recommendedBook, bool add){
    if(add){
      if(!recommendationsAccepted.contains(recommendedBook.toLecture())){
        recommendationsAccepted.add(recommendedBook.toLecture());
        keepingRecommendations.add(recommendedBook);
      }
    } else {
      if(recommendationsAccepted.contains(recommendedBook.toLecture())){
        recommendationsAccepted.remove(recommendedBook.toLecture());
        keepingRecommendations.remove(recommendedBook);
      }
    }
  }

  void onRecommendationsAccepted(){
    User user = Provider.of<User>(context, listen: false);
    setState(() {
      user.addListOfLecturesToLectureListByKey(recommendationsAccepted, 'Recommended');
      user.addListOfLecturesToLectureListByKey(recommendationsAccepted, 'Pending');
      user.addNewRecommendationsReceived(Recommendation.getRecommendationListFromBook(keepingRecommendations, user));
    });
    InfoToast.showRecommendationsSavedCorrectly();
    onRecommendationCanceled();
  }

  void onRecommendationCanceled(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    alertDialog = new Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 70,
                  child: Container(
                      width: width,
                      height: height - 70,
                      color: _backgroundColor,
                      child:  Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black
                          ),
                        ),
                      )
                  )
              ),

              ProfileInfo(widget._recommendations[0].recommendedBy, nameColor: kPrimaryDarkColor,),

              Padding(
                padding: EdgeInsets.fromLTRB(7, 140, 7, 10),
                child: Container(color: kPrimaryDarkColor, height: 2, width: width),
              ),

              Positioned(
                top: 150,
                left: 7,
                right: 7,
                child: Container(
                  width: width,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child:  Text(
                      ("Just recommended you " + widget._recommendations.length.toString() + " books."),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryDarkColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ),

              Positioned(
                  top: 180,
                  left: 7,
                  right: 7,
                  child: Container(
                    width: width,
                    height: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child:  Text(
                        ("Select the ones that you want to add to your Pending list!"),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  )
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 240, 0, 0),
                child: VerticalBookListSearch(
                  Recommendation.getRecommendedBooksFromRecommendations(widget._recommendations),
                  ListType.received_recommendation_form,
                  backgroundColor: kPrimaryLightColor,
                  onAcceptButtonTapped: onRecommendationsAccepted,
                  onCancelButtonTapped: onRecommendationCanceled,
                  addOrRemoveBook: addOrDeleteRecommendation,
                )
              )
            ],
          ),
        )
    );

    return alertDialog;
  }
}