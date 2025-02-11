import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

import 'flavor.dart';

/// App Widget
class AppWidget extends StatefulWidget {
  /// Creates [AppWidget]
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
      ),
      builder: (_, child) => _AppBuilder(
        _flavorBanner(
          child: child!,
          show: !Flavor.isProd,
        ),
      ),
      title: 'Go',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => switch (settings.name) {
            '/' => HomeView(homeController: HomeBind.bind),
            _ => const Placeholder(),
          },
        );
      },
    );
  }

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
}

class _AppBuilder extends LayoutBuilder {
  _AppBuilder(Widget child)
      : super(
          builder: (_, constraints) {
            return OrientationBuilder(
              builder: (_, orientation) {
                PropotionalSize(
                  designScreenWidth: 360,
                  designScreenHeight: 640,
                ).init(constraints, orientation);
                return child;
              },
            );
          },
        );
}
