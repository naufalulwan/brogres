import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required int id,
    required bool error,
    required String message,
    required String username,
    required String email,
    required String level,
    required String token,
    required String refreshToken,
    required String type,
  }) = _LoginEntity;
}
