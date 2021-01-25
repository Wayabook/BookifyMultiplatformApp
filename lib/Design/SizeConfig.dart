import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print("Screenwidth:" + (_screenWidth.toString()));
    print("Screenheight:" + (_screenHeight.toString()));
    print("BlockWidth:" + (_blockWidth.toString()));
    print("BlockHeight:" + (_blockHeight.toString()));
    print("TextMultiplier:" + (textMultiplier.toString()));
    print("ImageSizeMultiplier:" + (imageSizeMultiplier.toString()));
  }

  void initDefault(){
    _blockWidth = 4.11;
    _blockHeight = 6.83;

    textMultiplier = 6.83;
    imageSizeMultiplier = 4.11;
    heightMultiplier = 6.83;
    widthMultiplier = 4.11;
  }
}