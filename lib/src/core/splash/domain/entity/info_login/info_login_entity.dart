import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_login_entity.freezed.dart';

@freezed
class InfoLoginEntity with _$InfoLoginEntity {
  const factory InfoLoginEntity({
    required int id,
    required String username,
    required String deviceId,
    required bool isSaveInfo,
  }) = _InfoLoginEntity;
}
