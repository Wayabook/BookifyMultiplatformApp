import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {

  Genre genre;
  bool addGenreCard;
  int index;

  GenreCard(this.genre, {this.addGenreCard = false, this.index = 0});

  @override
  Widget build(BuildContext context) {
    //this.context = context;
    if(addGenreCard){
      return GestureDetector(
        onTap: () {
          /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );*/
        },
        child: Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          child: Container(
              width: 110,
              //height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                        size: 50,
                      ),

                      Text("Add Genre",
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
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          child: Row(
            children: <Widget>[
              Container(
                  width: 50,
                  height: 100,
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

              Container(
                  width: 110,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryLightColor
                  ),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "images/" + genre.picture,
                            height: 50,
                            width: 50,
                          ),

                          Text(genre.name,
                            style: TextStyle(
                              color: kPrimaryDarkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                  )
              ),
            ],
          )
      );
    }
  }
}