import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {

  static const double DEFAULT_RADIUS = 120.0;
  static const double DEFAULT_BORDER_WIDTH = 5.0;
  double circleRadius;
  double circleBorderWidth;
  bool withoutEdges;

  final String image_url;

  ProfilePicture(this.image_url, {this.circleRadius = DEFAULT_RADIUS, this.circleBorderWidth = DEFAULT_BORDER_WIDTH});

  _initializeDimensions(){
    withoutEdges = this.circleRadius == DEFAULT_RADIUS;
    if(this.circleRadius == DEFAULT_RADIUS)
      this.circleRadius = PADDING_FACTOR_120 * SizeConfig.heightMultiplier;
    if(this.circleBorderWidth == DEFAULT_BORDER_WIDTH)
      this.circleBorderWidth = PADDING_FACTOR_5 * SizeConfig.imageSizeMultiplier;

  }

  @override
  Widget build(BuildContext context) {
    _initializeDimensions();
    return Padding(
      padding: withoutEdges ? EdgeInsets.all(PADDING_FACTOR_0) :
      EdgeInsets.all(CONTAINER_FACTOR_3 * SizeConfig.widthMultiplier), //3
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