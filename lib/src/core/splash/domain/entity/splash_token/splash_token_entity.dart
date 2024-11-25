import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_token_entity.freezed.dart';

@freezed
class SplashTokenEntity with _$SplashTokenEntity {
  const factory SplashTokenEntity({
    @Default("") String id,
    required bool error,
    required int code,
    required String message,
    required String token,
  }) = _SplashTokenEntity;
}
