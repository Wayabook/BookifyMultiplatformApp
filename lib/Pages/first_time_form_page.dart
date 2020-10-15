import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Pages/main_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Welcome/body.dart';

class FirstTimeFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 40, 10, 5),
          child:  Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainTabPage();
                        },
                      ),
                    );
                  },
                  child: SmallButtonUnderlined("Skip", textColor: kPrimaryDarkColor,),
                ),
              ),

              GenresGrid(Genre.getMockGenres())
            ],
          ),
        )
      ),
    );
  }
}