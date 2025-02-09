import 'dart:convert';

///
/// Extension from [Map]
///
extension MapExt on Map {
  /// Print pretty map
  String get print {
    const encoder = JsonEncoder.withIndent('  ');
    final prettyprint = encoder.convert(this);
    return prettyprint;
  }
}
