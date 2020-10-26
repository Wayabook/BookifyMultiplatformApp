import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/LayoutWidgets/Buttons/small_button_underlined.dart';
import 'package:bookifyapp/LayoutWidgets/Grids/genres_grid.dart';
import 'package:bookifyapp/LayoutWidgets/Lists/list_title.dart';
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

  SwiperController _swiperController = new SwiperController();

  _goToMainTabPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainTabPage();
        },
      ),
    );
  }

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
                        _goToMainTabPage(context);
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
                        controller: _swiperController,
                        index: 0,
                        indicatorLayout: PageIndicatorLayout.SCALE,
                        containerHeight: double.infinity,
                        containerWidth: double.infinity,
                        //autoplay: false,
                        itemCount: 4,
                        pagination: SwiperPagination(
                          margin: new EdgeInsets.all(5.0),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          String title = "";
                          String lectureList = "";
                          if(index == 1){
                            title = "Seleccione Libros Leidos:";
                            lectureList = 'Read';
                          } else if (index == 2) {
                            title = "Seleccione Libros Interesantes:";
                            lectureList = 'Pending';
                          } else if (index == 3) {
                            title = "Seleccione Lecturas en Curso:";
                            lectureList = 'Reading';
                          } else {
                            title = "Elija Generos de Interes:";
                          }


                          if(index >= 1 && index <= 3){
                            return AddCustomListPage(
                              Book.getUserMockBooks(),
                              title,
                              ListType.first_time_form,
                              removeBackButton: false,
                              specificUserBookList: lectureList,
                            );
                          } else {
                            return Center(
                              child: Column(
                                children: [
                                  ListTitle(title, fontSize: 22,),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: GenresGrid(Genre.getMockGenres(),
                                      )
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      )
                  ),
                ),
              ),
            ),

            Positioned(
              right: 10,
              bottom: 15,
              //padding: EdgeInsets.fromLTRB(0, 0, 15, 70),
              child: FloatingActionButton(
                heroTag: "NEXTFABBUTTON",
                onPressed: (){
                  var aux = _swiperController.index;
                  if(_swiperController.index != 3){
                    //_swiperController.move(_swiperController.index + 1);
                    _swiperController.next();
                  } else {
                    _goToMainTabPage(context);
                  }

                  //_navigateToCommentsPage(context);
                },
                backgroundColor: kPrimaryLightColor,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryDarkColor,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}