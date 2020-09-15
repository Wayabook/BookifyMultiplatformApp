import 'package:bookifyapp/InfoToast.dart';
import 'package:bookifyapp/LayoutWidgets/Dialogs/add_feedback_dialog.dart';
import 'package:bookifyapp/Models/Lecture.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';

class BookCardInVerticalList extends StatefulWidget {

  ButtonType buttonType;
  Lecture book;
  //Function(int, Lecture) changeLecturePositionContent;
  TickerProvider tickerProvider;

  int position;
  bool _visible;

  BookCardInVerticalList(this.book, this.buttonType, this.position, this.tickerProvider);

  @override
  _BookCardInVerticalList createState() => _BookCardInVerticalList(this.book, this.buttonType);

  hideTitles(){
    this._visible = false;
  }
}


class _BookCardInVerticalList extends State<BookCardInVerticalList> {

  //String chapter_title = "Nombre capitulo";
  BuildContext context;
  ButtonType buttonType;
  Lecture book;
  Card card;
  bool showEndLectureFrame = false;
  double initialHeight = 10.0;
  double initialWidth = 10.0;
  double buttonSize = 50.0;
  Widget content;
  bool visible;
  int animationControllerDuration;
  Color buttonColor;

  // Rotation controller
  AnimationController animationController;
  Animation<double> animation;

  // Confetti controller
  ConfettiController confettiController;


  _BookCardInVerticalList(this.book, this.buttonType);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState(){

    buttonColor = Colors.blueGrey;

    animationControllerDuration = 1500;
    widget._visible = true;
    animationController = AnimationController(
        duration: Duration(milliseconds: animationControllerDuration),
        vsync: widget.tickerProvider
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    )..addStatusListener((status) async {
      if(status == AnimationStatus.completed){
        setState(() {

          var user = Provider.of<User>(context, listen: false);
          user.increaseChapter(widget.book);

          if(this.book.finished){
            buttonSize = 75.0;
            widget._visible = false;
            this.buttonColor = Colors.lightGreen;
            bookCompletedProcess();
          } else {
            this.buttonColor = Colors.blueGrey;
          }
        });
        /*if(this.book.finished){
          await wait(1);

        }*/
      }
    });

    confettiController = new ConfettiController(
      duration: new Duration(seconds: 2),
    );

    super.initState();
  }

  void bookCompletedProcess(){
    //widget.changeLecturePositionContent(widget.position, widget.book);
    var user = Provider.of<User>(context, listen: false);
    user.moveLectureFromReadingListToReadList(book);
    InfoToast.showFinishedCongratulationsMessage(widget.book.title);
  }

  Future wait(seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => "1");
  }

  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width;
    this.context = context;
    if(this.book.finished){
      setState(() {
          confettiController.play();
          animationController.forward();
      });
    }

    return Card(
        elevation: 10,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:  GestureDetector(
          key: UniqueKey(),
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) => AddFeedbackDialog(this.book),
            ).whenComplete(() {
              if(this.book.finished){
                bookCompletedProcess();
              }
            });
          },
          child: ConfettiWidget(
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: confettiController,
            particleDrag: 0.05,
            emissionFrequency: 0.05,
            numberOfParticles: 25,
            gravity: 0.05,
            shouldLoop: false,
            colors: [
              Colors.green,
              Colors.red,
              Colors.yellow,
              Colors.blue,
            ],
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: _makeListTile(),
            ),
          )
        )
    );
  }

  _makeListTile()   {
    //bool aux = animationController.isAnimating;
    FloatingActionButton floatingActionButton = new FloatingActionButton(
      backgroundColor: Colors.white,
      child: RotationTransition(
        turns: animation,
        child: Icon(
          Icons.beenhere,
          color: !this.book.finished ? buttonColor : Colors.lightGreen,
          size: buttonSize,
        ),
      ),
      onPressed: () async {
        setState(() {
          buttonColor = Colors.lightGreen;
        });
        animationController.forward();
        /*setState(() {
          var user = Provider.of<User>(context, listen: false);
          user.increaseChapter(widget.book);
        });*/
      },
    );

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.circular(7.0)
        ),//Color.fromRGBO(64, 75, 96, .9),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 9,
                      child: Container(
                          width: 90,
                          //padding: EdgeInsets.only(right: 12.0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(width: 1.0, color: Colors.blueGrey),
                                  left: new BorderSide(width: .075, color: Colors.blueGrey),
                                  bottom: new BorderSide(width: .075, color: Colors.blueGrey),
                                  top: new BorderSide(width: .075, color: Colors.blueGrey)
                              )
                          ),

                          child: Container(
                              color: Colors.black,
                              height: 150,
                              width: double.infinity,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(
                                    book.picture
                                ),
                              )
                          )
                      ),
                    ),

                    Flexible(
                        flex: 1,
                        child: Center(
                          child: LinearPercentIndicator(
                            lineHeight: 5.0,
                            percent: !this.book.finished ? this.book.progress : 1.0,
                            progressColor: !this.book.finished ? Colors.lightGreen : Colors.deepPurple,
                          ),
                        )
                    )
                  ],
                ),
              ),

              Flexible(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    //color: Colors.black,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Center(
                            child: AnimatedOpacity(
                              // If the widget is visible, animate to 0.0 (invisible).
                              // If the widget is hidden, animate to 1.0 (fully visible).
                              opacity: widget._visible ? 1.0 : 0.0,
                              duration: Duration(milliseconds: animationControllerDuration),
                              // The green box must be a child of the AnimatedOpacity widget.
                              child: Center(
                                child: Container(
                                  child: Text(
                                    book.title,
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Flexible(
                          flex: 2,
                          child: AnimatedOpacity(
                            // If the widget is visible, animate to 0.0 (invisible).
                            // If the widget is hidden, animate to 1.0 (fully visible).
                            opacity: widget._visible  ? 1.0 : 0.0,
                            duration: Duration(milliseconds: animationControllerDuration),
                            // The green box must be a child of the AnimatedOpacity widget.
                            child: Center(
                              child: Text(
                                book.author,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        Flexible(
                          flex: 4,
                          child:  Align(
                              alignment: Alignment.bottomCenter,
                              child: AnimatedOpacity(
                                // If the widget is visible, animate to 0.0 (invisible).
                                // If the widget is hidden, animate to 1.0 (fully visible).
                                opacity: widget._visible  ? 1.0 : 0.0,
                                duration: Duration(milliseconds: animationControllerDuration),
                                // The green box must be a child of the AnimatedOpacity widget.
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[

                                        Icon(
                                          Icons.bookmark,
                                          color: Colors.blueGrey,
                                          size: 20,
                                        ),



                                        AutoSizeText(
                                          this.book.current_chapter_title.substring(0, 15) + "...",
                                          style: TextStyle( fontWeight: FontWeight.bold,),
                                          maxLines: 1,
                                        ),

                                        Visibility(
                                          visible: this.book.currentChapter != this.book.chapters.length - 1,
                                          maintainSize: false,
                                          maintainAnimation: false,
                                          maintainState: false,
                                          child:  AutoSizeText(
                                            "+" + (this.book.chapters.length - this.book.currentChapter - 1).toString(),
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Flexible(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 75,
                        width: 75,
                        child: floatingActionButton
                      )
                  )
              ),
            ],
          ),
        )
    );
  }
}