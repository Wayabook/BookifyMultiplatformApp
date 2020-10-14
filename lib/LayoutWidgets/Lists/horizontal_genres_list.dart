import 'package:bookifyapp/Design/constants.dart';
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
          /*if(this.type == ListType.add_genre)
          {*/
            if(index < genres.length){
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
                          /*Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            //height: double.infinity,
                          ),
                        ),*/
                          //Icon(Icons.filter_1)
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
                                  "images/" + genres[index].picture,
                                  height: 50,
                                  width: 50,
                                ),

                                Text(genres[index].name,
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
            } else {
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
            }
        },
      ),
    );
  }
}

