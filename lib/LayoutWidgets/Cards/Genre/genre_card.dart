import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Cards/Genre/genre_container.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {

  Genre genre;
  bool addGenreCard;
  int index;
  Function (ButtonType buttonType, BuildContext context, {String title}) onAddGenrePressed;

  GenreCard(this.genre, {this.addGenreCard = false, this.index = 0, this.onAddGenrePressed});

  @override
  Widget build(BuildContext context) {
    //this.context = context;
    if(addGenreCard){
      return GestureDetector(
        onTap: () {
          onAddGenrePressed(ButtonType.edit_genres_list, context);
        },
        child: Card(
          margin: EdgeInsets.all((1.46 * SizeConfig.heightMultiplier)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                (4.86 * SizeConfig.imageSizeMultiplier)
            ),
          ),
          elevation: (1.46 * SizeConfig.heightMultiplier),
          child: Container(
              width: (26.76 * SizeConfig.widthMultiplier),
              //height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      (4.86 * SizeConfig.imageSizeMultiplier)
                  ),
                  color: kPrimaryLightColor
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: kPrimaryDarkColor,
                        size: (12.16 * SizeConfig.imageSizeMultiplier),
                      ),

                      Text("Add Genre",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kPrimaryDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
              )
          ),
        ),
      );
    } else {
      return Card(
          color: kPrimaryDarkColor,
          margin: EdgeInsets.all((1.46 * SizeConfig.heightMultiplier)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                (4.86 * SizeConfig.imageSizeMultiplier)
            ),
          ),
          elevation: (1.46 * SizeConfig.heightMultiplier),
          child: Row(
            children: <Widget>[
              Container(
                  width: (12.16 * SizeConfig.widthMultiplier),
                  height: (53.52 * SizeConfig.widthMultiplier),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: BorderedText(
                      strokeWidth: 1.0,
                      strokeColor: kPrimaryLightColor,
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                            color: kPrimaryDarkColor,
                            decoration: TextDecoration.none,
                            //decorationColor: Colors.,
                            decorationThickness: 1
                        ),
                      ),
                    ),
                  )
              ),

              GenreContainer(this.genre)
            ],
          )
      );
    }
  }
}