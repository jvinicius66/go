import 'package:dependencies/dependencies.dart' show BaseEntity;

///
/// Pediod entity
///
final class Period extends BaseEntity {
  /// Creates [Period]
  Period({
    required this.formattedTime,
    required this.time,
    required this.value,
  });

  /// Formatted time
  final String formattedTime;

  /// Time of period
  final String time;

  /// Value from period
  final double value;
}
