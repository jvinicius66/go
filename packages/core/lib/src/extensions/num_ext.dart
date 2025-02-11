import '../view/views.dart' show PropotionalSize;

///
/// extension of number
///
extension NumExt on num {
  /// [height] to get [responsive height] according to device height
  double get height => PropotionalSize.heightMultiplier * this;

  /// [width] to get [responsive width] according to device width
  double get width => PropotionalSize.widthMultiplier * this;

  /// [fontSize] to get [responsive fontSize] according to device width
  // double get fontSize => (this * AppResponsive.screenWidth * .2) / 100;
  double get fontSize => PropotionalSize.textMultiplier * this;
}
