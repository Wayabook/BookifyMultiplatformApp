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
        appBar: AppBar(
          title: Text("ExampleHorizontal"),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return  new Container(
              color: Colors.white12,
              width: 20,
              height: 20,
            );
          },

          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: 3,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}