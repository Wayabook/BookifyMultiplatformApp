import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/vertical_book_list_search.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_info.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/Recommendation.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class RecommendationDialog extends StatefulWidget{

  List<Recommendation> _recommendations;
  User sendToUser;
  ListType type;

  RecommendationDialog(this._recommendations, {
    this.type = ListType.received_recommendation_form,
    this.sendToUser,
  });

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

  _getReceivedRecommendationStack(){
    return Stack(
      children: <Widget>[
        Positioned(
            top: (10.24 * SizeConfig.heightMultiplier), //70
            child: Container(
                width: width,
                height: height - (10.24 * SizeConfig.heightMultiplier), //70
                color: _backgroundColor,
                child:  Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: (5.83 * SizeConfig.imageSizeMultiplier),
                    ),
                  ),
                )
            )
        ),

        ProfileInfo(widget._recommendations[0].recommendedBy, nameColor: kPrimaryDarkColor,),

        Padding(
          padding: EdgeInsets.fromLTRB(
              (1.7 * SizeConfig.imageSizeMultiplier), //7
              (20.49 * SizeConfig.heightMultiplier), //140
              (1.7 * SizeConfig.imageSizeMultiplier), //7
              (2.43 * SizeConfig.widthMultiplier), //10
          ),
          child: Container(
              color: kPrimaryDarkColor,
              height: (0.29 * SizeConfig.heightMultiplier), //2
              width: width
          ),
        ),

        Positioned(
            top: (24.54 * SizeConfig.heightMultiplier), //150
            left: (1.7 * SizeConfig.imageSizeMultiplier), //7
            right: (1.7 * SizeConfig.imageSizeMultiplier), //7
            child: Container(
              width: width,
              height: (12.16 * SizeConfig.imageSizeMultiplier), //50
              child: Align(
                alignment: Alignment.center,
                child:  Text(
                  ("Just recommended you " + widget._recommendations.length.toString() + " books."),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryDarkColor,
                    fontSize: (2.92 * SizeConfig.heightMultiplier), //20
                  ),
                ),
              ),
            )
        ),

        Positioned(
            top: (29.45 * SizeConfig.heightMultiplier), //180
            left: (1.7 * SizeConfig.imageSizeMultiplier), //7
            right: (1.7 * SizeConfig.imageSizeMultiplier), //7
            child: Container(
              width: width,
              height: (12.16 * SizeConfig.imageSizeMultiplier),//50
              child: Align(
                alignment: Alignment.center,
                child:  Text(
                  ("Select the ones that you want to add to your Pending list!"),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: (1.75 * SizeConfig.heightMultiplier), //12
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            )
        ),

        Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                (35.13 * SizeConfig.heightMultiplier), //240
                0,
                0
            ),
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
    );
  }

  _getSendRecommendationStack(){
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
            top: (7.32 * SizeConfig.heightMultiplier), // 50
            left: (2.43 * SizeConfig.widthMultiplier), //10
            child: Container(
                width: width,
                height: (23.42 * SizeConfig.heightMultiplier), //160
                color: _backgroundColor,
            )
        ),

        Positioned(
          top: 0,
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.card_giftcard,
              color: kPrimaryDarkColor,
              size: (14.64 * SizeConfig.heightMultiplier), //100
            ),
          ),
        ),

        Positioned(
            top: (14.64 * SizeConfig.heightMultiplier), //100
            left: (2.43 * SizeConfig.widthMultiplier), //10
            right: (2.43 * SizeConfig.widthMultiplier), //10
            child: Container(
              width: width,
              height: (12.16 * SizeConfig.imageSizeMultiplier), //50
              color: kPrimaryLightColor,
              child: Align(
                alignment: Alignment.center,
                child:  Text(
                  ("Recommend "
                      + widget._recommendations.length.toString()
                      + " books to "
                      + widget.sendToUser.name
                      + "?"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryDarkColor,
                    fontSize: (2.92 * SizeConfig.heightMultiplier), //20
                  ),
                ),
              ),
            )
        ),

        Positioned(
          top: (24.54 * SizeConfig.heightMultiplier), //150
          left: (2.43 * SizeConfig.widthMultiplier), //10
          right: (2.43 * SizeConfig.widthMultiplier), //10
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: _getAcceptButton()
              ),
              Expanded(
                  flex: 5,
                  child: _getCancelButton()
              )
            ],
          ),
        )


      ],
    );
  }

  _getAcceptButton(){
    return FlatButton(
        child: Text(
            "Accept",
            style: TextStyle(
              color: Colors.blue,
              fontSize: (2.05 * SizeConfig.textMultiplier), //14
            )
        ),
        onPressed: () async {
          Navigator.pop(context);
        }
    );
  }

  _getCancelButton(){
    return FlatButton(
      child: Text(
          "Cancel",
          style: TextStyle(
            color: Colors.red,
            fontSize: (2.05 * SizeConfig.textMultiplier), //14
          )
      ),
      onPressed: () {
        Navigator.pop(context);
        /*if(widget.type == ListType.received_recommendation_form || widget.type == ListType.send_recommendation_form){
          widget.onCancelButtonTapped();
        } else {
          Navigator.pop(context);
        }**/
      },
    );
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
          child: widget.type == ListType.received_recommendation_form ?
          _getReceivedRecommendationStack() : _getSendRecommendationStack()
        )
    );

    return alertDialog;
  }
}