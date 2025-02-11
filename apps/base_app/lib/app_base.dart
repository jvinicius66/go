import 'package:dependencies/dependencies.dart' show PropotionalSize;
import 'package:flutter/material.dart';

import 'flavor.dart';

///
/// Base to calculate proportional size & add banner
///
class AppBase extends StatelessWidget {
  /// Creates [AppBase]
  const AppBase({
    super.key,
    required this.child,
  });

  /// Widget child to renderize
  final Widget child;

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: Flavor.name,
              color: Flavor.color!,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          return OrientationBuilder(
            builder: (_, orientation) {
              PropotionalSize(
                designScreenWidth: 360,
                designScreenHeight: 640,
              ).init(constraints, orientation);
              return _flavorBanner(
                child: child,
                show: !Flavor.isProd,
              );
            },
          );
        },
      );
}
