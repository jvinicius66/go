import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_widget.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(const AppWidget());
  }, (
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    Iterable<DiagnosticsNode> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) async {
    dev.log(exception.toString(), stackTrace: stack, name: 'ERROR');
  });
}
