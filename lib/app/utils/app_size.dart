import 'package:flutter/material.dart';

class AppSize {
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;
  static double screenHeight = 0;
  static double screenWidth = 0;

  static MediaQueryData? _mediaQueryData;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width ?? 0;
    screenHeight = _mediaQueryData?.size.height ?? 0;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal = (_mediaQueryData?.padding.left ?? 0) +
        (_mediaQueryData?.padding.right ?? 0);
    _safeAreaVertical = (_mediaQueryData?.padding.top ?? 0) +
        (_mediaQueryData?.padding.bottom ?? 0);
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  static double getTextSize(double size) {
    return size;
  }
}
