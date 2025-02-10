import 'package:dependencies/dependencies.dart' show BaseEntity;

import 'period.dart';

///
/// Suite entity
///
final class Suite extends BaseEntity {
  /// Creates [Suite]
  Suite({
    required this.name,
    required this.images,
    required this.periods,
  });

  /// Suite name
  final String name;

  /// Suite images
  final List<String> images;

  /// Suite periods
  final List<Period> periods;
}
