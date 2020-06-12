import 'package:bookifyapp/Models/Book.dart';
import 'package:flutter/material.dart';
import 'package:bookifyapp/LayoutWidgets/arc_banner_image.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/book_cover.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/info_row.dart';
import 'package:bookifyapp/LayoutWidgets/BookWidgets/row_type.dart';

class BookPage extends StatelessWidget {
  final String title;
  final Book book;

  const BookPage(this.title, this.book) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');

    return Scaffold(
      body: Container(
        //child:  _createListView(),
        child: _buildBookPage(context),
      ),
      appBar: AppBar(title: text),
    );
  }

  _buildBookPage(BuildContext context){

    double width = MediaQuery.of(context).size.width;
    //double horizontal_margin = (width - (3 * 105)) / 2;
    double width_per_child = (width - 30 - (10 * 2)) / 3;
    var textTheme = Theme.of(context).textTheme;
    var theme = Theme.of(context);


    return ListView(
      children: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140.0),
              child: ArcBannerImage(this.book.picture),
            ),
            Positioned(
              bottom: 30.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BookCover(
                    book,
                    height: 180.0,
                  ),
                  //SizedBox(width: 16.0),
                  //Expanded(child: movieInformation),
                ],
              ),
            ),
          ],
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                      )
                  ),
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white
                    ),
                  ),
                  //Icon(Icons.add_circle_outline),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon: Icon(
                      Icons.shop_two,
                      color: Colors.white
                    ),

                  ),
                  //Icon(Icons.add_circle_outline),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        )
                  ),
                  color: Colors.blueGrey,
                  child: IconButton(
                    icon:Icon(
                        Icons.comment,
                        color: Colors.white
                    ),

                  ),
                  //Icon(Icons.add_circle_outline),
                ),
              ),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[

              InfoRow(RowType.image,  "GENDER", "images/genre1.png",  "Romance", width_per_child, 105),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              InfoRow(RowType.text,  "PUBLICATION", "2017",  "Year", width_per_child, 105),

              Container(color: Colors.blueGrey, height: 105, width: 2,),

              InfoRow(RowType.text,  "EXTENSION", "128",  "Pages", width_per_child, 105),


            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(color: Colors.blueGrey, height: 2, width: width),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
                'Story line',
                 style: textTheme.subhead.copyWith(fontSize: 18.0),
             ),

            SizedBox(height: 8.0),

            Text(
              "Una isla desconocida. Un enigmático mensaje. Ningún recuerdo. Amnésico, magullado y con la sensación de que todo el mundo sabe lo que sucede menos él, el protagonista de esta historia se embarcará en una aventura sin igual que le llevará a adentrarse en los confines de su existencia. Durante su confuso viaje se topará con una serie de extravagantes personajes que intentarán ayudarle en su empeño por ver una realidad que, en muchas ocasiones, superará la ficción. Así da comienzo un libro enmarcado en un universo mágico en el que seremos testigos de cómo los anhelos más profundos y los miedos más oscuros cobran vida, atreviéndose incluso a mirarnos directamente a los ojos.El esperado debut literario de Coque Macho.",
              style: textTheme.body1.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
              ),
            ),


        // No expand-collapse in this tutorial, we just slap the "more"
        // button below the text like in the mockup.
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'more',
                  style: textTheme.body1
                  .copyWith(fontSize: 16.0, color: theme.accentColor),
                ),

                Icon(
                  Icons.keyboard_arrow_down,
                  size: 18.0,
                  color: theme.accentColor,
                ),
             ],
            ),
          ],
        ),

      ],
    );
  }


}

