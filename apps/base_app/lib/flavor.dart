import 'package:flutter/material.dart';

/// FlavorEnum enumeration
enum FlavorEnum {
  /// Production
  prod,

  /// Development
  dev,

  /// Homologation
  hml,
  ;
}

/// Flavor class
class Flavor {
  static const _appName = 'Go';

  /// FlavorEnum instance
  static FlavorEnum? appFlavor;

  /// Get title by flavor
  static String get title {
    switch (appFlavor) {
      case FlavorEnum.prod:
        return _appName;
      case FlavorEnum.dev:
        return '$_appName - dev';
      case FlavorEnum.hml:
        return '$_appName - hml';
      default:
        return 'UNKNOW';
    }
  }

  /// Get name flavor
  static String get name => appFlavor?.name.toUpperCase() ?? '';

  /// Get is dev
  static bool get isDev => appFlavor == FlavorEnum.dev;

  /// Get is homolog
  static bool get isHml => appFlavor == FlavorEnum.hml;

  /// Get is production
  static bool get isProd => appFlavor == FlavorEnum.prod;

  /// Get description by flavor
  static String get description => switch (appFlavor) {
        FlavorEnum.dev => 'Desenvolvimento',
        FlavorEnum.hml => 'Homologação',
        FlavorEnum.prod => 'Produção',
        _ => 'UNKNOW',
      };

  /// Get color by flavor
  static Color? get color => switch (appFlavor) {
        FlavorEnum.dev => Colors.red,
        FlavorEnum.hml => Colors.amber[700],
        FlavorEnum.prod => Colors.transparent,
        _ => Colors.transparent,
      };
}
