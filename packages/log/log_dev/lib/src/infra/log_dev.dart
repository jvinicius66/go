import 'dart:convert';
import 'dart:developer' as dev;

import 'package:log_common/log_common.dart' show ILog;

///
/// Log implementation with developer package
///
final class LogDev implements ILog {
  /// Creates [LogDev]
  LogDev({
    this.printColor = true,
  });

  /// Flag to print color
  final bool printColor;

  void _print(
    final _LogType type,
    final String title, {
    final String? name,
    final dynamic data,
  }) {
    final treatName = name ?? type.name.toUpperCase();
    final treatColors = printColor ? type.color : '';
    final treatData = data == null ? '' : '\n${_handleData(data)}';

    dev.log('$treatColors$title$treatData', name: treatName);
  }

  String _handleData(final dynamic data) {
    dynamic tryConvertToMap() {
      if (data is! String || data.isEmpty) return data;

      final hasCurlyBrackets = data.startsWith('{') && data.endsWith('}');
      final hasBrackets = data.startsWith('[') && data.endsWith(']');

      if (!hasCurlyBrackets && !hasBrackets) return data;

      final decoded = jsonDecode(data);
      return decoded;
    }

    final treatData = tryConvertToMap();

    if (treatData is Map) {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyPrint = encoder.convert(treatData);
      return prettyPrint;
    }

    return data.toString();
  }

  @override
  void e(final String title, [final data, final StackTrace? stackTrace]) {
    _print(_LogType.error, title, data: data);
    if (stackTrace != null) _print(_LogType.error, title, data: stackTrace);
  }

  @override
  void i(final String title, [final data]) =>
      _print(_LogType.info, title, data: data);

  @override
  void w(final String title, [final data]) =>
      _print(_LogType.warn, title, data: data);

  @override
  void wtf(
    final String title, {
    final String? name,
    final dynamic data,
  }) =>
      _print(
        _LogType.wtf,
        title,
        data: data,
        name: name,
      );
}

enum _LogType {
  info('\x1B[34m'),
  warn('\x1B[36m'),
  error('\x1B[31m'),
  wtf('\x1B[35m'),
  ;

  const _LogType(this.color);

  final String color;
}

// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m

// 🔴 🟠 🟡 🟢 🔵 🟣 ⚫️ ⚪️ 🟤 🔘
