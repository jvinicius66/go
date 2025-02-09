import '../../domain/entity/entity.dart';

///
/// Base model
///
abstract class BaseModel {
  /// Mapper model to entity
  BaseEntity get toEntity;
}
