import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/book_card_type.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/book_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/genre_card.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/genre_container.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/user_preview_card.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_accept_and_cancel_options.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/dialog_with_input_text.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Pages/profile_page.dart';
import 'package:provider/provider.dart';



class GenresGrid extends StatefulWidget {

  List<Genre> genres;

  GenresGrid(this.genres,);

  @override
  _GenresGrid createState() => _GenresGrid();
}

class _GenresGrid extends State<GenresGrid> with TickerProviderStateMixin{

  User user;
  bool showEditButton;
  List<Genre> genresOfInterest;

  @override
  initState() {
    genresOfInterest = new List();
    user = Provider.of<User>(context, listen: false);
    if(user.interestedGenres.length > 0)
      genresOfInterest.addAll(user.interestedGenres);
    super.initState();
  }

  _setGenresList(index){
    // Sets genres grid UI and user variable
    setState(() {
      Genre genre = widget.genres[index];
      if(genresOfInterest.contains(widget.genres[index])){
        genresOfInterest.remove(genre);
        user.removeGenreFromInterestedGenres(genre);
      } else {
        genresOfInterest.add(genre);
        user.addGenreToInterestedGenres(genre);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        key: UniqueKey(),
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        //childAspectRatio:  3 / 4,
        children: List.generate(widget.genres.length, (index) {
          return Container(
              width: (MediaQuery.of(context).size.width / 3),
              height: (MediaQuery.of(context).size.height / 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: genresOfInterest.contains(widget.genres[index]) ? kGreenLightColor : kSecondaryLightColor,
              ),
              child:  GestureDetector(
                  onTap: (){
                    _setGenresList(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(genresOfInterest.contains(widget.genres[index]) ? 4 : 2),
                    child: GenreContainer(widget.genres[index], width: (MediaQuery.of(context).size.width / 3) -10 , height: (MediaQuery.of(context).size.height / 4) - 10, ),
                  )
              )
          );
        })
    );
  }

}