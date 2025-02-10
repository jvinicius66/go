import 'package:dependencies/dependencies.dart' show BaseEntity;

import 'suite.dart';

///
/// Motel entity
///
final class Motel extends BaseEntity {
  /// Creates [Motel]
  Motel({
    required this.name,
    required this.image,
    required this.suites,
  });

  /// Motel name
  final String name;

  /// Motel image
  final String image;

  /// Motel suites
  final List<Suite> suites;
}
