import 'package:flutter/material.dart';

///
/// initialize calculation for responsiveness
/// must be called when the app is started
///
class PropotionalSize {
  /// Creates [PropotionalSize]
  PropotionalSize({
    required this.designScreenWidth,
    required this.designScreenHeight,
  });

  /// the value of [screen width] of design given by [PropotionalSize]
  int designScreenWidth;

  /// the value of [screen height] of design given by [PropotionalSize]
  int designScreenHeight;

  /// [width] of current device
  static late double _screenWidth;

  /// [height] of current device
  static late double _screenHeight;

  /// value to initialize [fontSize]
  static double textMultiplier = 1;

  /// value to initialize [image sizes]
  static double imageSizeMultiplier = 1;

  /// value to initialize [height] values
  static double heightMultiplier = 1;

  /// value to initialize [width] values
  static double widthMultiplier = 1;

  /// the method to initialize [SizeConfig] for responsive calculation
  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    imageSizeMultiplier = heightMultiplier = _screenHeight / designScreenHeight;
    widthMultiplier = textMultiplier = _screenWidth / designScreenWidth;
  }
}
