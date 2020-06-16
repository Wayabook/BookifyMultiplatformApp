import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/Pages/search_page.dart';
import 'package:flutter/painting.dart';


class ReadingPage extends StatelessWidget {
  final Color color;
  final String text;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ReadingPage(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListPage(title: "Title"), /*Column(
          children: <Widget>[
            Container(
              color: color,
              child:  Text(
                this.text,
                style: optionStyle,
              ),
            ),
          ],
        ),*/
        appBar: AppBar(
          title: Text(this.text),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: Icon(Icons.search)
            )
          ],
        ),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    /*final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );*/

    final makeListTile = Container(
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.circular(7.0)
      ),//Color.fromRGBO(64, 75, 96, .9),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.blueGrey),
                    left: new BorderSide(width: .075, color: Colors.blueGrey),
                    bottom: new BorderSide(width: .075, color: Colors.blueGrey),
                    top: new BorderSide(width: .075, color: Colors.blueGrey)
                )
              ),

              child: Container(
                    height: 150,
                    width: 100,
                    child: Image.network("https://imagessl3.casadellibro.com/a/l/t0/73/9788490628973.jpg"),
                ) //Icon(Icons.autorenew, color: Colors.white),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                //color: Colors.black,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        child: Text(
                          "En los Zapatos de Valeria",
                          style: TextStyle(
                            //color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        "Elisabeth Benavent",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      "Capitulo 1 +27",
                      style: TextStyle(
                        //color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),

                  ],
                ),
              ),
            ),


            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ],
        ),
      )
    );

    /*ListTile(
        //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          //padding: EdgeInsets.only(right: 12.0),
          /*decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),*/
          child: Container(
            height: 200,
            width: 200,
            color: Colors.white,
          ) //Icon(Icons.autorenew, color: Colors.white),
        ),
        /*title: Text(
          "Introduction to Driving",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" Intermediate", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)*/);*/


    final makeCard = Card(
      /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),*/
      elevation: 10,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child:  Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: makeListTile,
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeCard;
        },
      ),
    );



    return Scaffold(
      backgroundColor: Colors.blueGrey, //Color.fromRGBO(58, 66, 86, 1.0),
      //appBar: topAppBar,
      body: makeBody,
      //bottomNavigationBar: makeBottom,

    );
  }
}