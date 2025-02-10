import 'package:dependencies/dependencies.dart' show BaseModel;

import '../../domain/entities/entities.dart' show Period;
import '../exceptions/exceptions.dart' show ParseException;

///
/// Period model
///
final class PeriodModel extends BaseModel {
  /// Creates [PeriodModel]
  PeriodModel({
    required this.formattedTime,
    required this.time,
    required this.value,
  });

  /// Formatted time
  final String formattedTime;

  /// Time
  final String time;

  /// Value
  final double value;

  /// Load from map
  factory PeriodModel.fromMap(Map<String, dynamic> map) {
    if (map
        case {
          'tempoFormatado': final String formattedTime,
          'tempo': final String time,
          'valor': final double value,
        } when formattedTime.isNotEmpty && time.isNotEmpty && value > .0) {
      return PeriodModel(
        formattedTime: formattedTime,
        time: time,
        value: value,
      );
    } else {
      throw ParseException(
        message: 'There was an error converting the period data',
      );
    }
  }

  /// Export to entity list
  static List<Period> toEntityList(List<PeriodModel>? list) {
    if (list == null) return [];
    return list.map<Period>((e) => e.toEntity).toList();
  }

  /// Load from map list
  static List<PeriodModel> fromMapList(List? list) {
    if (list == null) return [];
    final periodModelList = list.map<PeriodModel>(
      (el) {
        return PeriodModel.fromMap(
          Map<String, dynamic>.from(el),
        );
      },
    ).toList();

    return periodModelList;
  }

  @override
  Period get toEntity => Period(
        formattedTime: formattedTime,
        time: time,
        value: value,
      );
}
