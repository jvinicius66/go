import 'package:dependencies/dependencies.dart' show BaseModel;

import '../../domain/entities/entities.dart' show Suite;
import '../exceptions/exceptions.dart' show ParseException;
import 'period_model.dart';

///
/// Suite motel
///
final class SuiteModel extends BaseModel {
  /// Creates [SuiteModel]
  SuiteModel({
    required this.name,
    required this.images,
    required this.periods,
  });

  /// Name of suite
  final String name;

  /// Images from suite
  final List<String> images;

  /// Periods of the suite
  final List<PeriodModel> periods;

  /// Load from map
  factory SuiteModel.fromMap(Map<String, dynamic> map) {
    if (map
        case {
          'nome': final String name,
          'fotos': final List images,
          'periodos': final List periods,
        } when name.isNotEmpty && images.isNotEmpty && periods.isNotEmpty) {
      return SuiteModel(
        name: name,
        images: List<String>.from(images),
        periods: PeriodModel.fromMapList(periods),
      );
    } else {
      throw ParseException(
        message: 'There was an error converting the suite data',
      );
    }
  }

  /// Export to entity list
  static List<Suite> toEntityList(List<SuiteModel>? list) {
    if (list == null) return [];
    return list.map<Suite>((e) => e.toEntity).toList();
  }

  /// Load from map list
  static List<SuiteModel> fromMapList(List? list) {
    if (list == null) return [];
    final suiteModelList = list.map<SuiteModel>(
      (el) {
        return SuiteModel.fromMap(
          Map<String, dynamic>.from(el),
        );
      },
    ).toList();

    return suiteModelList;
  }

  @override
  Suite get toEntity => Suite(
        images: images,
        name: name,
        periods: periods.map((p) => p.toEntity).toList(),
      );
}
