import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/SizeConfig.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {

  double circleRadius;
  double circleBorderWidth;
  bool withoutEdges;

  final String image_url;

  ProfilePicture(this.image_url, {this.circleRadius = 120.0, this.circleBorderWidth = 5.0});

  _initializeDimensions(){
    withoutEdges = this.circleRadius == 120.0;
    if(this.circleRadius == 120.0)
      this.circleRadius = 29.19 * SizeConfig.imageSizeMultiplier;
    if(this.circleBorderWidth == 5.0)
      this.circleBorderWidth = 1.21 * SizeConfig.imageSizeMultiplier;

  }

  @override
  Widget build(BuildContext context) {
    _initializeDimensions();
    return Padding(
      padding: withoutEdges ? EdgeInsets.all(0) : EdgeInsets.all(0.72 * SizeConfig.widthMultiplier), // 3
      child: Container(
        width: circleRadius,
        height: circleRadius,
        decoration:
        ShapeDecoration(shape: CircleBorder(), color: kPrimaryLightColor),
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