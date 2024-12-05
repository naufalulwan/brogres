import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_device_entity.freezed.dart';

@freezed
class TokenDeviceEntity with _$TokenDeviceEntity {
  const factory TokenDeviceEntity({
    @Default("") String id,
    required bool error,
    required int code,
    required String message,
    required String token,
  }) = _TokenDeviceEntity;
}
