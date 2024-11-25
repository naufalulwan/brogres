part of '../data.dart';

extension LoginDTOMapper on LoginDTO {
  LoginEntity toEntity() {
    return LoginEntity(
        id: id!,
        error: error!,
        message: message!,
        username: userDTO!.username!,
        email: userDTO!.email!,
        level: userDTO!.level!,
        token: authorizationDTO!.token!,
        refreshToken: authorizationDTO!.refreshToken!,
        type: authorizationDTO!.type!);
  }
}

extension LoginMapper on LoginEntity {
  LoginDTO toDTO() {
    return LoginDTO(
      id: id,
      error: error,
      message: message,
      userDTO: UserDTO(
        username: username,
        email: email,
        level: level,
      ),
      authorizationDTO: AuthorizationDTO(
        token: token,
        refreshToken: refreshToken,
        type: type,
      ),
    );
  }
}
