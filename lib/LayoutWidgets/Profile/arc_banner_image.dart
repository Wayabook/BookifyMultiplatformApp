import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';

class ArcBannerImage extends StatelessWidget {

  ArcBannerImage(this.imageUrl);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: Image.network(
        imageUrl,
        width: screenWidth,
        height: (CONTAINER_FACTOR_175 * SizeConfig.heightMultiplier), //175
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {

  static const int CONTROL_POINT_FACTOR = 4;
  static const int FIRST_POINT_FACTOR = 2;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        PADDING_FACTOR_0,
        size.height - (PADDING_FACTOR_30 * SizeConfig.heightMultiplier) //30
    );

    var firstControlPoint = Offset(size.width / CONTROL_POINT_FACTOR, size.height);
    var firstPoint = Offset(size.width / FIRST_POINT_FACTOR, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / CONTROL_POINT_FACTOR), size.height);
    var secondPoint = Offset(size.width, size.height - (PADDING_FACTOR_30 * SizeConfig.heightMultiplier)); //30
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, PADDING_FACTOR_0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}