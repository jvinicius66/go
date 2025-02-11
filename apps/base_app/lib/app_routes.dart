import 'package:flutter/material.dart'
    show Route, RouteSettings, MaterialPageRoute, Placeholder;
import 'package:home/home.dart' show HomeView, HomeBind;

///
/// Routes application
///
abstract class AppRoute {
  /// Generate routes in MaterialApp
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => switch (settings.name) {
        '/' => HomeView(homeController: HomeBind.bind),
        _ => const Placeholder(),
      },
    );
  }
}
