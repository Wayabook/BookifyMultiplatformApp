import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/Models/Book.dart';
import 'package:bookifyapp/Models/Genre.dart';
import 'package:bookifyapp/Pages/add_custom_list_page.dart';
import 'package:bookifyapp/Pages/main_tab_page.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/LoginPages/Welcome/body.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class FirstTimeFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 40, 5, 10),
              child: Container(
                  color: kPrimaryLightColor,
                  child: Align(
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
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(10, 60, 10, 30),
              child: Container(
                height: MediaQuery.of(context).size.height - 90,
                //height: MediaQuery.of(context).size.height - 45,
                child: Center(
                  child: Card(
                      color: kPrimaryDarkColor,
                      child:  Swiper(
                        //containerHeight: 25.0,

                        itemBuilder: (BuildContext context, int index) {
                          //if(index == 0)
                          //  return GenresGrid(Genre.getMockGenres(), /*MediaQuery.of(context).size.height - 100 - 100 - 20*/);
                          return AddCustomListPage(Book.getUserMockBooks(), "Leidos", ListType.normal, removeBackButton: false,);
                        },
                        index: 0,
                        indicatorLayout: PageIndicatorLayout.COLOR,
                        containerHeight: double.infinity,
                        containerWidth: double.infinity,
                        //autoplay: false,
                        itemCount: 3,
                        pagination: SwiperPagination(
                          margin: new EdgeInsets.all(5.0),
                        ),
                        //pagination: null,
                        //control: null,
                        //viewportFraction: 0.1,
                        //scale: 0.9,
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}