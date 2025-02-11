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
      builder: (_, child) => AppBase(child: child!),
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
}
