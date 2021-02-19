import 'package:bookifyapp/Design/size_constants.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container_card.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:provider/provider.dart';

import '../../Design/SizeConfig.dart';

// ignore: must_be_immutable
class GenresGrid extends StatefulWidget {
  List<Genre> genres;

  GenresGrid(
    this.genres,
  );

  @override
  _GenresGrid createState() => _GenresGrid();
}

class _GenresGrid extends State<GenresGrid> with TickerProviderStateMixin {
  static const int EMPTY = 0;
  static const int WIDTH_FACTOR = 3;
  static const int HEIGHT_FACTOR = 4;
  static const int CROSS_AXIS_COUNT = 3;
  static const double GENRES_CONTAINER_FACTOR = 1.47;

  User user;
  bool showEditButton;
  List<Genre> genresOfInterest;

  @override
  initState() {
    genresOfInterest = new List();
    user = Provider.of<User>(context, listen: false);
    if (user.interestedGenres.length > EMPTY)
      genresOfInterest.addAll(user.interestedGenres);
    super.initState();
  }

  _setGenresList(index) {
    // Sets genres grid UI and user variable
    setState(() {
      Genre genre = widget.genres[index];
      if (genresOfInterest.contains(widget.genres[index])) {
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
    var containerWidth = (MediaQuery.of(context).size.width / WIDTH_FACTOR);
    var conainerHeight = (MediaQuery.of(context).size.height / HEIGHT_FACTOR);

    return GridView.count(
        key: UniqueKey(),
        shrinkWrap: true,
        crossAxisCount: CROSS_AXIS_COUNT,
        mainAxisSpacing: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
        crossAxisSpacing:
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), // 10
        children: List.generate(widget.genres.length, (index) {
          return GestureDetector(
              onTap: () {
                _setGenresList(index);
              },
              child: GenreContainer(
                widget.genres[index],
                genresOfInterest.contains(widget.genres[index]),
                width: (MediaQuery.of(context).size.width / WIDTH_FACTOR) -
                    (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
                height: (MediaQuery.of(context).size.height / HEIGHT_FACTOR) -
                    (GENRES_CONTAINER_FACTOR * SizeConfig.heightMultiplier),
                containerWidth: containerWidth,
                containerHeight: conainerHeight,
              ));
        }));
  }
}
