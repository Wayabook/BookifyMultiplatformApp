import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {

  final double circleRadius;
  final double circleBorderWidth;

  final String image_url;

  ProfilePicture(this.image_url, {this.circleRadius = 120.0, this.circleBorderWidth = 5.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.circleRadius == 120.0 ? EdgeInsets.all(0) : EdgeInsets.all(3),
      child: Container(
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
                      this.image_url,
                    ))),
          ),
        ),
      ),
    );
  }
}