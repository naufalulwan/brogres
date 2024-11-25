part of '../data.dart';

extension SplashTokenDTOMapper on SplashTokenDTO {
  SplashTokenEntity toEntity() {
    return SplashTokenEntity(
        id: const Uuid().v4(),
        error: error!,
        code: code!,
        message: message!,
        token: token!);
  }
}

extension SplashTokenMapper on SplashTokenEntity {
  SplashTokenDTO toDTO() {
    return SplashTokenDTO(
      error: error,
      code: code,
      message: message,
      token: token,
    );
  }
}
