import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_card.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Enums/list_type.dart';

class HorizontalGenresList extends StatelessWidget {

  List<Genre> genres;
  List<Widget> items;
  BuildContext context;
  ListType type;
  Function (ButtonType buttonType, BuildContext context, {String title}) onTitleButtonPressed;

  HorizontalGenresList(this.genres, this.type, {this.onTitleButtonPressed});

  _createListItems(){
    items  = new List();
    for(int i=0; i < genres.length; i++)
      items.add(GenreCard(genres[i], addGenreCard: false, index: i,));

    if(type == ListType.add_genre){
      items.add(GenreCard(null, addGenreCard: true, onAddGenrePressed: onTitleButtonPressed,));
    }
  }

  @override
  Widget build(BuildContext context) {


    this.context = context;
    _createListItems();
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(
            (1.21 * SizeConfig.widthMultiplier),
            0,
            (1.21 * SizeConfig.widthMultiplier),
            (1.46 * SizeConfig.heightMultiplier)
        ),
        color: kPrimaryDarkColor,
        child: _createListView(),
      ),
    );
  }


  _createListView(){
    return Container(
      height: (14.64 * SizeConfig.heightMultiplier),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
            return items[index];
        },
      ),
    );
  }
}

