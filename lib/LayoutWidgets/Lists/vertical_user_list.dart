import 'package:bookifyapp/Enums/profile_type.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookifyapp/Models/User.dart';
import 'package:bookifyapp/Enums/button_type.dart';
import 'package:bookifyapp/LayoutWidgets/Profile/profile_picture.dart';
import 'package:bookifyapp/Pages/profile_page.dart';



class VerticalUserList extends StatefulWidget {

  VerticalUserList(this.users); // : super(key: key);

  final List<User> users;
  /*final List<Book> readingBooks;
  final List<Book> pendingBooks;*/

  @override
  _VerticalUserList createState() => _VerticalUserList();
}

class _VerticalUserList extends State<VerticalUserList> {

  //String _chapter_title = "2048 personas han guardado este libro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, //Color.fromRGBO(58, 66, 86, 1.0),
      //appBar: topAppBar,
      body: _makeBody(),
      //bottomNavigationBar: makeBottom,

    );
  }

  _makeListTile(index) {
    final double circleRadius = 120.0;
    final double circleBorderWidth = 8.0;
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
                child: ProfilePicture("https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg"),
              ),

              Flexible(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    //color: Colors.black,
                    //height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          widget.users[index].name,
                          style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30,),
                          maxLines: 1,
                       ),
                     ],

                      /*AutoSizeText(
                        _chapter_title.substring(0, 18) + "...",
                        style: TextStyle( fontWeight: FontWeight.bold,),
                        maxLines: 1,
                      ),*/
                    ),

                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  _makeCard(int index) {
    return  GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage(widget.users[index], ProfileType.friend_profile)));
      },
      child: Card(
        /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),*/
        elevation: 10,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:  Container(
          height: 120,
          /*height: 160,*/
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: _makeListTile(index),
        ),
      ),
    );
  }

  _makeBody() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.users.length,
        itemBuilder: (BuildContext context, int index) {
          return _makeCard(index);
        },
      ),
    );
  }

/*_makeHeader(String title){
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 2, 0),
            child:  Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Container(color: Colors.white, height: 2, width: width),
          ),
        ],
      ),
    );
  }*/
}