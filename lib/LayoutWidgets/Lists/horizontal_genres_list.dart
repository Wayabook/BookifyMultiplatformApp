import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/genre_card.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Pages/book_page.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/add_button_small.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:bordered_text/bordered_text.dart';

class HorizontalGenresList extends StatelessWidget {

  List<Genre> genres;
  BuildContext context;
  ListType type;

  HorizontalGenresList(this.genres, this.type);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        color: kPrimaryDarkColor,
        child: _createListView(),
      ),
    );
  }


  _createListView(){
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.type == ListType.add_genre ?  genres.length + 1: genres.length,
        itemBuilder: (BuildContext context, int index) {
            if(index < genres.length){
              return GenreCard(genres[index], addGenreCard: false, index: index,);
            } else {
              return GenreCard(null, addGenreCard: true,);
            }
        },
      ),
    );
  }
}

