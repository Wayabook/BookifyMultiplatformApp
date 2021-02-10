import 'package:bookifyapp/Design/SizeConfig.dart';
import 'package:bookifyapp/Design/constants.dart';
import 'package:bookifyapp/Design/size_constants.dart';
import 'package:flutter/material.dart';

abstract class AbstractMarkableCard {
  static const double PADDING_FACTOR = 0.97;
  static const double DEFAULT_BORDER_FACTOR = 4.86;

  Container getCard(marked, markedColor, unmarkedColor, text, icon, fontSize,
      imageHeight, imageWidth,
      {fontWeight = FontWeight.normal,
      containerWidth = double.infinity,
      containerHeight = double.infinity,
      subContainerWidth = double.infinity,
      subContainerHeight = double.infinity,
      card = false}) {
    var child = _getImageTextColumn(icon, text,
        fontSize: fontSize,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
        fontWeight: fontWeight);
    return Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              (BORDER_RADIUS_FACTOR * SizeConfig.imageSizeMultiplier)),
          color: marked ? markedColor : unmarkedColor,
        ),
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: card
                ? getCardStructure(child)
                : _getContainerStructure(
                    child, marked, subContainerHeight, subContainerWidth)));
  }

  getCardStructure(child) {
    return Card(
        color: kPrimaryDarkColor,
        margin: EdgeInsets.all(
            (PADDING_FACTOR_10 * SizeConfig.widthMultiplier)), //10
        //shape: tapped ? _getBorder(true) : _getBorder(false),
        elevation: (PADDING_FACTOR_10 * SizeConfig.widthMultiplier), //10
        child: child);
  }

  _getContainerStructure(content, marked, height, width) {
    return Padding(
        padding: EdgeInsets.all(marked
            ? (PADDING_FACTOR * SizeConfig.imageSizeMultiplier)
            : (CONTAINER_FACTOR_2 * SizeConfig.imageSizeMultiplier)),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  (DEFAULT_BORDER_FACTOR * SizeConfig.imageSizeMultiplier)),
              color: kPrimaryLightColor),
          child: content,
        ));
  }

  _getImageTextColumn(icon, text,
      {fontSize, imageHeight, imageWidth, fontWeight = FontWeight.normal}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 8,
          child: Image.asset(icon, height: imageHeight, width: imageWidth),
        ),
        Flexible(
          flex: 2,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: kThirdDarkColor,
                fontSize: fontSize, //8
                fontWeight: fontWeight),
          ),
        )
      ],
    );
  }
}
