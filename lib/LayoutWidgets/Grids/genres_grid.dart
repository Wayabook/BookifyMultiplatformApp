import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import '../../Design/SizeConfig.dart';



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
        mainAxisSpacing: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
        crossAxisSpacing: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
        children: List.generate(widget.genres.length, (index) {
          return Container(
              width: (MediaQuery.of(context).size.width / 3),
              height: (MediaQuery.of(context).size.height / 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((4.86 * SizeConfig.imageSizeMultiplier)),
                color: genresOfInterest.contains(widget.genres[index]) ? kGreenLightColor : kSecondaryLightColor,
              ),
              child:  GestureDetector(
                  onTap: (){
                    _setGenresList(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                        genresOfInterest.contains(widget.genres[index]) ? (0.97 * SizeConfig.imageSizeMultiplier) : (0.48 * SizeConfig.imageSizeMultiplier)
                    ),
                    child: GenreContainer(
                      widget.genres[index], width: (MediaQuery.of(context).size.width / 3) - (2.43 * SizeConfig.widthMultiplier),
                      height: (MediaQuery.of(context).size.height / 4) - (1.47 * SizeConfig.heightMultiplier),
                    ),
                  )
              )
          );
        })
    );
  }

}