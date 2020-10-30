import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Enums/list_type.dart';
import 'package:bookifyapp/InfoToast.dart';
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
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class FirstTimeFormPage extends StatefulWidget{

  FirstTimeFormPage();

  @override
  _FirstTimeFormPage createState() => _FirstTimeFormPage();
}

class _FirstTimeFormPage extends State<FirstTimeFormPage> with TickerProviderStateMixin{

  SwiperController _swiperController = new SwiperController();
  int _swiperIndex = 0;
  IconData _icon = Icons.arrow_forward_ios;
  Color _floatingActionButtonColor = kPrimaryLightColor;

  // Rotation controller
  AnimationController animationController;
  int animationControllerDuration;
  Animation<double> animation;

  _goToMainTabPage(BuildContext context){
    InfoToast.showInterestsSavedCorrectly();
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
  void initState() {
    super.initState();

    animationControllerDuration = 1500;
    animationController = AnimationController(
        duration: Duration(milliseconds: animationControllerDuration),
        vsync: this
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    )..addStatusListener((status) async {
      if(status == AnimationStatus.completed){
        setState(() {
          _floatingActionButtonColor = Colors.yellow;
          _icon = Icons.send;
        });
      }
    });
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
                        physics: NeverScrollableScrollPhysics(),
                        controller: _swiperController,
                        //index: 0,
                        indicatorLayout: PageIndicatorLayout.SCALE,
                        containerHeight: double.infinity,
                        containerWidth: double.infinity,
                        //autoplay: false,
                        itemCount: 4,
                        pagination: SwiperPagination(
                          margin: new EdgeInsets.all(5.0),
                          builder: new DotSwiperPaginationBuilder(
                          color: Colors.grey, activeColor: Colors.blue),
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
                            title = "Elija Generos de su Interes:";
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
              child: FloatingActionButton(
                heroTag: UniqueKey(),
                backgroundColor: _floatingActionButtonColor,
                child: RotationTransition(
                  turns: animation,
                  child: Icon(
                    _icon,
                    color:kPrimaryDarkColor
                  ),
                ),
                onPressed: () {
                  //var aux = _swiperController.complete();
                  if(_swiperIndex != 3){
                    _swiperIndex += 1;
                    _swiperController.move(_swiperIndex);
                    if(_swiperIndex  == 3){
                      setState(() {
                        animationController.forward();
                        //_floatingActionButtonColor = Colors.yellow;
                        //_icon = Icons.send;
                      });
                    }
                  } else {
                    _goToMainTabPage(context);
                  }
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}