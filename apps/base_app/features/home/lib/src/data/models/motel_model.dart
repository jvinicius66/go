import 'package:dependencies/dependencies.dart' show BaseModel;

import '../../domain/entities/entities.dart' show Motel;
import '../exceptions/exceptions.dart' show ParseException;
import 'suite_model.dart';

///
/// Motel model
///
final class MotelModel extends BaseModel {
  /// Creates [MotelModel]
  MotelModel({
    required this.name,
    required this.image,
    required this.suites,
  });

  /// Motel name
  final String name;

  /// Motel logo
  final String image;

  /// List of suites
  final List<SuiteModel> suites;

  /// Motel model from map data
  factory MotelModel.fromMap(Map<String, dynamic> map) {
    if (map
        case {
          'fantasia': final String name,
          'logo': final String image,
          'suites': final List suites,
        } when name.isNotEmpty && image.isNotEmpty && suites.isNotEmpty) {
      return MotelModel(
        name: name,
        image: image,
        suites: SuiteModel.fromMapList(suites),
      );
    } else {
      throw ParseException(
        message: 'There was an error converting the motel data',
      );
    }
  }

  /// Export to [Motel] list
  static List<Motel> toEntityList(List<MotelModel>? list) {
    if (list == null) return [];
    return list.map<Motel>((e) => e.toEntity).toList();
  }

  /// Load from map list
  static List<MotelModel> fromMapList(List? list) {
    if (list == null) return [];
    final motelModelList = list.map<MotelModel>(
      (el) {
        return MotelModel.fromMap(
          Map<String, dynamic>.from(el),
        );
      },
    ).toList();

    return motelModelList;
  }

  @override
  Motel get toEntity => Motel(
        name: name,
        image: image,
        suites: suites.map((s) => s.toEntity).toList(),
      );
}
