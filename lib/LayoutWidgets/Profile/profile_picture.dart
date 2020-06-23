import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double circleRadius = 120.0;
  final double circleBorderWidth = 8.0;

  final String image_url;

  ProfilePicture(this.image_url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleRadius,
      height: circleRadius,
      decoration:
      ShapeDecoration(shape: CircleBorder(), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(circleBorderWidth),
        child: DecoratedBox(
          decoration: ShapeDecoration(
              shape: CircleBorder(),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                  ))),
        ),
      ),
    );
  }
}