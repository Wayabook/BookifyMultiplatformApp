import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BookPage extends StatelessWidget {
  final String title;

  const BookPage(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Scaffold(
      body: Container(
        child: ExampleHorizontal(),
      ),
      appBar: AppBar(title: text),
    );
  }
}

class ExampleHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey,
        body: new Swiper(
          containerHeight: 25.0,
          itemBuilder: (BuildContext context, int index) {
            var color = Colors.white12;

            if(index == 0)
              color = Colors.brown;

            if(index == 1)
              color = Colors.red;


            return  new Container(
              color: color,
              width: 20,
              height: 20,
            );
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: 3,
          pagination: null,
          control: null,
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }
}