part of '../data.dart';

extension LoginDTOMapper on LoginDTO {
  LoginEntity toEntity() {
    return LoginEntity(
        id: id!,
        error: error!,
        message: message!,
        username: user!.username!,
        email: user!.email!,
        level: user!.level!,
        token: authorization!.token!,
        refreshToken: authorization!.refreshToken!,
        type: authorization!.type!);
  }
}

extension LoginMapper on LoginEntity {
  LoginDTO toDTO() {
    return LoginDTO(
      id: id,
      error: error,
      message: message,
      user: UserDTO(
        username: username,
        email: email,
        level: level,
      ),
      authorization: AuthorizationDTO(
        token: token,
        refreshToken: refreshToken,
        type: type,
      ),
    );
  }
}
