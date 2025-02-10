import 'dart:developer' as dev;
import 'package:log_common/log_common.dart' show ILog;
import 'package:logger/logger.dart';

///
/// Log implementation with Logger
///
final class LogLogger implements ILog {
  late Logger _logger;

  ///
  /// Creates [LogLogger]
  /// With parameter to print color
  ///
  LogLogger({
    this.printColor = true,
  }) {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 86,
        colors: printColor,
        printEmojis: false,
        dateTimeFormat: DateTimeFormat.none,
      ),
      output: _DevOutput(),
    );
  }

  /// Flag to print color
  final bool printColor;

  @override
  void e(final String title, [final data, StackTrace? stackTrace]) {
    _logger.e(title);
    if (data != null) _logger.e(data, stackTrace: stackTrace);
  }

  @override
  void i(final String title, [final data]) {
    _logger.i(title);
    if (data != null) _logger.i(data);
  }

  @override
  void w(final String title, [final data]) {
    _logger.w(title);
    if (data != null) _logger.w(data);
  }

  @override
  void wtf(final String title, {final String? name, final data}) {
    _logger.d(title);
    if (data != null) _logger.d(data);
  }
}

class _DevOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      dev.log(line, name: event.level.group);
    }
  }
}

extension _LevelExt on Level {
  String get group => switch (this) {
        Level.debug => 'DEB',
        Level.info => 'INF',
        Level.error => 'ERR',
        Level.fatal => 'FAT',
        Level.trace => 'TRA',
        Level.warning => 'WAR',
        _ => ' ',
      };
}
