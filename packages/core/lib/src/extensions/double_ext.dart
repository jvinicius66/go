import 'package:intl/intl.dart';

///
/// double extensions
///
extension DoubleExt on double {
  /// currency format
  String get toFormat => NumberFormat.simpleCurrency(locale: 'pt').format(this);

  /// simple currency format
  String get toSimpleFormat => NumberFormat.simpleCurrency(
        locale: 'pt',
        name: '',
      ).format(this);
}
